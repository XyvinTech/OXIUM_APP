import 'package:get/get.dart';

class ChargingScreenController extends GetxController {
  // connected finished completed disconnected progress
  RxString chargignStatus = "".obs;

  toConnected() {
    chargignStatus.value = "connected";
  }
  toFinished() {
   chargignStatus.value = "finished";
  }
  toCompleted() {
    chargignStatus.value = "completed";
  }
  toDisconnected() {
    chargignStatus.value = "disconnected";
  }
  toProgress() {
    chargignStatus.value = "progress";
  }
  toReconnect(){
    chargignStatus.value = "";
  }
}
