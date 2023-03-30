import 'package:freelancer_app/Model/userModel.dart';
import 'package:freelancer_app/constants.dart';
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
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5NzgyMTk5NDU1Iiwic2NvcGVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dLCJpc3MiOiJodHRwOi8vZXpib3QuY29tIiwiaWF0IjoxNjc5NjQxNDQyLCJleHAiOjE3MTExNzc0NDJ9.Scge54LZumVuYwtZmUmNa0YNDZE28CCll2GDnafPrYk';
  Rx<UserModel> userModel = kUserModel.obs;
  RxBool isReserved = false.obs;
}

AppData appData = AppData();
