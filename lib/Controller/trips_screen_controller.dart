import 'package:flutter/material.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:get/get.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:google_place/google_place.dart';

import '../Utils/routes.dart';

class TripsScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt IsTabIndex = 0.obs;

  late TabController tabController;
  final TextEditingController sourceTextController = TextEditingController();
  //
  //Google places
  Rx<AutocompletePrediction> source = AutocompletePrediction().obs;
  Rx<AutocompletePrediction> destination = AutocompletePrediction().obs;
  Rx<DirectionsResult> directionsResult = DirectionsResult().obs;
  @override
  void onInit() {
    // TODO: implement onInit

    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    tabController.addListener(() {
      IsTabIndex.value = tabController.index;
    });
  }

  getSource() {
    Get.toNamed(Routes.searchPlacesPageRoute)!.then((value) {
      if (value == null || value.isEmpty) return;
      source.value = value[0];
    });
  }

  getDestination() {
    Get.toNamed(Routes.searchPlacesPageRoute)!.then((value) {
      if (value == null || value.isEmpty) return;
      destination.value = value[0];
    });
  }

  Future<void> getDirectionsPolyline() async {
    directionsResult.value =
        (await MapFunctions().getDirections(source.value, destination.value)) ??
            DirectionsResult();
    Get.toNamed(Routes.directionsPageRoute,
        arguments: [directionsResult, source, destination]);
  }
}
