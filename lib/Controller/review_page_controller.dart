import 'package:freelancer_app/Model/reviewMode.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import 'calista_cafePage_controller.dart';

class ReviewPageController extends GetxController {
  RxInt reload = 0.obs;
  CalistaCafePageController calistaCafePageController = Get.find();
  RxList<ReviewModel> modelList = RxList();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    int id = Get.arguments ?? -1;
    if (id != -1) getReview(id);
  }

  getReview(int stationId) async {
    showLoading(kLoading);
    modelList.value =
        await CommonFunctions().getReviewOfStation(stationId.toString());
    hideLoading();
  }
}
