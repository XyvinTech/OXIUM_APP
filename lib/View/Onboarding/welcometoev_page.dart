import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/textfield.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class WelcomeToEvPage extends GetView<LoginPageController> {
  const WelcomeToEvPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.09),
          child: CustomAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              LinearProgressBar(
                maxSteps: 5,
                progressType:
                    LinearProgressBar.progressTypeLinear, // Use Linear progress
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00FFB3)),
                currentStep: 3,
                minHeight: 8.h,
                progressColor: Color(0xff00FFB3),
                backgroundColor: Colors.transparent,
              ),
              Padding(
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
                      CustomSmallText(
                          text: "Enter your Name & Email to get more"),
                      SizedBox(
                        height: size.height * 0.001,
                      ),
                      CustomSmallText(text: "personalised Experiance"),
                      SizedBox(
                        height: size.height * 0.045,
                      ),

                      //UserNameTextfield
                      Obx(
                        () => AppTextField(
                          color: controller.enablenameTextfield == true
                              ? Color(0xff0047C3)
                              : Color(0xffE0E0E0),
                          Controller: controller.nameEditingController,
                          onChanged: (String val) {},
                          onTap: () {
                            controller.nameTextfieldColorChange();
                          },
                          hintText: "Jane Doe",
                          icon: Image.asset(
                            "assets/images/face.png",
                          ),
                          keyboardtype: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Obx(
                        () => AppTextField(
                          color: controller.enablemailTextfield == true
                              ? Color(0xff0047C3)
                              : Color(0xffE0E0E0),
                          onTap: () {
                            controller.mailTextFieldColorChange();
                          },
                          hintText: "Email",
                          icon: Image.asset("assets/images/sms.png"),
                          keyboardtype: TextInputType.emailAddress,
                          Controller: controller.mailEditingController,
                          onChanged: (String val) {},
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.25,
                      ),
                      AppButton(
                        text: "Submit",
                        onTap: () {
                          controller.saveUserNameEmail();
                          // Get.toNamed(Routes.addvehiclesRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
