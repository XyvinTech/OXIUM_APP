import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kOnboardingBackgroundColors,
        body: Column(
          children: [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
