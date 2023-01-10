import 'package:freelancer_app/Model/notificationModel.dart';
import 'package:get/get.dart';

class NotificationScreenController extends GetxController {
  RxInt reload = 0.obs;
  RxList<NotificationModel> modelList = RxList([
    NotificationModel(
        id: 0,
        title: 'Charging Completed , Disconnect Your Charger ',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
        isDisconnected: false),
    NotificationModel(
        id: 1,
        title: 'Charging Completed , Disconnect Your Charger ',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
        isDisconnected: true),
    NotificationModel(
        id: 2,
        title: 'Charging Completed , Disconnect Your Charger ',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
        isDisconnected: true),
    NotificationModel(
        id: 3,
        title: 'Charging Completed , Disconnect Your Charger ',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
        isDisconnected: true),
  ]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
