import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import '../Utils/routes.dart';

class ProfileScreenController extends GetxController {
  RxInt reload = 0.obs;

  @override
  void onInit() {
    // / implement onInit
    super.onInit();
    getProfileDetails();
  }

  getProfileDetails() async {
    showLoading(kLoading);
    await CommonFunctions().getUserProfile();
    hideLoading();
  }

  deleteProfile() async {
    kLog(appData.userModel.value.id.toString());
    // return;
    showLoading(kLoading);
    bool res = await CommonFunctions().deleteUser();
    hideLoading();
    if (res) {
      showSuccess('Account deleted successfully!');
      Get.offAllNamed(Routes.loginpageRoute);
    } else {
      showError('Failed to delete account!');
    }
  }
}
