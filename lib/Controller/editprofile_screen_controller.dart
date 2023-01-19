import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class EditProfileScreenController extends GetxController {
  RxInt reload = 0.obs;
  final TextEditingController nameController = TextEditingController();
}
