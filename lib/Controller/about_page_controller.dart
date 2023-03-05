import 'package:get/get.dart';

class AboutPageController extends GetxController {
  RxList carouselText = [
    "GOEC super charging station Provides High ROI",
    "operate your charging station from anywhere in the world without human intervention.",
    "For a future-focused business, capitalize on the growing EV market."
  ].obs;
  RxList carouselsvgImage = [
    "assets/svg/carousel1.svg",
    "assets/svg/carousel1.svg",
    "assets/svg/carousel1.svg",
  ].obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
