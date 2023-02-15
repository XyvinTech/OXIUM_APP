import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/trips_screen_controller.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/Utils/image_byte_converter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'chargePage_controller.dart';

class HomePageController extends GetxController {
  RxDouble height = 80.0.obs;
  RxString name = ''.obs;
  RxString done = 'do'.obs;
  RxInt activeIndex = 0.obs;
  RxInt reload = 0.obs;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  PageController pageController = PageController();
  PanelController panelController = PanelController();
  final ChargeScreenController chargeScreenController =
      Get.put(ChargeScreenController());
  final tripsScreenController = Get.put(TripsScreenController());

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    MapFunctions().bytesBlue = await ImageByteConverter.getBytesFromAsset(
        "assets/svg/blue_marker.png", 50);
    MapFunctions().bytesGreen = await ImageByteConverter.getBytesFromAsset(
        "assets/svg/green_marker.png", 50);
    MapFunctions().navigationMarker =
        await ImageByteConverter.getBytesFromAsset(
            "assets/images/pointer.png", 50);
    MapFunctions().carMarker = await ImageByteConverter.getBytesFromAsset(
        "assets/images/CSAR.png", 70);
    MapFunctions().myMarker = await ImageByteConverter.getBytesFromAsset(
        "assets/images/myMarker.png", 60);
    Future.delayed(Duration(milliseconds: 1000), () {
      MapFunctions().myPositionListener();
    });
    
    var pos = await MapFunctions().getCurrentPosition();
    MapFunctions().animateToNewPosition(LatLng(pos!.latitude, pos.longitude));
  }
}
