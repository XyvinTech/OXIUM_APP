  import 'package:freelancer_app/Controller/search_screen_controller.dart';
import 'package:get/get.dart';



class SearchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SearchScreenController ());
  }
}