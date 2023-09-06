import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:get/get.dart';

import '../Singletones/dialogs.dart';
import '../Utils/utils.dart';
import '../View/Widgets/apptext.dart';

class AddInvoiceDetailsController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phnNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController cityNameController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController stateNameController = TextEditingController();
  final TextEditingController countryNameController = TextEditingController();
  final TextEditingController gstNoController = TextEditingController();

  RxDouble reload = 0.0.obs;
  RxInt reloads = 0.obs;
  RxDouble currentIndex = 0.0.obs;
  String phnNumber = "+8801751051339";
  RxString country = "91".obs;
  RxString countryName = "Country".obs;
  RxString textfield = "".obs;
  //RxInt reload = 0.obs;
  List<String> states = [];
  RxList<String> stateCitys = RxList();
  String? selectedState = null;
  String? selectedCity = null;
  Map<String, dynamic> data = {};

  @override
  void onInit() async {
    super.onInit();
    initStatesFromJson();
  }

  initStatesFromJson() async {
    data = await loadJsonFromAsset("assets/Indian_Cities_In_States_JSON.json");
    data.forEach((key, value) {
      states.add(key);
    });
    reloads++;
  }

  onChangeStateGetCityList(String? value) {
    if (value == null || value.isEmpty) return;
    selectedState = value;
    List<String> list = [];
    data[selectedState].forEach((element) {
      if (element == null || element.isEmpty) return;
      list.add(element.toString());
    });
    selectedCity = null;
    stateCitys.value = list.toSet().toList();
    reloads++;
  }

  onChangeCity(String? value) {
    selectedCity = value;
    reloads++;
  }

  onSave() {
    Get.back();
    saveSnack('Invoice Details Updated');
  }

  onClear() {
    selectedState = null;
    selectedCity = null;
    companyNameController.clear();
    phnNumberController.clear();
    cityNameController.clear();
    postalCodeController.clear();
    stateNameController.clear();
    countryNameController.clear();
    gstNoController.clear();
  }
}
