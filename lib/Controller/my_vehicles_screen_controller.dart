import 'package:freelancer_app/Model/myVehicleModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MyVehiclesScreenController extends GetxController {
  RxInt reload = 0.obs;
  RxList<MyVehicleModel> myVehicleList = RxList();

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
}
