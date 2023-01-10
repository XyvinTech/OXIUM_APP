import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/chargingCafeModel.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
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
}
