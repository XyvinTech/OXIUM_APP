import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Singletones/app_data.dart';
import '../Widgets/cached_network_image.dart';

Widget CustomDrawer(BuildContext context) {
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
            Get.back();
            Get.toNamed(Routes.profilePageRoute);
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
                    child: Obx(() =>
                        cachedNetworkImage(appData.userModel.value.image)),
                  ),
                ),
              ),
              width(size.width * .03),
              Obx(
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
        Padding(
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
        ),
        // height(size.height * .05),
        Padding(
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
        ),
        // height(size.height * .05),
        Padding(
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
        ),
        Padding(
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
        ),
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
