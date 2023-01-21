import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: size.width * .75,
      child: Container(
        child: Column(children: [
          Container(
            height: size.height * .23,
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            color: Color(0xff0047C2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/svg/drawer_logo.svg'),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                ]),
          ),
          InkWell(
            onTap: () {
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
                        Image.asset('assets/images/profile_pic.png'),
                  ),
                ),
                width(size.width * .03),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: 'Jane Doe',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    height(size.height * .002),
                    CustomText(
                        text: '+91 9567892341',
                        fontWeight: FontWeight.normal,
                        size: 13,
                        isAutoSize: true,
                        color: Colors.white),
                  ],
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
          height(size.height * .065),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/directions_car.svg'),
                width(size.width * .05),
                CustomText(
                  text: 'My Vehicle',
                  color: Color(0xff4F4F4F),
                  size: 14,
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
          height(size.height * .05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/credit_card.svg'),
                width(size.width * .05),
                CustomText(
                  text: 'RFID',
                  color: Color(0xff4F4F4F),
                  size: 14,
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
          height(size.height * .05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/handshake.svg'),
                width(size.width * .05),
                CustomText(
                  text: 'Partner with us',
                  color: Color(0xff4F4F4F),
                  size: 14,
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
          height(size.height * .05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/support_agent.svg'),
                width(size.width * .05),
                CustomText(
                  text: 'Help',
                  color: Color(0xff4F4F4F),
                  size: 14,
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
          height(size.height * .05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/info.svg'),
                width(size.width * .05),
                CustomText(
                  text: 'About us',
                  color: Color(0xff4F4F4F),
                  size: 14,
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
          Spacer(),
          CustomText(text: 'Version 1.0', color: Color(0xff828282), size: 13),
          height(size.height * .012)
        ]),
      ),
    );
  }
}
