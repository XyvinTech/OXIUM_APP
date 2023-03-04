import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/feedback_page_controller.dart';
import 'package:get/get.dart';

import '../../../Utils/toastUtils.dart';
import '../../../constants.dart';
import '../../Widgets/apptext.dart';

class ThankForFeedbackScreen extends GetView<FeedBackPageController> {
  const ThankForFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          padding: EdgeInsets.all(5.w),
                          child: SvgPicture.asset(
                              'assets/svg/arrow_back_ios.svg'))),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: CustomBigText(
                          text: 'Feedbacks',
                          size: 16.sp,
                          color: Color(0xff828282),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  width(24.w)
                ],
              ),
            ),
            height(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                // height: 510.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        color: Color(0xff000000).withOpacity(0.06),
                      ),
                    ]),
                child: Column(
                  children: [
                    height(35.h),
                    CustomSmallText(
                      text: "How is your Experience",
                      size: 14.sp,
                      letterspacing: -0.408,
                    ),
                    height(40.h),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              2,
                              (index) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: SvgPicture.asset(
                                      "assets/svg/star_rate3.svg",
                                    ),
                                  )),
                        ),
                        Wrap(
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: SvgPicture.asset(
                                      "assets/svg/star_rate.svg",
                                    ),
                                  )),
                        ),
                      ],
                    ),
                    height(35.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.w),
                      child: CustomBigText(
                        text: "Thank you for your feedback",
                        color: Color(0xff333333),
                        align: TextAlign.center,
                        letterspacing: -0.408,
                      ),
                    ),
                    height(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.w),
                      child: CustomSmallText(
                        text:
                            "Yor feedback is valuable to us for the future developments ",
                        size: 14.sp,
                        textAlign: TextAlign.center,
                        letterspacing: -0.408,
                      ),
                    ),
                    height(100.h),
                    _button(
                      button: "Back to Maps",
                      onTap: () {},
                    ),
                    height(65.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _button({required String button, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: 237.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: Color(0xff0047C3),
        ),
        child: Center(
          child: CustomBigText(
            text: button,
            size: 14.sp,
            color: Color(0xffF2F2F2),
          ),
        ),
      ),
    );
  }
}
