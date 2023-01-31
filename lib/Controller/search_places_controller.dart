import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/chargingCafeModel.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

import '../Utils/debouncer.dart';

class SearchPlacesScreenController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  RxBool isShowCross = false.obs;
  List<String> suggestions = [
    'Cafe with charge point',
    'Charge point near me',
    'Show near by charging station',
    'Cafe with charge point',
  ];
  RxList<ChargingCafeModel> chargingCafeModelList = [
    ChargingCafeModel(
        id: 0,
        name: 'Calista Cafe',
        location: 'Mannapatta , Govt College , Kerala'),
    ChargingCafeModel(
        id: 1,
        name: 'Calista Cafe',
        location: 'Mannapatta , Govt College , Kerala'),
    ChargingCafeModel(
        id: 2,
        name: 'Calista Cafe',
        location: 'Mannapatta , Govt College , Kerala'),
    ChargingCafeModel(
        id: 3,
        name: 'Calista Cafe',
        location: 'Mannapatta , Govt College , Kerala'),
    ChargingCafeModel(
        id: 4,
        name: 'Calista Cafe',
        location: 'Mannapatta , Govt College , Kerala'),
    ChargingCafeModel(
        id: 5,
        name: 'Calista Cafe',
        location: 'Mannapatta , Govt College , Kerala'),
    ChargingCafeModel(
        id: 6,
        name: 'Calista Cafe',
        location: 'Mannapatta , Govt College , Kerala'),
  ].obs;

  Future<List<AutocompletePrediction>?> searchPlaceByName(String place) async {
    var googlePlace = GooglePlace("AIzaSyC-KnRoUdTT4_xQ_xbyVkvXPoKUNTZptnE");
    var result = await googlePlace.autocomplete.get(
      place,
      origin: LatLon(23.6850, 90.3563),
      location: LatLon(23.6850, 90.3563),
    );
    List<AutocompletePrediction> prediction = [];
    if (result != null && result.predictions != null) {
      prediction = result.predictions ?? [];
    }
    prediction.forEach((element) {
      // log(element.description.toString());
      log(element.description.toString());
    });
    return prediction;
  }
}
