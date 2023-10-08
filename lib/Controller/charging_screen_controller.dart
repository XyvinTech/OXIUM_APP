import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Singletones/dialogs.dart';
import 'package:freelancer_app/Singletones/socketRepo.dart';
import 'package:freelancer_app/Utils/local_notifications.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../Singletones/dialogs.dart';
import '../Utils/routes.dart';
import '../Utils/utils.dart';

class ChargingScreenController extends GetxController {
  // connected finished completed disconnected progress
  RxString chargingStatus = "".obs;
  String stationId = '';
  String chargerName = '';
  String chargingPoint = '';
  String bookingVia = '';
  Timer? _timer;
  Rx<ChargingStatusModel> status_model = kChargingStatusModel.obs;
  Rx<BookingModel> booking_model = kBookingModel.obs;
  RxList<int> time = [0, 0].obs;
  String qr_or_app_data = '';
  onInit() {
    super.onInit();
    qr_or_app_data =
        Get.arguments != null ? Get.arguments[0] ?? '253-z1-1-Q' : '444-t1-1-Q';
    booking_model.value = Get.arguments != null
        ? Get.arguments[1] ?? kBookingModel
        : kBookingModel;
    kLog(qr_or_app_data);
    List<String> seperator = qr_or_app_data.split('-');
    stationId = seperator[0];
    chargerName = seperator[1];
    chargingPoint = seperator[2];
    bookingVia = seperator[3];
    if (booking_model.value.status == 'R') {
      getChargingStatus(booking_model.value.bookingId);
    } else {
      changeStatus(isStart: true, bookingId: booking_model.value.bookingId);
    }
  }

  onClose() {
    super.onClose();
    _timer?.cancel();
  }

  Future changeStatus({required bool isStart, required int bookingId}) async {
    showLoading(kLoading);
    bool res = await CommonFunctions().changeChargingStatus(
        isStart: isStart,
        bookingId: bookingId.toString(),
        chargerName: chargerName,
        chargingPoint: chargingPoint);
    hideLoading();
    if (res) {
      if (isStart) getChargingStatus(bookingId);
    } else
      toDisconnected();
  }

  Future getChargingStatus(int bookingId) async {
    // _timer = Timer.periodic(Duration(seconds: 7), (timer) async {

    ChargingStatusModel res =
        await CommonFunctions().getChargingStatus(bookingId.toString());
    if (res.Connector != -1) status_model.value = res;
    res = kChargingStatusModel;
    //Try untill the transaction table updated by charger.
    while (status_model.value.tran_id == -1 &&
        status_model.value.Connector != -1) {
      res = await CommonFunctions().getChargingStatus(bookingId.toString());
      if (res.Connector != -1) status_model.value = res;
      res = kChargingStatusModel;
      kLog('retry');
    }
    _repeatCall();
    status_model.value.Capacity = booking_model.value.capacity;
    status_model.value.OutputType = booking_model.value.outputType;
    status_model.value.ConnectorType = booking_model.value.connectorType;
    status_model.value.amount =
        (booking_model.value.tariff) * status_model.value.unit;
    status_model.value.taxamount =
        (booking_model.value.taxes) * status_model.value.unit;
    Timer? _timer;
    String time = '';
    bool showLowBalanceOnlyOnce = true;
////INIT WEBSOCKET FROM HERE

    await Future.delayed(Duration(seconds: 5));
    SocketRepo().initSocket(
        bookingId: bookingId,
        tranId: status_model.value.tran_id,
        fun: (message) {
          _timer?.cancel();
          if (message['status'] == 'C') {
            status_model.value.status = 'C';
          } else if (message != null) {
            status_model.value = ChargingStatusModel.fromJson(message);
          }
          if (showLowBalanceOnlyOnce && status_model.value.balance < 50) {
            showLowBalanceOnlyOnce = false;
            Dialogs().notEnoughCreditPopUp(balance: status_model.value.balance);
          }
          appData.userModel.value.balanceAmount = status_model.value.balance;
          status_model.value.Capacity = booking_model.value.capacity;
          status_model.value.OutputType = booking_model.value.outputType;
          status_model.value.ConnectorType = booking_model.value.connectorType;
          status_model.value.amount =
              (booking_model.value.tariff) * status_model.value.unit;
          status_model.value.taxamount =
              (booking_model.value.taxes) * status_model.value.unit;
          kLog(status_model.value.toJson().toString());
          _repeatCall();
// This timer is for if there is no update within the interval then close the session by checking /bookingStatus api
          if (status_model.value.status == 'R' ||
              status_model.value.status == 'I')
            _timer = Timer.periodic(Duration(seconds: 30), (timer) async {
              kLog('getting status from loop');
              var res = await CommonFunctions()
                  .getChargingStatus(bookingId.toString());
              if (res.Connector != -1) status_model.value = res;
              _repeatCall();
              if (status_model.value.status != 'R') _timer?.cancel();
            });
          time = status_model.value.lastupdated;
        });
    // });
  }

  _repeatCall() async {
    //pop the dialog if status not I and dialog is opened.
    if (Get.isDialogOpen == true &&
        status_model.value.status != 'I' &&
        chargingStatus.value == 'initiating') {
      Get.back();
    }
    if (Get.isDialogOpen == true &&
        chargingStatus.value == 'finishing' &&
        chargingStatus.value != 'R') {
      Get.back();
    }
    //Normal status check starts from here
    if (status_model.value.status == 'I') {
      if (Get.isDialogOpen == false)
        Dialogs().gunStatusAlert('Plug in the Connector',
            'Please make sure the connector is plugged-in');
      toInitiating();
    } else if (status_model.value.status == 'R') {
      //IF CHARGING STARTED
      if (chargingStatus.value != 'progress' &&
          chargingStatus.value != 'finishing') {
        toConnected();

        Future.delayed(Duration(seconds: 1), () => toProgress());
      } else if (chargingStatus.value == 'progress') {
        time.value = getTimeDifference(
            startTime: status_model.value.startTime,
            endtime: status_model.value.lastupdated);
        NotificationService()
            .createLocalNotification(100, status_model.value.SOC, 1);
      }
    } else if (status_model.value.status == 'C') {
      toCompleted();
      _timer?.cancel();
      NotificationService().cancelLocalNotification(1);
    } else if (status_model.value.status.isNotEmpty &&
        status_model.value.status == 'E') {
      toDisconnected();
      _timer?.cancel();
      NotificationService().cancelLocalNotification(1);
    } else if (status_model.value.status.isEmpty) {
      toReconnect();
    } else {
      toFinished();
      SocketRepo().closeSocket();
      NotificationService().cancelLocalNotification(1);
    }
  }

  onClickFinished() {
    Get.toNamed(Routes.shareExperiencePageRoute,
        arguments: [qr_or_app_data, status_model.value]);
  }

  downloadInvoice() async {
    await CommonFunctions()
        .downloadBookingInvoice(booking_model.value.bookingId);
  }

  toConnected() {
    chargingStatus.value = "connected";
  }

  toFinished() {
    chargingStatus.value = "finished";
  }

  toCompleted() {
    chargingStatus.value = "completed";
  }

  toDisconnected() {
    chargingStatus.value = "disconnected";
  }

  toProgress() {
    chargingStatus.value = "progress";
  }

  toReconnect() {
    chargingStatus.value = "";
  }

  toInitiating() {
    chargingStatus.value = "initiating";
  }
}
