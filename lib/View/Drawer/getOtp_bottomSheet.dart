import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../Widgets/appbutton.dart';
import '../Widgets/apptext.dart';
import 'enterOtp_bottomSheet.dart';

class GetOtpSheet extends StatelessWidget {
  const GetOtpSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    RxString countryCode = "91".obs;
    RxString textfield = "".obs;
    RxBool checked = false.obs;
    return SingleChildScrollView(
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
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: size.height * 0.45,
              child: Column(
                children: [
                  Spacer(flex: 2),
                  Text(
                    "Signup to Access",
                    style: kAppSignupStyle,
                  ),
                  Spacer(flex: 1),
                  Text(
                    "You Should Signup to Access this \nfunctionality",
                    textAlign: TextAlign.center,
                    style: kApphintTextStyle2,
                  ),
                  Spacer(flex: 2),
                  Container(
                    padding: EdgeInsets.only(
                      left: size.width * 0.05,
                    ),
                    height: size.height * 0.08,
                    width: size.width * 0.85,
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
                                    
                                    countryCode.value = country.phoneCode;
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "+${countryCode.value}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  SvgPicture.asset("assets/svg/expand_all.svg")
                                  // Center(
                                  //   child: Column(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     children: [
                                  //       RotatedBox(
                                  //         quarterTurns: 2,
                                  //         child: Icon(
                                  //           Icons.expand_more,
                                  //           size: 20,
                                  //         ),
                                  //       ),
                                  //       Icon(
                                  //         Icons.expand_more,
                                  //         size: 20,
                                  //       )
                                  //     ],
                                  //   ),
                                  // )
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
                        // Container(
                        //   height: size.height * 0.06,
                        //   width: size.width * 0.008,
                        //   color: Color(0xffE0E0E0),
                        // ),
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
                                controller: phoneController,
                                onChanged: (String value) {
                                  textfield.value = value;
                                },
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                inputFormatters: [
                                  // LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  hintText: "Enter your phone number",
                                  hintStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 135, 135, 135),
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
                  Spacer(flex: 1),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.85,
                    child: StartedButton(
                      color: Color(0xff0047C3),
                      text: "Get OTP",
                      isIcon: false,
                      textColor: Color(
                        0xffF2F2F2,
                      ),
                      //iconColor: Color(0xffF2F2F2),
                      onTap: () {
                        if (textfield.value == "") {
                          Get.snackbar("No Number", "Enter your phone no!");
                        } else if (checked.value == false) {
                          Get.snackbar(
                              "Agree to TC & PP", "Please tick the echeckbox!");
                        } else {
                          Get.back();
                          Get.bottomSheet(EnterOtpSheet());
                        }
                      },
                    ),
                  ),
                  Spacer(flex: 1),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: CheckboxListTile(
                        activeColor: Color(0xff0047C3),
                        title: Row(
                          children: [
                            CustomSmallText(text: 'Click to agree to '),
                            InkWell(
                              onTap: () {},
                              child: CustomSmallText(
                                text: 'T&C ',
                                color: kblue,
                              ),
                            ),
                            CustomSmallText(text: 'and '),
                            InkWell(
                              onTap: () {},
                              child: CustomSmallText(
                                text: 'Privacy Policy',
                                color: kblue,
                              ),
                            )
                          ],
                        ),
                        value: checked.value,
                        onChanged: (value) {
                          checked.value = value!;
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, // Align checkbox to the left
                      ),
                    );
                  }),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
