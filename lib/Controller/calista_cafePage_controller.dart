import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/chargeStationDetailsModel.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:google_place/google_place.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:validators/validators.dart';

import '../Singletones/common_functions.dart';
import '../Singletones/map_functions.dart';
import '../Utils/routes.dart';
import '../Utils/toastUtils.dart';

class CalistaCafePageController extends GetxController {
  RxInt selectedCharger = (-1).obs;
  RxInt selectedType = (-1).obs;
  RxInt itemCountPerConnector = 3.obs;
  RxBool isOpen = false.obs;
  RxDouble distance = 0.0.obs;
  Rx<ChargeStationDetailsModel> model = kChargeStationDetailsModel.obs;
  RxList<String> amenities = RxList();
  RxInt selectedRating = 0.obs;
  TextEditingController reviewController = TextEditingController();
  Rx<DirectionsResult> directionsResult = DirectionsResult().obs;
  Rx<AutocompletePrediction> source = AutocompletePrediction().obs,
      destination = AutocompletePrediction().obs;
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
    isOpen.value = isTimeInRange(model.value.startTime, model.value.stopTime);
  }

//THIS FUNCTION IS NOT USED HERE. IF NEEDED THEN WE WILL USE IT
  getChargeStationDetails(String stationId) async {
    showLoading(kLoading);
    model.value = await CommonFunctions().getChargeStationDetails(stationId);
    amenities.value = model.value.amenities.split(',');
    kLog(model.value.isFavorite.toString());
    if (MapFunctions().curPos.latitude != 0) {
      distance.value = (MapFunctions.distanceBetweenCoordinates(
                  MapFunctions().curPos.latitude,
                  MapFunctions().curPos.longitude,
                  model.value.lattitude,
                  model.value.longitude) /
              1000.0)
          .toPrecision(2);
    }
    isOpen.value = isTimeInRange(model.value.startTime, model.value.stopTime);
    hideLoading();
  }

  changeCharger(int index, int index_grid) {
    if (selectedCharger.value != -1)
      selectedCharger.value = -1;
    else
      selectedCharger.value = index;
    if (selectedType.value != -1)
      selectedType.value = -1;
    else
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
    appData.qr = '${model.value.id}' +
        '-' +
        model.value.Chargers[selectedCharger.value].charger_name +
        '-' +
        '${model.value.Chargers[selectedCharger.value].evports[selectedType.value].seqNumber}' +
        '-' +
        'A';
    CommonFunctions().createBookingAndCheck(appData.qr);
  }

  getDirections(bool isNavigation) async {
    showLoading(kLoading);
    List<String> list = await MapFunctions().getNameAndPlaceIdFromLatLng(
        MapFunctions().curPos.latitude, MapFunctions().curPos.longitude);
    source.value = AutocompletePrediction(
      description: list[0],
      placeId: list[1],
    );
    list = await MapFunctions().getNameAndPlaceIdFromLatLng(
        model.value.lattitude, model.value.longitude);
    destination.value = AutocompletePrediction(
      description: list[0],
      placeId: list[1],
    );
    directionsResult.value =
        (await MapFunctions().getDirections(source.value, destination.value)) ??
            DirectionsResult();
    hideLoading();
    if (directionsResult.value.status == DirectionsStatus.ok) {
      Get.toNamed(
          isNavigation
              ? Routes.navigationPageRoute
              : Routes.directionsPageRoute,
          arguments: [directionsResult, source, destination]);
    }
  }

  changeFavoriteStatus() async {
    showLoading(kLoading);
    bool res = await CommonFunctions().changeFavorite(
        stationId: model.value.id, makeFavorite: !model.value.isFavorite);
    if (res) {
      await getChargeStationDetails(model.value.id.toString());
    }
    hideLoading();
  }

  launchOnGoogleMap() {
    launchUrlString(
        'https://www.google.com/maps/dir/?api=1&destination=${model.value.lattitude},${model.value.longitude}',
        mode: LaunchMode.externalApplication);
  }

  shareStationLocation() {
    Share.share(
        'Check out the ${model.value.name} chargestation by clicking the following link:\n https://www.google.com/maps/dir/?api=1&destination=${model.value.lattitude},${model.value.longitude}',
        subject: 'Checkout ${model.value.name} station!');
  }
}
