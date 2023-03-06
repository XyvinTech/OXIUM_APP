import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../Singletones/map_functions.dart';

class NavigationScreenController extends GetxController {
  RxInt reload = 0.obs;
  RxBool chargingCardExpanded = false.obs;
  Rx<AutocompletePrediction> source = AutocompletePrediction().obs;
  Rx<AutocompletePrediction> destination = AutocompletePrediction().obs;
  Rx<DirectionsResult> directionsResult = DirectionsResult().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    MapFunctions()
        .markers
        .removeWhere((element) => element.markerId == MarkerId('myMarker'));
    getArguments();
    initMap();
  }

  getArguments() {
    directionsResult = Get.arguments[0];
    source = Get.arguments[1];
    destination = Get.arguments[2];
    MapFunctions().directionsResult = directionsResult;
    MapFunctions().steps.value = 0;
    MapFunctions().maneuverText.value = 'Go Straight';
  }

  initMap() {
    MapFunctions().addCarMarker(MapFunctions().curPos!);
    Future.delayed(Duration(milliseconds: 1000), () {
      log('delayed');
      log(MapFunctions().polylineString);
      MapFunctions().setMapFitToPolyline(
        MapFunctions().polylines,
        MapFunctions().dirMapController,
        isNavigation: true,
      );
      // MapFunctions().animatePolyline(MapFunctions().polylineString, reload);
    });
  }
}
