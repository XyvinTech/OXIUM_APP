import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class RfidPageController extends GetxController {
  RxList carouselText = [
    "GOEC super charging station Provides High ROI",
    "operate your charging station from anywhere in the world without human intervention.",
    "For a future-focused business, capitalize on the growing EV market."
  ].obs;
  RxList carouselImage = [
   "assets/images/carouselOne.png",
    "assets/images/carouselTwo.png",
    "assets/images/carouselThree.png",
  ].obs;
  CarouselController? carouselController;
  RxDouble currentIndex = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
