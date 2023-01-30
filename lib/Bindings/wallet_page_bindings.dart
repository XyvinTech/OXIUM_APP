import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:get/get.dart';

class WalletPageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => WalletPageController());
  }
}
