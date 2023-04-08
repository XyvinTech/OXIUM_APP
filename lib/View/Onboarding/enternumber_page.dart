import 'package:country_picker/country_picker.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../constants.dart';

class EnterNumberPage extends GetView<LoginPageController> {
  const EnterNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // print(size.height);
    // print(size.width);
    return Scaffold(
      backgroundColor: kwhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.09),
        child: CustomAppBar(
          text: "Skip",
          icon: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressBar(
              maxSteps: 5,
              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00FFB3)),
              currentStep: 1,
              minHeight: 8.h,
              progressColor: Color(0xff00FFB3),
              backgroundColor: Colors.transparent,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.055,
                right: size.width * 0.055,
                // top: size.height * 0.020,
                // bottom: size.height * 0.045,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomBigText(
                            text: "Sign up with your Phone Number")),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    // enterphnnumber button
                    Container(
                      padding: EdgeInsets.only(
                        left: size.width * 0.05,
                      ),
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                            width: 2,
                            color: Color(0xffE0E0E0),
                          )),
                      child: Row(
                        children: [
                          Obx(
                            () {
                              return InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    favorite: ['IN', 'BD'],
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      print(
                                          'Select country: ${country.displayName}');
                                      controller.country.value =
                                          country.phoneCode;
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "+${controller.country.value}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Icon(
                                      Icons.expand_more,
                                      size: 20,
                                    )
                                  ],
                                ),
                              );
                            },
                            // icon: Container(
                            //     margin: EdgeInsets.only(right: 5),
                            //     height: size.height * 0.03,
                            //     width: size.width * 0.03,
                            //     child:
                            //         Image.asset("assets/images/chevron_left.png")),
                          ),
                          SizedBox(
                            width: size.width * 0.014,
                          ),
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.008,
                            color: Color(0xffE0E0E0),
                          ),
                          SizedBox(
                            width: size.width * 0.035,
                          ),
                          Form(
                            child: Container(
                              height: size.height * 0.065,
                              width: size.width * 0.5,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.0034),
                                child: TextFormField(
                                  onChanged: (String value) {
                                    controller.textfield.value = value;
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  inputFormatters: [
                                    // LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffBDBDBD),
                                    ),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomSmallText(
                        text: "We will send an OTP to verify yor Number"),
                    SizedBox(
                      height: size.height * 0.035,
                    ),

                    //send OTP button
                    StartedButton(
                      color: Color(0xff0047C3),
                      text: "Send OTP",
                      textColor: Color(
                        0xffF2F2F2,
                      ),
                      iconColor: Color(0xffF2F2F2),
                      onTap: () => Get.toNamed(Routes.enterotppageRoute),
                    ),

                    SizedBox(
                      height: size.height * 0.075,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: size.height * 0.003,
                            // width: size.width * 0.4,
                            color: Color(0xffE0E0E0),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        CustomSmallText(text: "OR"),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                          child: Container(
                            height: size.height * 0.003,
                            // width: size.width * 0.4,
                            color: Color(0xffE0E0E0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.075,
                    ),
                    SignUpButton(
                      borderWidth: 2,
                      borderColor: Color(0xffE0E0E0),
                      color: kwhite,
                      text: "Sign up with Google",
                      logo: Image.asset(
                        "assets/images/google1.png",
                        height: size.height * 0.033,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    SignUpButton(
                      textColor: Color(0xffF2F2F2),
                      color: kblack,
                      text: "Sign up with Apple",
                      logo: Image.asset(
                        "assets/images/apple.png",
                        height: size.height * 0.033,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
