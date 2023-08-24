import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';
import '../Widgets/apptext.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: _appBar(
                  title: "About us",
                  ontap: () {
                    Get.back();
                  }),
            ),
            height(20.h),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 240.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: kblue,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/abt.png",
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                  bottom: 5.h,
                  left: 25.w,
                  child: CustomBigText(
                    fontWeight: FontWeight.w500,
                    text: "About us",
                    size: 32,
                    color: kwhite,
                  ),
                ),
                Positioned(
                  bottom: 17.h,
                  left: 172.w,
                  child: Container(
                    height: 8.h,
                    width: 8.w,
                    color: Color(0xff007AFF),
                  ),
                ),
              ],
            ),
            height(22.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "We are a future-centric company that is an amalgamation of a skilled workforce, industry experts who have the experience, knowledge, and a commitment to the revolution in the EV industry. Our platform brings together people, possibilities, technology and integrates that with our expertise into a systematic network designed to deliver optimized solutions through India.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 13, color: Color(0xff1B1B1B)),
              ),
            ),
            height(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "Steered forward with the experience & vision of the management, we are redefining ourselves to match the future needs of a sustainable world through GOEC, a commitment to a cleaner and greener environment, and a complete solution for the electric vehicle industry with a diverse focus on manufacturing, infrastructure, and technology.",
                style: TextStyle(fontSize: 13, color: Color(0xff1B1B1B)),
                textAlign: TextAlign.justify,
              ),
            ),
            height(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "GOEC is transforming the future of electric automobiles through a strategic and collective network of Electric Vehicle (EV) charging stations across India.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff1B1B1B),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar({required String title, required void Function() ontap}) {
    return Row(
      children: [
        InkWell(
            onTap: ontap,
            child: Container(
                padding: EdgeInsets.all(5.w),
                child: SvgPicture.asset('assets/svg/arrow_back_ios.svg'))),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: CustomBigText(
              text: title,
              size: 16.sp,
              color: Color(0xff828282),
            ),
          ),
        ),
        width(24)
      ],
    );
  }
}
