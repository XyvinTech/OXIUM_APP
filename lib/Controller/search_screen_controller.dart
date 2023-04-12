import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/chargeStationDetailsModel.dart.dart';
import 'package:freelancer_app/Model/searchStationModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:get/get.dart';

import '../Utils/debouncer.dart';

class SearchScreenController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
  RxBool isShowCross = false.obs;
  final Debouncer debouncer = Debouncer(milliseconds: 1000);

  List<String> suggestions = [
    'Cafe with charge point',
    'Charge point near me',
    'Show near by charging station',
    'Cafe with charge point',
  ];
  // RxList<ChargeStationDetailsModel> chargingCafeModelList = RxList();
  RxList<SearchStationrModel> search_list = RxList();

  getSearchedChargeStationList(String name) async {
    if (name.isEmpty) return;
    
    search_list.value = await CommonFunctions().getSearchedChargeStations(name);
  }
}
