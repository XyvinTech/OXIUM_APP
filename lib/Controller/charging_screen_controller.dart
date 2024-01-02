import 'dart:async';
import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Singletones/dialogs.dart';
import 'package:freelancer_app/Singletones/socketRepo.dart';
import 'package:freelancer_app/Utils/local_notifications.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import '../Utils/routes.dart';
import '../Utils/utils.dart';

class ChargingScreenController extends GetxController {
  // connected finished completed disconnected progress
  RxString chargingStatus = "".obs;
  // String stationId = '';
  String chargerName = '';
  String chargingPoint = '';
  // String bookingVia = '';
  Timer? _timer;
  Rx<ChargingStatusModel> status_model = kChargingStatusModel.obs;
  Rx<BookingModel> booking_model = kBookingModel.obs;
  RxList<int> time = [0, 0].obs;
  String qr_or_app_data = '';
  bool showLowBalanceOnlyOnce = true;
  ChargingStatusModel rest_api_status_model = kChargingStatusModel;
  onInit() {
    super.onInit();
    qr_or_app_data =
        Get.arguments != null ? Get.arguments[0] ?? '253-z1-1-Q' : '444-t1-1-Q';
    booking_model.value = Get.arguments != null
        ? Get.arguments[1] ?? appData.tempBookingModel
        : appData.tempBookingModel;
    kLog(qr_or_app_data);
    kLog(Get.arguments.toString());
    List<String> seperator = qr_or_app_data.split('-');
    // stationId = seperator[0];
    chargerName = seperator[1];
    chargingPoint = seperator[2];
    // bookingVia = seperator[3];
    if (booking_model.value.status == 'R' ||
        booking_model.value.status == 'U') {
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
    // showLoading(kLoading);
    bool res = await CommonFunctions().changeChargingStatus(
        isStart: isStart,
        bookingId: bookingId.toString(),
        chargerName: chargerName,
        chargingPoint: chargingPoint);
    // hideLoading();
    if (res && isStart) {
      getChargingStatus(bookingId);
    } else if (res) {
      // toDisconnected();
    } else if (isStart) toDisconnected();
  }

  ///ChargingStatus
  Future getChargingStatus(int bookingId) async {
    // _timer = Timer.periodic(Duration(seconds: 7), (timer) async {

    ChargingStatusModel res =
        await CommonFunctions().getChargingStatus(bookingId.toString());
    if (res.connector != -1) {
      rest_api_status_model = status_model.value = res;
    }
    res = kChargingStatusModel;

    //? Try untill the transaction table updated by charger.
    while (status_model.value.tran_id == -1 &&
        status_model.value.connector != -1) {
      res = await CommonFunctions().getChargingStatus(bookingId.toString());
      if (res.connector != -1) status_model.value = res;
      res = kChargingStatusModel;
      await Future.delayed(Duration(seconds: 10));
    }
    //? ///////////////////
    kLog('rest: ' + rest_api_status_model.toJson().toString());
    showLowBalanceOnlyOnce = true;
    _repeatCall();

    status_model.value.capacity = booking_model.value.capacity == 0
        ? rest_api_status_model.capacity
        : booking_model.value.capacity;
    status_model.value.outputType = booking_model.value.outputType.isEmpty
        ? rest_api_status_model.outputType
        : booking_model.value.outputType;
    status_model.value.connectorType = booking_model.value.connectorType.isEmpty
        ? rest_api_status_model.connectorType
        : booking_model.value.connectorType;
    status_model.value.amount =
        (booking_model.value.tariff) * status_model.value.unit;
    status_model.value.taxamount =
        (booking_model.value.taxes) * status_model.value.unit;
    kLog('post rest: ' + status_model.toJson().toString());
    Timer? _timer;
    // String time = '';

/////INIT WEBSOCKET FROM HERE

    await SocketRepo().closeSocket();
    SocketRepo().initSocket(
        bookingId: bookingId,
        tranId: status_model.value.tran_id,
        fun: (message) {
          _timer?.cancel();
          if (message != null && message['status'] == 'C') {
            status_model.value.status = 'C';
          } else if (message != null) {
            status_model.value = ChargingStatusModel.fromJson(message);
          }

          appData.userModel.value.balanceAmount = status_model.value.balance;

          status_model.value.capacity = booking_model.value.capacity == 0
              ? rest_api_status_model.capacity
              : booking_model.value.capacity;
          status_model.value.outputType = booking_model.value.outputType.isEmpty
              ? rest_api_status_model.outputType
              : booking_model.value.outputType;
          status_model.value.connectorType =
              booking_model.value.connectorType.isEmpty
                  ? rest_api_status_model.connectorType
                  : booking_model.value.connectorType;

          status_model.value.amount =
              (booking_model.value.tariff) * status_model.value.unit;
          status_model.value.taxamount =
              (booking_model.value.taxes) * status_model.value.unit;
          kLog("socket: " + status_model.value.toJson().toString());
          _repeatCall();
// This timer is for if there is no update within the interval then close the session by checking /bookingStatus api
          if (status_model.value.status == 'R' ||
              status_model.value.status == 'I' ||
              status_model.value.status == 'U')
            _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
              kLog('getting status from loop');
              var res = await CommonFunctions()
                  .getChargingStatus(bookingId.toString());
              if (res.connector != -1) status_model.value = res;
              _repeatCall();
              if (status_model.value.status != 'R' &&
                  status_model.value.status != 'I') _timer?.cancel();
            });
          // time = status_model.value.lastupdated;
        });
    // });
  }

  _repeatCall() async {
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
            startTime: booking_model.value.start_time,
            endtime: DateTime.now().toIso8601String());
        NotificationService()
            .createLocalNotification(100, status_model.value.soc, 1);
      }
    } else if (status_model.value.status == 'C') {
      // toCompleted();
      toFinished();
      _timer?.cancel();
      NotificationService().cancelLocalNotification(1);
    } else if (status_model.value.status.isNotEmpty &&
        (status_model.value.status == 'E' ||
            status_model.value.status == 'F')) {
      toDisconnected();
      _timer?.cancel();
      NotificationService().cancelLocalNotification(1);
    } else if (status_model.value.status.isEmpty ||
        status_model.value.status == 'U') {
      toReconnect();
    } else {
      toFinished();
      SocketRepo().closeSocket();
      NotificationService().cancelLocalNotification(1);
    }

    //pop the dialog if status not I and dialog is opened.
    kLog("repeat: " + chargingStatus.value);
    if (Get.currentRoute == Routes.chargingPageRoute &&
        Get.isDialogOpen == true &&
        status_model.value.status != 'I' &&
        (chargingStatus.value == 'connected' ||
            chargingStatus.value == 'disconnected')) {
      kLog('kill from init');
      Get.back();
    }
    if (Get.currentRoute == Routes.chargingPageRoute &&
        Get.isDialogOpen == true &&
        chargingStatus.value == 'finishing' &&
        status_model.value.status != 'R') {
      kLog('kill from finish');
      Get.back();
    }
    if (status_model.value.tran_id == -1 &&
        Get.isDialogOpen != true &&
        showLowBalanceOnlyOnce &&
        status_model.value.status == 'R' &&
        status_model.value.balance < appData.gettingLowAllertValue) {
      showLowBalanceOnlyOnce = false;
      Dialogs().notEnoughCreditPopUp(balance: status_model.value.balance);
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
