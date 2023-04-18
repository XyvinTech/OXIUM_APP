import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/state_manager.dart';

import '../Model/vehicleModel.dart';

class MyVehiclesScreenController extends GetxController {
  RxInt reload = 0.obs;
  RxList<VehicleModel> myVehicleList = RxList();

  @override
  void onInit() {
    // TODO: implement onInit
    getMyVehicles();
    super.onInit();
  }

  getMyVehicles() async {
    showLoading(kLoading);
    myVehicleList.value = await CommonFunctions().getUserEvs();
    hideLoading();
  }

  setAsDefaultVehicle(VehicleModel model) async {
    showLoading(kLoading);
    bool res = await CommonFunctions().addEvToUser(
      userName: appData.userModel.value.username,
      ev: model,
      regNumber: model.evRegNumber,
      isDefault: true,
    );
    hideLoading();
    if (res) {
      getMyVehicles();
      showSuccess('Default Vehicle Updated Successfully!');
    } else {
      showError('Failed to update default vehicle');
    }
  }
}
