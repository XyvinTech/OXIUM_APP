import 'dart:async';

import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

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
  onInit() {
    super.onInit();
    String qr_or_app_data = Get.arguments[0] ?? '253-z1-1-Q-123';
    booking_model.value = Get.arguments[1] ?? kBookingModel;
    kLog(qr_or_app_data);
    List<String> seperator = qr_or_app_data.split('-');
    stationId = seperator[0];
    chargerName = seperator[1];
    chargingPoint = seperator[2];
    bookingVia = seperator[3];
    // createBooking();
    changeStatus(isStart: true, bookingId: booking_model.value.bookingId);
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
    if (res)
      getChargingStatus(bookingId);
    else
      toDisconnected();
  }

  Future getChargingStatus(bookingId) async {
    _timer = Timer.periodic(Duration(seconds: 7), (timer) async {
      status_model.value = await CommonFunctions().getChargingStatus(bookingId);
      kLog(status_model.value.toJson().toString());
      if (status_model.value.status == 'S' ||
          status_model.value.status == 'R' &&
              status_model.value.Chargingstatus == 'I')
        toReconnect();
      else if (status_model.value.status == 'R' &&
          status_model.value.Chargingstatus == 'R') {
        //IF CHARGING STARTED
        if (chargingStatus.value != 'progress') {
          toConnected();
          Future.delayed(Duration(seconds: 1), () => toProgress());
        }
      } else if (status_model.value.status == 'R' &&
          chargingStatus.value == 'C') {
        toCompleted();
      }
      {
        toDisconnected();
      }
    });
  }
}
