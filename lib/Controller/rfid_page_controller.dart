import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class RfidPageController extends GetxController {
  List<dynamic> carouselText = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
  ];
  CarouselController? carouselController;
  RxDouble currentIndex = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
