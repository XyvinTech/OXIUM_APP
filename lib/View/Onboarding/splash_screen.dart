import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/splash_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';

import '../../Singletones/injector.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (size.height == 0) {
      size = MediaQuery.of(context).size;
      // Injector().injectImages(context);
    }
    return Scaffold(
      backgroundColor: Color(0xff0047C3),
      body: Padding(
        padding: EdgeInsets.only(bottom: 45.h + controller.reload.value * 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Image.asset(
                  'assets/images/splash_G.png',
                  width: 250,
                  // color: Colors.grey.withOpacity(.2),
                ),
              ),
            ),
            // height(330.h),
            // Spacer(),
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
            Spacer(),
            Spacer(),
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
    );
  }
}
