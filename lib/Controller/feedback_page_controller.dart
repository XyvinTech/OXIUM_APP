import 'package:get/get.dart';

class FeedBackPageController extends GetxController {
  RxString selectName = "Payment Process".obs;
  RxList selected = [
    "Payment Process",
    "Charging Experience",
    "Finding Your destination",
    "Custom"
  ].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
