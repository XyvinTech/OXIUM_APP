import 'package:freelancer_app/Controller/reservation_screen_controller.dart';
import 'package:get/get.dart';

class ReservationScreenBindigs extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ReservationScreenController());
  }
}
