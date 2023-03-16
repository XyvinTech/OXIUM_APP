import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/splash_screen_controller.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0047C3),
        body: Padding(
          padding: EdgeInsets.only(bottom: 45.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(330.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Image.asset(
                  "assets/images/splashicon.png",
                  height: 55.h,
                  width: 115.w,
                ),
              ),
              height(10.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: CustomBigText(
                  text: "Join the EV",
                  fontWeight: FontWeight.w500,
                  color: kwhite,
                  size: 20.sp,
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text:
                            'By selecting one or the other option you are agreeing ',
                        style: kAppBottomTextSpanTextStyle1,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'to the',
                        style: kAppBottomTextSpanTextStyle1,
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms & Conditions ',
                            style: kAppBottomTextSpanTextStyle2,
                          ),
                          TextSpan(
                            text: ' and ',
                            style: kAppBottomTextSpanTextStyle1,
                          ),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: kAppBottomTextSpanTextStyle2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
