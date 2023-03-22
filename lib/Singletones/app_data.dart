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
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5NzgyMTk5NDU1Iiwic2NvcGVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dLCJpc3MiOiJodHRwOi8vZXpib3QuY29tIiwiaWF0IjoxNjc5NDExMzIwLCJleHAiOjE2Nzk0NDczMjB9._BJtoXw1FhsfcHbuK3xj2BEtuciwbzYEg9j-5pMclbk';
  RxBool isReserved = false.obs;
}

AppData appData = AppData();
