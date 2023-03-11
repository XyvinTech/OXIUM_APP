import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:get/get.dart';

class PartnerPageController extends GetxController {
  CarouselController? carouselController;
  RxDouble currentIndex = 0.0.obs;
  String phnNumber = "+8801751051339";
  RxString country = "91".obs;
  RxString countryName = "Country".obs;
  RxString textfield = "".obs;
  RxInt reload = 0.obs;
  List<String> states = [];
  RxList<String> stateCitys = RxList();
  String? selectedState = null;
  String? selectedCity = null;
  Map<String, dynamic> data = {};

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
  void onInit() async {
    super.onInit();
    initStatesFromJson();
  }

  initStatesFromJson() async {
    data = await loadJsonFromAsset("assets/Indian_Cities_In_States_JSON.json");
    data.forEach((key, value) {
      states.add(key);
    });
    reload++;
  }

  onChangeStateGetCityList(String? value) {
    if (value == null || value.isEmpty) return;
    selectedState = value;
    List<String> list = [];
    data[selectedState].forEach((element) {
      if (element == null || element.isEmpty) return;
      list.add(element.toString());
    });
    selectedCity = null;
    stateCitys.value = list.toSet().toList();
    reload++;
  }

  onChangeCity(String? value) {
    selectedCity = value;
    reload++;
  }
}
