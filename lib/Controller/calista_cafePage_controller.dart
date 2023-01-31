import 'package:expandable/expandable.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:get/get.dart';

class CalistaCafePageController extends GetxController {
  RxInt selectedCharger = (-1).obs;
  RxInt selectedType = (-1).obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  changeCharger(int index, int index_grid) {
    selectedCharger.value = index;
    selectedType.value = index_grid;
  }
}
