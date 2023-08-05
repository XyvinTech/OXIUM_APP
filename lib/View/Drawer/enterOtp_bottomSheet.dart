import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Controller/loginpage_controller.dart';
import '../../Model/apiResponseModel.dart';
import '../../Singletones/app_data.dart';
import '../../Singletones/common_functions.dart';
import '../../Utils/SharedPreferenceUtils.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/appbutton.dart';
import '../Widgets/apptext.dart';

class EnterOtpSheet extends StatelessWidget {
  const EnterOtpSheet({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool checked = false.obs;
    // RxInt isIndex = (-1).obs;
    // RxBool isFocus = false.obs;
    // LoginPageController? loginPageController;
    TextEditingController otpController = TextEditingController();
    String phone = '+91';
    // late Timer timer;
    // RxInt s = 30.obs;

    // onClose() {
    //   timer.cancel();
    //   //super.onClose();
    // }

    // startTimer() {
    //   s.value = 30;
    //   timer = Timer.periodic(Duration(seconds: 1), (_timer) {
    //     if (s <= 0) {
    //       s.value = 0;
    //       _timer.cancel();
    //     } else
    //       s--;
    //   });
    // }

    // resendOTP() async {
    //   LoginPageController _loginPageController = Get.find();
    //   bool res = await _loginPageController.login();
    //   if (res) startTimer();
    // }

    verifyOTP() async {
      kLog(otpController.text);
      if (otpController.text.length != 5) return;
      showLoading(kLoading);
      ResponseModel res =
          await CommonFunctions().verifyOTP(phone, otpController.text);
      hideLoading();
      if (res.statusCode == 200) {
        appData.token = res.body['result']['token'];
        appData.userModel.value.username = res.body['result']['username'];
        await saveString('token', appData.token);
        await saveString('username', appData.userModel.value.username);
        appData.userModel.value = await CommonFunctions().getUserProfile();

        kLog(appData.userModel.value.username);
        if (appData.userModel.value.name.isEmpty ||
            appData.userModel.value.email.isEmpty) {
          Get.offAllNamed(Routes.addNameEmailPageRoute);
        } else {
          Get.offAllNamed(Routes.homePageRoute);
        }
      }
    }

    // @override
    // void onInit() {
    //   // TODO: implement onInit
    //   //super.onInit();
    //   phone = Get.arguments == null ? '' : Get.arguments;
    //   startTimer();
    // }

    return SingleChildScrollView(
      child: Column(
        children: [
          // LinearProgressBar(
          //   maxSteps: 5,
          //   progressType:
          //       LinearProgressBar.progressTypeLinear, // Use Linear progress
          //   valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00FFB3)),
          //   currentStep: 2,
          //   minHeight: 8.h,
          //   progressColor: Color(0xff00FFB3),
          //   backgroundColor: Colors.transparent,
          // ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.height * 0.05,
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {
                              Get.back();
                            },
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.clear,
                              //size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: size.height * 0.45,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        CustomBigText(
                          text: "Enter your OTP",
                          color: kblack,
                          size: 21,
                        ),
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: size.width * .06),
                        //   child: CustomSmallText(
                        //     text:
                        //         "Enter the OTP we just send to verify your number ${phone}",
                        //     size: 16,
                        //   ),
                        // ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: PinCodeTextField(
                              controller: otpController,
                              appContext: context,
                              length: 5,
                              pinTheme: PinTheme(
                                fieldHeight: 60.h,
                                fieldWidth: 59.w,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(38.r),
                                borderWidth: 1.5,
                                selectedFillColor:
                                    Color.fromARGB(255, 65, 65, 65),
                                inactiveColor: Color(0xffE0E0E0),
                                activeColor: Color(0xff0047C3).withOpacity(0.6),
                              ),
                              onChanged: (valu) {
                                print(valu);
                              }),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                        //   child: Obx(
                        //     () => Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         CustomSmallText(
                        //           text: "Time remining is ${s.value}s",
                        //           textAlign: TextAlign.left,
                        //           size: 14,
                        //         ),
                        //         InkWell(
                        //           onTap: () {
                        //             if (s.value <= 0) resendOTP();
                        //           },
                        //           child: CustomSmallText(
                        //             text: "Resend OTP",
                        //             color: s.value <= 0
                        //                 ? Color(0xff0047C3)
                        //                 : Colors.grey,
                        //             size: 16,
                        //             textAlign: TextAlign.right,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        //height(size.height * 0.3),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: AppButton(
                            text: "Login",
                            onTap: () {
                              verifyOTP();
                            },
                          ),
                        ),
                        height(size.height * 0.02),
                        Obx(() {
                          return Padding(
                            padding: EdgeInsets.only(left: size.width * 0.13),
                            child: CheckboxListTile(
                              title: CustomSmallText(
                                  text: 'Get updates on WhatsApp'),
                              value: checked.value,
                              onChanged: (value) {
                                checked.value = value!;
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, // Align checkbox to the left
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
