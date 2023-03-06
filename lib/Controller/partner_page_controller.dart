import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnerPageController extends GetxController {
  CarouselController? carouselController;
  RxDouble currentIndex = 0.0.obs;
  String phnNumber = "+8801751051339";
  RxString country = "91".obs;
  RxString countryName = "Country".obs;
  RxString textfield = "".obs;
  RxInt reload = 0.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController phnNumberController = TextEditingController();
  // List<dynamic> carouselText = [
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
  // ];
  RxList carouselText = [
    "GOEC super charging station Provides High ROI",
    "operate your charging station from anywhere in the world without human intervention.",
    "For a future-focused business, capitalize on the growing EV market."
  ].obs;
  RxList carouselImage = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.png",
    "assets/images/carousel3.png",
  ].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
