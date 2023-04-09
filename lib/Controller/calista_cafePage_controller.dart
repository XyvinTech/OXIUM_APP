import 'package:freelancer_app/Model/chargeStationDetailsModel.dart.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

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
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    if (Get.arguments != null) assignPreviouslyGotModel();
  }

  assignPreviouslyGotModel() {
    model.value = Get.arguments;
    amenities.value = model.value.amenities.split(',');
    distance.value = MapFunctions.distanceBetweenCoordinates(
            MapFunctions().curPos!.latitude,
            MapFunctions().curPos!.longitude,
            model.value.lattitude,
            model.value.longitude)
        .toPrecision(2);
  }

//THIS FUNCTION IS NOT USED HERE. IF NEEDED THEN WE WILL USE IT
  getChargeStationDetails(String stationId) async {
    showLoading(kLoading);
    model.value = await CommonFunctions().getChargeStationDetails(stationId);
    if (MapFunctions().curPos != null) {
      distance.value = MapFunctions.distanceBetweenCoordinates(
          MapFunctions().curPos!.latitude,
          MapFunctions().curPos!.longitude,
          model.value.lattitude,
          model.value.longitude);
    }
    hideLoading();
  }

  changeCharger(int index, int index_grid) {
    selectedCharger.value = index;
    selectedType.value = index_grid;
  }
}
