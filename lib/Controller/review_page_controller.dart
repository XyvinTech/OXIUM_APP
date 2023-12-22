import 'package:freelancer_app/Model/reviewMode.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import 'calista_cafePage_controller.dart';

class ReviewPageController extends GetxController {
  RxInt reload = 0.obs;
  CalistaCafePageController calistaCafePageController = Get.find();
  RxList<ReviewModel> modelList = RxList();
  RxString totalRating = '0'.obs;
  RxInt totalElements = 0.obs;
  @override
  void onInit() {
    // / implement onInit
    super.onInit();
    if (Get.arguments != null) {
      totalRating.value = Get.arguments[0];
      getReview(Get.arguments[1]);
    }
    // int id = Get.arguments ?? -1;
    // if (id != -1) getReview(id);
  }

  getReview(int stationId) async {
    showLoading(kLoading);
    var res = await CommonFunctions().getReviewOfStation(stationId.toString());
    hideLoading();
    totalElements.value = res[0];
    modelList.value = res[1];
  }
}
