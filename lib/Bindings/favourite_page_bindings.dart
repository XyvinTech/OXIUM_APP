import 'package:freelancer_app/Controller/favourite_page_controller.dart';
import 'package:get/get.dart';

class FavouritePageBingdings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavouritePageController());
  }
}
