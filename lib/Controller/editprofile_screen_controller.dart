import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class EditProfileScreenController extends GetxController {
  RxString country = "91".obs;
  RxString textfield = "".obs;
  RxInt reload = 0.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phnNumberController = TextEditingController();
}
