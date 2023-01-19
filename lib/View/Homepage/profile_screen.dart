import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/profile_screen_controller.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/customText.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kDefaultHomePageBackgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .062,
                      vertical: size.height * .03),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                  'assets/svg/arrow_back_ios.svg'))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                  text: 'Profile',
                                  size: 14,
                                  color: Color(0xff828282),
                                  fontWeight: FontWeight.bold))),
                      width(24)
                    ],
                  )),
              height(size.width * .07),
              Container(
                height: size.height * .124,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * .11,
                      width: size.height * .11,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xff0047C3)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 7),
                          ]),
                      child: Container(
                        height: size.height * .11,
                        width: size.height * .11,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kDefaultHomePageBackgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.asset('assets/images/profile_pic.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.editProfilePageRoute);
                        },
                        child: Container(
                          // height: size.height * .03,
                          // width: size.height * .03,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff2F80ED),
                          ),
                          child: SvgPicture.asset('assets/svg/edit.svg'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              height(size.height * .01),
              CustomText(
                text: 'Jane Doe',
                size: 20,
                color: Color(0xff4F4F4F),
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: '+91 9567892341',
                color: Color(0xff828282),
                size: 14,
                fontWeight: FontWeight.w400,
              ),
              CustomText(
                text: 'janedoe@example.com',
                color: Color(0xffBDBDBD),
                fontWeight: FontWeight.w400,
              ),
              height(size.height * .04),
              CustomText(
                text: 'RFID Number',
                color: Color(0xffBDBDBD),
                size: 12,
                fontWeight: FontWeight.w400,
              ),
              height(size.height * .01),
              Container(
                height: size.height * .06,
                width: size.width * .6,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffB8CCF0))),
                child: CustomText(
                    text: 'XXXXXXXXXXXXXX',
                    size: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff828282)),
              ),
              height(size.height * .1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                            text: 'Total Sessions',
                            size: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff828282)),
                        height(size.height * .01),
                        CustomText(
                            text: '1234',
                            size: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff828282)),
                      ],
                    ),
                    Column(
                      children: [
                        CustomText(
                            text: 'Total Units',
                            size: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff828282)),
                        height(size.height * .01),
                        CustomText(
                            text: '3000 units',
                            size: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff828282)),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: size.height * .067,
                width: size.width * .65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xffEB5757).withOpacity(.20)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.logout, color: Color(0xffEB5757)),
                  width(size.width * .02),
                  CustomText(
                      text: 'Logout',
                      color: Color(0xffEB5757),
                      size: 14,
                      fontWeight: FontWeight.bold)
                ]),
              ),
              height(size.height * .04)
            ],
          ),
        ));
  }
}
