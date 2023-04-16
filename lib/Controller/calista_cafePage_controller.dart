import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/chargeStationDetailsModel.dart.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../Singletones/common_functions.dart';
import '../Singletones/map_functions.dart';
import '../Utils/toastUtils.dart';

class CalistaCafePageController extends GetxController {
  RxInt selectedCharger = (-1).obs;
  RxInt selectedType = (-1).obs;
  RxInt itemCountPerConnector = 3.obs;
  RxDouble distance = 0.0.obs;
  Rx<ChargeStationDetailsModel> model = kChargeStationDetailsModel.obs;
  RxList<String> amenities = RxList();
  RxInt selectedRating = 0.obs;
  TextEditingController reviewController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    if (Get.arguments != null) {
      if (isNumeric('${Get.arguments}'))
        getChargeStationDetails('${Get.arguments}');
      else
        assignPreviouslyGotModel();
    }
  }

  assignPreviouslyGotModel() {
    model.value = Get.arguments;
    amenities.value = model.value.amenities.split(',');
    distance.value = (MapFunctions.distanceBetweenCoordinates(
                MapFunctions().curPos.latitude,
                MapFunctions().curPos.longitude,
                model.value.lattitude,
                model.value.longitude) /
            1000.0)
        .toPrecision(2);
  }

//THIS FUNCTION IS NOT USED HERE. IF NEEDED THEN WE WILL USE IT
  getChargeStationDetails(String stationId) async {
    showLoading(kLoading);
    model.value = await CommonFunctions().getChargeStationDetails(stationId);
    amenities.value = model.value.amenities.split(',');
    kLog(model.string);
    if (MapFunctions().curPos.latitude != 0) {
      distance.value = (MapFunctions.distanceBetweenCoordinates(
                  MapFunctions().curPos.latitude,
                  MapFunctions().curPos.longitude,
                  model.value.lattitude,
                  model.value.longitude) /
              1000.0)
          .toPrecision(2);
    }
    hideLoading();
  }

  changeCharger(int index, int index_grid) {
    selectedCharger.value = index;
    selectedType.value = index_grid;
  }

  postReviewForChargeStation() async {
    showLoading(kLoading);
    bool status = await CommonFunctions().postReviewForChargeStation(
        model.value.id, selectedRating.value, reviewController.text);
    hideLoading();
    return status;
  }

  startCharging() {
    String qr = '${model.value.id}' +
        '-' +
        model.value.Chargers[selectedCharger.value].charger_name +
        '-' +
        '${model.value.Chargers[selectedCharger.value].evports[selectedType.value].seqNumber}' +
        '-' +
        'A';
    CommonFunctions().createBookingAndCheck(qr);
  }
}
