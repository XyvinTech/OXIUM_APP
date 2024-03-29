import 'dart:developer';
import '../Model/vehicleModel.dart';
import 'package:get/state_manager.dart';
import 'package:freelancer_app/constants.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';

class MyVehiclesScreenController extends GetxController {
  RxInt reload = 0.obs;
  RxList<VehicleModel> myVehicleList = RxList();

  @override
  void onInit() {
    // / implement onInit
    getMyVehicles();
    super.onInit();
  }

  getMyVehicles() async {
    showLoading(kLoading);
    myVehicleList.value = (await CommonFunctions().getUserEvs());
    int index = myVehicleList.indexWhere((item) => item.defaultVehicle == 'Y');
    if (index != -1) {
      VehicleModel yItem = myVehicleList.removeAt(index);
      myVehicleList.insert(0, yItem);
    }

    hideLoading();
  }

  setAsDefaultVehicle(VehicleModel model) async {
    showLoading(kLoading);
    log(model.id.toString());
    bool res = await CommonFunctions().setDefaultVehicle(
      regNumber: model.evRegNumber,
    );
    // bool res = await CommonFunctions().setDefaultVehicle(
    //   userName: appData.userModel.value.username,
    //   regNumber: model.evRegNumber,
    //   isDefault: true,
    // );

    hideLoading();
    if (res) {
      await getMyVehicles();
      await CommonFunctions().getUserProfile();
      showSuccess('Default Vehicle Updated Successfully!');
    } else {
      showError('Failed to update default vehicle!\n Try again later');
    }
  }
}
