import 'package:freelancer_app/Model/userModel.dart';
import 'package:freelancer_app/Utils/debouncer.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/state_manager.dart';

import '../Model/filterModel.dart';

class AppData {
  //make it singleTone class
  static final AppData _singleton = AppData._internal();
  factory AppData() {
    return _singleton;
  }
  AppData._internal();
  //code starts from here
  String token = '';
  // String token =
  //     "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5NDQ3NDcxNzAxIiwic2NvcGVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dLCJpc3MiOiJodHRwOi8vZXpib3QuY29tIiwiaWF0IjoxNjkwMzcwMjIzLCJleHAiOjE3MjE5MDYyMjN9.V1M-w1goPvK5UgwLrMOgX3C6v_Tf7kmE6EGQodVW2MM";
  Rx<UserModel> userModel = kUserModel.obs;
  RxBool notificationAvailable = false.obs;
  RxBool isReserved = false.obs;
  Debouncer debouncer = Debouncer(milliseconds: 1000);
  String qr = '';
  String rechargeAmount = '';
  String notification_token = '';
  int totalElements = 0;

  double gettingLowAllertValue = 70;

//FOR FILTER PAGE SO THAT THE DATA DON'T DELETED WHEN CONTROLLER DISPOSES
  List<RxList<FilterModel>> filterList = [
    RxList([
      FilterModel(title: 'Available', isSelected: false),
      FilterModel(title: 'Busy', isSelected: false),
      FilterModel(title: 'Faulty', isSelected: false),
    ]),
    RxList([
      FilterModel(title: 'AC', isSelected: false),
      FilterModel(title: 'DC', isSelected: false),
    ]),
    RxList([
      FilterModel(title: 'CSS', isSelected: false),
      FilterModel(title: 'GBT', isSelected: false),
      FilterModel(title: 'Type 2', isSelected: false),
      FilterModel(title: 'IEC_60309', isSelected: false),
      FilterModel(title: 'CHAdemO', isSelected: false),
      FilterModel(title: 'Combol', isSelected: false),
      FilterModel(title: 'Type 1', isSelected: false),
    ]),
    RxList([
      FilterModel(title: '3.3KwH', isSelected: false),
      FilterModel(title: '7KwH', isSelected: false),
      FilterModel(title: '22KwH', isSelected: false),
      FilterModel(title: '25KwH', isSelected: false),
      FilterModel(title: '30KwH', isSelected: false),
      FilterModel(title: '60KwH', isSelected: false),
      FilterModel(title: '142KwH', isSelected: false),
      FilterModel(title: '180KwH', isSelected: false),
    ]),
    RxList([
      FilterModel(title: 'Hotel', isSelected: false),
      FilterModel(title: 'Mall', isSelected: false),
      FilterModel(title: 'Cafe', isSelected: false),
      FilterModel(title: 'Restaurant', isSelected: false),
    ]),
  ];
}

AppData appData = AppData();
