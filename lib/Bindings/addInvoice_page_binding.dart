import 'package:freelancer_app/Controller/addInvoice_page_controller.dart';
import 'package:get/get.dart';

class AddInvoicePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddInvoiceDetailsController());
  }
}
