import 'package:get/state_manager.dart';

class AppData {
  //make it singleTone class
  static final AppData _singleton = AppData._internal();
  factory AppData() {
    return _singleton;
  }
  AppData._internal();
  //code starts from here
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5NzgyMTk5NDU1Iiwic2NvcGVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dLCJpc3MiOiJodHRwOi8vZXpib3QuY29tIiwiaWF0IjoxNjc5NDcyMDMwLCJleHAiOjE2Nzk1MDgwMzB9.J6JmZ-Lc-YtrveSj4xDu1PDkbpBTran9k5vyf6GYgNo';
  RxBool isReserved = false.obs;
}

AppData appData = AppData();
