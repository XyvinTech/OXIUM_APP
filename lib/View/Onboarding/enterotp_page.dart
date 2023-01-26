import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_app/Controller/otpnumberPage_controller.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class EnterOtpPage extends GetView<OtpNumberPageController> {
  const EnterOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.9),
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
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomBigText(text: "Confirm OTP"),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.center,
                  child:
                      CustomSmallText(text: "Enter the OTP we just send to   "),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomSmallText(
                      text: "verify your Number +91 0123658948"),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Obx(
                  () => Wrap(
                    children: List.generate(
                      5,
                      (index) => InkWell(
                        onTap: () {
                          controller.isIndex.value = index;
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: size.width * 0.025),
                          height: size.height * 0.1,
                          // width: size.width / 6.53,
                          width: size.width * .15,

                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(48),
                            border: Border.all(
                              width: 2,
                              color: controller.isIndex == index
                                  ? Color(0xff0047C3).withOpacity(.6)
                                  : Color(0xffE0E0E0),
                            ),
                          ),
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                // contentPadding:
                                //     EdgeInsets.only(left: size.width * 0.0175),
                                border: InputBorder.none,
                              ),
                              onChanged: (Value) {
                                if (Value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSmallText(
                      text: "Time remining is 30s",
                      size: 12,
                    ),
                    CustomSmallText(
                      text: "Resend OTP",
                      color: Color(0xff0047C3),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.3,
                ),
                AppButton(
                  text: "Verify Number",
                  onTap: () {
                    Get.toNamed(Routes.welcometoevRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
