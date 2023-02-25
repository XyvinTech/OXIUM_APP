import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/feedback_page_controller.dart';
import '../../../constants.dart';
import '../../Widgets/apptext.dart';

class PaymentFeedbackScreen extends GetView<FeedBackPageController> {
  const PaymentFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            height(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 150.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        color: Color(0xff000000).withOpacity(.06),
                      )
                    ]),
                child: Column(
                  children: [
                    height(30.h),
                    CustomSmallText(
                      text: "How is your Experience",
                      size: 14.sp,
                      letterspacing: -0.408,
                    ),
                    height(35.h),
                    Wrap(
                      children: List.generate(
                          5,
                          (index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: SvgPicture.asset(
                                  "assets/svg/star_rate.svg",
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ),
            height(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 470.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        color: Color(0xff000000).withOpacity(.06),
                      )
                    ]),
                child: Column(
                  children: [
                    height(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ExpandablePanel(
                        collapsed: ExpandableButton(
                          child: Container(
                            height: 54.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: Color(0xffBDBDBD),
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13.w),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => CustomBigText(
                                        text: controller.selectName.value,
                                        size: 14.sp,
                                        color: Color(0xff4F4F4F),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        "assets/svg/arrow_downward_ios.svg")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        expanded: ExpandableButton(
                          child: Obx(
                            () => Container(
                                height: 265.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: kwhite,
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       offset: Offset(0, 4),
                                  //       blurRadius: 21,
                                  //       spreadRadius: 0,
                                  //       color: Color(0xff000000).withOpacity(0.22))
                                  // ],
                                ),
                                child: ListView.builder(
                                    itemCount: controller.selected.length,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.w),
                                        child: InkWell(
                                          onTap: () {
                                            controller.selectName.value =
                                                controller.selected[index];
                                          },
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(5.w),
                                                  child: CustomBigText(
                                                    ontap: () {},
                                                    text:
                                                        "${controller.selected[index].toString()}",
                                                    size: 14.sp,
                                                    color: Color(0xff4F4F4F),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.h,
                                                  color: Color(0xffBDBDBD),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                          ),
                        ),
                      ),
                    ),
                    height(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        height: 265.h,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xffBDBDBD),
                            )),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Leave Your Feedback here",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.41,
                                  color: Color(0xffBDBDBD)),
                              contentPadding: EdgeInsets.all(8)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _process() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5.w),
              child: CustomBigText(
                ontap: () {},
                text: "Payment Process",
                size: 14.sp,
                color: Color(0xff4F4F4F),
              ),
            ),
            Divider(
              thickness: 1.h,
              color: Color(0xffBDBDBD),
            ),
            Padding(
              padding: EdgeInsets.all(5.w),
              child: CustomBigText(
                ontap: () {},
                text: "Charging Experience",
                size: 14.sp,
                color: Color(0xff4F4F4F),
              ),
            ),
            Divider(
              thickness: 1.h,
              color: Color(0xffBDBDBD),
            ),
            Padding(
              padding: EdgeInsets.all(5.w),
              child: CustomBigText(
                ontap: () {},
                text: "Finding Your destination",
                size: 14.sp,
                color: Color(0xff4F4F4F),
              ),
            ),
            Divider(
              thickness: 1.h,
              color: Color(0xffBDBDBD),
            ),
            Padding(
              padding: EdgeInsets.all(5.w),
              child: CustomBigText(
                ontap: () {},
                text: "Custom",
                size: 14.sp,
                color: Color(0xff4F4F4F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
