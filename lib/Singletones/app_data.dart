import 'package:get/state_manager.dart';

class AppData {
  //make it singleTone class
  static final AppData _singleton = AppData._internal();
  factory AppData() {
    return _singleton;
  }
  AppData._internal();
  //code starts from here

  String token = '';
  RxBool isReserved = false.obs;
}

AppData appData = AppData();
