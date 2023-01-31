  import 'package:freelancer_app/Controller/search_screen_controller.dart';
import 'package:get/get.dart';

import '../Controller/search_places_controller.dart';



class SearchPlacesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SearchPlacesScreenController ());
  }
}