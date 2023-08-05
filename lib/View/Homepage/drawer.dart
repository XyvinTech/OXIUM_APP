import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Singletones/app_data.dart';
import '../Widgets/appbutton.dart';
import '../Widgets/cached_network_image.dart';

Widget CustomDrawer(BuildContext context) {
  bool isLoggedIn = appData.userModel.value.username.isNotEmpty;
  TextEditingController phoneController = TextEditingController();
  RxString countryCode = "91".obs;
  RxString textfield = "".obs;
  RxBool checked = false.obs;
  return Drawer(
    width: size.width * .75,
    child: Container(
      child: Column(children: [
        Container(
          height: size.height * .23,
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          color: Color(0xff0047C2),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset('assets/svg/drawer_logo.svg'),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                size: 32.sp,
                color: Colors.white,
              ),
            )
          ]),
        ),
        InkWell(
          onTap: () {
            if (isLoggedIn) {
              Get.back();
              Get.toNamed(Routes.profilePageRoute);
            } else {
              Get.bottomSheet(Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
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
                                        print(
                                            'Select country: ${country.displayName}');
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
                                      SvgPicture.asset(
                                          "assets/svg/expand_all.svg")
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
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.0034),
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
                                        color:
                                            Color.fromARGB(255, 135, 135, 135),
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
                          onTap: () {},
                        ),
                      ),
                      Spacer(flex: 1),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: CheckboxListTile(
                            title: CustomSmallText(
                                text: 'Click to agree to TC & Privacy Policy'),
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
              ));
            }
          },
          child: Container(
            height: size.height * .12,
            color: Color(0xff00399B),
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: size.height * .07,
                  width: size.height * .07,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  //replace child with cachedNetworkImage with url
                  child:
                      // cachedNetworkImage(imageUrl)
                      // Image.asset('assets/images/profile_pic.png'),
                      ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: isLoggedIn
                        ? Obx(() =>
                            cachedNetworkImage(appData.userModel.value.image))
                        : Container(
                            height: 5,
                            child: Image.asset(
                              "assets/images/user.png",
                            ),
                          ),
                  ),
                ),
              ),
              width(size.width * .03),
              isLoggedIn
                  ? Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: appData.userModel.value.name,
                              fontWeight: FontWeight.bold,
                              minFontSize: 18.sp,
                              color: Colors.white),
                          height(size.height * .002),
                          CustomText(
                              text: '+91 ' + appData.userModel.value.username,
                              fontWeight: FontWeight.normal,
                              size: 14.sp,
                              isAutoSize: true,
                              color: Colors.white),
                        ],
                      ),
                    )
                  : Text(
                      "Login Now",
                      style: kAppJoinGOECTextStyle,
                    ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
            ]),
          ),
        ),
        height(size.height * .03),
        isLoggedIn
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04, vertical: size.height * .02),
                child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.myvehicleRoute);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/directions_car.svg'),
                        width(size.width * .05),
                        CustomText(
                          text: 'My Vehicle',
                          color: Color(0xff4F4F4F),
                          size: 15.sp,
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(),
        // height(size.height * .05),
        isLoggedIn
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04, vertical: size.height * .02),
                child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.rfidNumberRoute);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/credit_card.svg'),
                      width(size.width * .05),
                      CustomText(
                        text: 'RFID',
                        color: Color(0xff4F4F4F),
                        size: 15.sp,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              )
            : Center(),
        // height(size.height * .05),
        isLoggedIn
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04, vertical: size.height * .02),
                child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.partnerPageRoute);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/handshake.svg'),
                      width(size.width * .04),
                      CustomText(
                        text: 'Partner with us',
                        color: Color(0xff4F4F4F),
                        size: 15.sp,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              )
            : Center(),
        isLoggedIn
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04, vertical: size.height * .02),
                child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.favouritePageRoute);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/favorite.svg',
                        width: 24.sp,
                        color: Color(0xff4f4f4f),
                      ),
                      width(size.width * .04),
                      CustomText(
                        text: 'Favourites',
                        color: Color(0xff4F4F4F),
                        size: 15.sp,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              )
            : Center(),
        // height(size.height * .05),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .04, vertical: size.height * .02),
          child: InkWell(
            onTap: () {
              Get.back();
              Get.toNamed(Routes.helpPageRoute);
            },
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/support_agent.svg'),
                width(size.width * .05),
                CustomText(
                  text: 'Help',
                  color: Color(0xff4F4F4F),
                  size: 15.sp,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        // height(size.height * .05),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .04, vertical: size.height * .02),
          child: InkWell(
            onTap: () {
              Get.back();
              Get.toNamed(Routes.aboutPageRoute);
            },
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/info.svg'),
                width(size.width * .05),
                CustomText(
                  text: 'About us',
                  color: Color(0xff4F4F4F),
                  size: 15.sp,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        CustomText(text: 'Version 1.0', color: Color(0xff828282), size: 13),
        height(size.height * .012)
      ]),
    ),
  );
}
