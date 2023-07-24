import 'dart:async';

import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/local_notifications.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

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
    // saveToSharedPreferences();
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
    // getChargingStatus(529);
  }

  onClose() {
    super.onClose();
    _timer?.cancel();
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

  // Future createBooking() async {
  //   toReconnect();
  //   showLoading(kLoading);
  //   BookingModel res = await CommonFunctions().createBooking(
  //       chargerName: chargerName,
  //       chargingPoint: chargingPoint,
  //       userEvId: 366,
  //       bookingVia: bookingVia);
  //   hideLoading();
  //   if (res.bookingId != -1) {
  //     changeStatus(isStart: true, bookingId: res.bookingId);
  //   }
  // }

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
    _timer = Timer.periodic(Duration(seconds: 7), (timer) async {
      status_model.value =
          await CommonFunctions().getChargingStatus(bookingId.toString());
      kLog(status_model.value.toJson().toString());

      // if (status_model.value.Chargingstatus == 'I' && !Get.isDialogOpen!) {
      //   Dialogs().connectPortTipDialog();
      // } else if (status_model.value.Chargingstatus != 'I' &&
      //     Get.isDialogOpen!) {
      //   Get.back();
      // }

      if (status_model.value.status == 'S' ||
          status_model.value.status == 'R' &&
              status_model.value.Chargingstatus == 'I') {
        toInitiating();
      } else if (status_model.value.status == 'R' &&
          status_model.value.Chargingstatus == 'R') {
        //IF CHARGING STARTED
        if (chargingStatus.value != 'progress' &&
            chargingStatus.value != 'finishing') {
          toConnected();
          print(status_model.value.startTime);

          Future.delayed(Duration(seconds: 1), () => toProgress());
        } else if (chargingStatus.value == 'progress') {
          time.value = getTimeDifference(
              startTime: status_model.value.startTime,
              endtime: status_model.value.lastupdated);
          NotificationService()
              .createLocalNotification(100, status_model.value.SOC, 1);
        }
      } else if (status_model.value.status == 'R' &&
          chargingStatus.value == 'C') {
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
        _timer?.cancel();
         NotificationService().cancelLocalNotification(1);
      }
    });
  }

  onClickFinished() {
    Get.toNamed(Routes.shareExperiencePageRoute,
        arguments: [qr_or_app_data, status_model.value]);
  }

  downloadInvoice() async {
    await CommonFunctions()
        .downloadBookingInvoice(booking_model.value.bookingId);
  }
}
