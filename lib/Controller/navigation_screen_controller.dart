import 'package:get/get.dart';
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
    // / implement onInit
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

    // MapFunctions().steps.value = 0;
    // MapFunctions().maneuverText.value = 'Go Straight';
    MapFunctions().checkForUpdateSteps();
  }

  initMap() {
    MapFunctions().addCarMarker(MapFunctions().curPos);
    Future.delayed(Duration(milliseconds: 1000), () {
      // MapFunctions().setMapFitToPolyline(
      //   MapFunctions().polylines,
      //   MapFunctions().dirMapController,
      //   isNavigation: true,
      // );
      MapFunctions().animateForNavigation(MapFunctions().curPos);
      // MapFunctions().animatePolyline(MapFunctions().polylineString, reload);
    });
  }
}
