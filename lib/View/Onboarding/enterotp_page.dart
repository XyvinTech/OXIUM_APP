import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/otpnumberPage_controller.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterOtpPage extends GetView<OtpNumberPageController> {
  const EnterOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.9),
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
                currentStep: 2,
                minHeight: 8.h,
                progressColor: Color(0xff00FFB3),
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.020,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      CustomBigText(
                        text: "Confirm OTP",
                        size: 21,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        width: 250.w,
                        child: CustomSmallText(
                          text:
                              "Enter the OTP we just send to verify your Number xxxxxxx701",
                          size: 16,
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: PinCodeTextField(
                            appContext: context,
                            length: 5,
                            pinTheme: PinTheme(
                              fieldHeight: 80.h,
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
                      // Wrap(
                      //   children: List.generate(
                      //     5,
                      //     (index) => InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         margin: EdgeInsets.only(
                      //             left: size.width * 0.0125,
                      //             right: size.width * 0.0125),
                      //         height: size.height * 0.1,
                      //         // width: size.width / 6.53,
                      //         width: size.width * .15,

                      //         decoration: BoxDecoration(
                      //           color: kwhite,
                      //           borderRadius: BorderRadius.circular(48),
                      //           border: Border.all(
                      //             width: 2,
                      //             color: Color(0xffE0E0E0),
                      //           ),
                      //         ),
                      //         child: Center(
                      //           child: TextFormField(
                      //             keyboardType: TextInputType.number,
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(1),
                      //               FilteringTextInputFormatter.digitsOnly,
                      //             ],
                      //             textAlign: TextAlign.center,
                      //             decoration: InputDecoration(
                      //               // contentPadding:
                      //               //     EdgeInsets.only(left: size.width * 0.0175),
                      //               border: InputBorder.none,
                      //             ),
                      //             onChanged: (Value) {
                      //               if (Value.length == 1) {
                      //                 FocusScope.of(context).nextFocus();
                      //               } else {
                      //                 FocusScope.of(context).previousFocus();
                      //               }
                      //             },
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomSmallText(
                              text: "Time remining is 30s",
                              textAlign: TextAlign.left,
                              size: 14,
                            ),
                            CustomSmallText(
                              text: "Resend OTP",
                              color: Color(0xff0047C3),
                              size: 16,
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ),
                      height(size.height * 0.3),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: AppButton(
                          text: "Verify Number",
                          onTap: () {
                            Get.toNamed(Routes.welcometoevRoute);
                          },
                        ),
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
