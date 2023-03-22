import 'package:get/get.dart';

class ChargingScreenController extends GetxController {
  // connected finished completed disconnected progress
  RxString chargingStatus = "".obs;

  onInit() {
    super.onInit();
  }

  onClose() {
    super.onClose();
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
}
