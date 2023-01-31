import 'dart:developer';

import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsScreenController extends GetxController {
  RxInt reload = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log('init');
    Future.delayed(Duration(milliseconds: 1000), () {
      log('delayed');
      log(MapFunctions().polylineString);
      MapFunctions().setMapFitToPolyline(
          MapFunctions().polylines, MapFunctions().dirMapController);
      MapFunctions().animatePolyline(MapFunctions().polylineString, reload);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    MapFunctions().timer?.cancel();
  }
}
