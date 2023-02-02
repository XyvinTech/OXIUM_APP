import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/chargingCafeModel.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../Utils/debouncer.dart';

class SearchPlacesScreenController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  RxBool isShowCross = false.obs;
  RxList<AutocompletePrediction> autoCompletePrediction = RxList();
  List<String> suggestions = [
    'Cafe with charge point',
    'Charge point near me',
    'Show near by charging station',
    'Cafe with charge point',
  ];

  searchPlace(String text) async {
    autoCompletePrediction.value =
        (await MapFunctions().searchPlaceByName(text))??[];
  }
}
