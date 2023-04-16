import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

import '../Utils/debouncer.dart';

class SearchPlacesScreenController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 1000);
  RxBool isShowCross = false.obs;
  RxList<AutocompletePrediction> autoCompletePrediction = RxList();
  List<String> suggestions = [
    'Cafe with charge point',
    'Charge point near me',
    'Show near by charging station',
    'Cafe with charge point',
  ];
  @override
  onInit() async {
    super.onInit();
    await MapFunctions().getMyLocationNameAndPlaceId();
    log(MapFunctions().curPosName.value);
  }

  searchPlace(String text) async {
    autoCompletePrediction.value =
        (await MapFunctions().searchPlaceByName(text)) ?? [];
  }

  onSearchResultClicked() async {
    List<String> list = [];
    if (MapFunctions().curPosName.value.isEmpty)
      list = await MapFunctions().getMyLocationNameAndPlaceId();
    else
      list = [
        MapFunctions().curPosName.value,
        MapFunctions().curPosPlaceId.value
      ];
    Get.back(result: [
      AutocompletePrediction(
        description: list[0],
        placeId: list[1],
      )
    ]);
  }
}
