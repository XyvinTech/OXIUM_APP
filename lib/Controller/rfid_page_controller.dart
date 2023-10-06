import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../Model/RFIDModel.dart';
import '../Singletones/common_functions.dart';
import '../Utils/toastUtils.dart';
import '../constants.dart';

class RfidPageController extends GetxController {
  RxList carouselText = [
    "GOEC super charging station Provides High ROI",
    "operate your charging station from anywhere in the world without human intervention.",
    "For a future-focused business, capitalize on the growing EV market."
  ].obs;
  RxList carouselImage = [
    "assets/images/carouselOne.png",
    "assets/images/carouselTwo.png",
    
    "assets/images/carouselThree.png",
  ].obs;
  CarouselController? carouselController;
  RxDouble currentIndex = 0.0.obs;
  RxInt rfid_price = 0.obs;
  RxList<RFIDModel> rfid_list = RxList();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRFIDPriceAndUserRFID();
  }

  getRFIDPriceAndUserRFID() async {
    showLoading(kLoading);
    rfid_price.value = await CommonFunctions().getRFIDPrice();
    await getUserRFIDs();
    hideLoading();
  }

  getUserRFIDs() async {
    rfid_list.value = await CommonFunctions().getUserRFIDs();
  }

  orderRFID() async {
    showLoading(kLoading);
    String order_id =
        await CommonFunctions().getOrderIdRazorpay(rfid_price.value);
    hideLoading();
    CommonFunctions().openRazorPay(
        amount: rfid_price.value,
        order_id: order_id,
        descirption: 'RFID payment');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    CommonFunctions().closeRazorPay();
    super.onClose();
  }
}
