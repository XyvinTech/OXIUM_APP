import 'dart:developer';

import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:get/get.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:google_place/google_place.dart';

class DirectionsScreenController extends GetxController {
  RxInt reload = 0.obs;
  Rx<AutocompletePrediction> source = AutocompletePrediction().obs;
  Rx<AutocompletePrediction> destination = AutocompletePrediction().obs;
  Rx<DirectionsResult> directionsResult = DirectionsResult().obs;
  RxInt saveCount = 0.obs;
  RxBool isSaved = false.obs;
  String distance = '';
  String duration = '';
  String route_via = '';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    directionsResult = Get.arguments[0];
    source = Get.arguments[1];
    destination = Get.arguments[2];
    Future.delayed(Duration(milliseconds: 1000), () {
      log('delayed');
      log(MapFunctions().polylineString);
      MapFunctions().setMapFitToPolyline(
          MapFunctions().polylines, MapFunctions().dirMapController);
      // MapFunctions().animatePolyline(MapFunctions().polylineString, reload);
    });
    distance = directionsResult.value.routes!.first.legs!.first.distance!.text!
        .replaceFirst('km', 'KMS');
    duration = directionsResult.value.routes!.first.legs!.first.duration!.text!;
    //route_via = directionsResult.value.routes!.first.legs!.first.
    route_via = 'Adimali';
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    MapFunctions().timer?.cancel();
  }
}
