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
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMTEyMjIzMzMiLCJzY29wZXMiOlt7ImF1dGhvcml0eSI6IlJPTEVfQURNSU4ifV0sImlzcyI6Imh0dHA6Ly9lemJvdC5jb20iLCJpYXQiOjE2ODI1NDA0NzQsImV4cCI6MTcxNDA3NjQ3NH0.wkf4AW3gIVoAqOh3h7d-qpQzXKv_5SIDMqSo0uQn6TE';
  Rx<UserModel> userModel = kUserModel.obs;
  RxBool isReserved = false.obs;
  Debouncer debouncer = Debouncer(milliseconds: 1000);
  String qr = '';
  String rechargeAmount = '';

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
