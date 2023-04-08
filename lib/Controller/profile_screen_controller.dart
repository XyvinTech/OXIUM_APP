import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/state_manager.dart';

class ProfileScreenController extends GetxController {
  RxInt reload = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileDetails();
  }

  getProfileDetails() async {
    showLoading(kLoading);
    await CommonFunctions().getUserProfile();
    hideLoading();
  }
}
