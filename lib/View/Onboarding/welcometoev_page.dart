import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/textfield.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class WelcomeToEvPage extends GetView<LoginPageController> {
  const WelcomeToEvPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.09),
          child: CustomAppBar(),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.055,
            right: size.width * 0.055,
            top: size.height * 0.020,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.07,
                ),
                CustomBigText(text: "Welcome to India’s"),
                SizedBox(
                  height: size.height * 0.002,
                ),
                CustomBigText(text: "largest EV Charging Network"),
                SizedBox(
                  height: size.height * 0.015,
                ),
                CustomSmallText(text: "Enter your Name & Email to get more"),
                SizedBox(
                  height: size.height * 0.001,
                ),
                CustomSmallText(text: "personalised Experiance"),
                SizedBox(
                  height: size.height * 0.045,
                ),

                //UserNameTextfield
                AppTextField(
                  Controller: controller.nameEditingController,
                  onChanged: (String val) {},
                  hintText: "Enter Your Name",
                  icon: Image.asset(
                    "assets/images/face.png",
                  ),
                  keyboardtype: TextInputType.name,
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                AppTextField(
                  hintText: "Email",
                  icon: Image.asset("assets/images/sms.png"),
                  keyboardtype: TextInputType.emailAddress,
                  Controller: controller.mailEditingController,
                  onChanged: (String val) {},
                ),

                SizedBox(
                  height: size.height * 0.25,
                ),
                AppButton(text: "Submit"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
