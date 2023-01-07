import 'package:freelancer_app/Bindings/homepage_binding.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxDouble height = 80.0.obs;
  RxString name = ''.obs;
  RxString done = 'do'.obs;
  RxInt activeIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 1000), () {
      MapFunctions().myPositionListener();
    });
  }

  reload() {}
}
