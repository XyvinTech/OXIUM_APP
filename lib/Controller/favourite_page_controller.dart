import 'package:freelancer_app/Model/favoriteModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import '../Utils/routes.dart';

class FavouritePageController extends GetxController {
  RxList<FavoriteModel> model_list = RxList();
  @override
  void onInit() {
    // / implement onInit
    super.onInit();
    getFavorites();
  }

  getFavorites() async {
    showLoading(kLoading);
    model_list.value = await CommonFunctions().getFavorites();
    hideLoading();
  }

  gotoStationDetailsPage(String stationId) async {
    Get.toNamed(Routes.calistaCafePageRoute, arguments: stationId);
  }

  changeFavoriteStatus(String stationId) async {
    showLoading(kLoading);
    bool res = await CommonFunctions()
        .changeFavorite(stationId: stationId, makeFavorite: false);
    if (res) {
      await getFavorites();
    }
    hideLoading();
  }
}
