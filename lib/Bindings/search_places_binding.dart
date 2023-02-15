import 'package:get/get.dart';

import '../Controller/search_places_controller.dart';



class SearchPlacesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SearchPlacesScreenController ());
  }
}