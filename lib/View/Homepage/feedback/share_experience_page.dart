import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../../Controller/feedback_page_controller.dart';
import '../../../Utils/routes.dart';

class ShareExperienceScreen extends GetView<FeedBackPageController> {
  const ShareExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
              child: Container(
                // height: 370.h,
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
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    height(40.h),
                    SvgPicture.asset("assets/svg/tik1.svg"),
                    height(25.h),
                    CustomBigText(
                      text: "Credit coins deducated!",
                      size: 20.sp,
                      color: Color(0xff219653),
                    ),
                    height(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.w),
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomSmallText(
                            text:
                                "Credit coins for your charging has been deducted",
                            size: 14.sp,
                            textAlign: TextAlign.center,
                          )),
                        ],
                      ),
                    ),
                    height(40.h),
                    Obx(
                      () => _card(
                          energy: "${controller.status_model.value.unit}",
                          amount:
                              "${(controller.status_model.value.amount + controller.status_model.value.taxamount).toStringAsFixed(2)}"),
                    ),
                    height(50.h),
                  ],
                ),
              ),
            ),
            // height(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              child: Container(
                // height: 270.h,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    height(20.h),
                    CustomSmallText(
                      text: "How is your Experience",
                      size: 14.sp,
                      letterspacing: -0.408,
                    ),
                    height(25.h),
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
                    height(40.h),
                    _button(
                      buttonName: "Leave a Feedback",
                      onTap: () {
                        Get.toNamed(Routes.paymentfeedbackPageRoute);
                      },
                    ),
                    height(20.h),
                    InkWell(
                      onTap: () {
                        controller.backToMaps();
                      },
                      child: CustomBigText(
                        text: "Return to maps",
                        size: 14.sp,
                      ),
                    ),
                    height(35.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({required String energy, required String amount}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        height: 85.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            width: 1.3.w,
            color: Color(0xff219653),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, right: 8.w),
                    child: Center(
                      child: CustomSmallText(
                        text: "Total Energy",
                        size: 12.sp,
                        // color: Color(0xff0047C3),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CustomBigText(
                        text: energy,
                        size: 24.sp,
                        color: Color(0xff4F4F4F),
                      ),
                      width(4.w),
                      CustomSmallText(
                        text: "kWh",
                        size: 14.sp,
                      )
                    ],
                  )
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, right: 8.w),
                    child: Center(
                      child: CustomSmallText(
                        text: "Amount Debited",
                        size: 12.sp,
                        // color: Color(0xff0047C3),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CustomBigText(
                        text: amount,
                        size: 24.sp,
                        color: Color(0xff4F4F4F),
                      ),
                      width(5.w),
                      CustomSmallText(
                        text: "Coins",
                        size: 14.sp,
                      )
                    ],
                  )
                ],
              ),

              // Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     CustomSmallText(
              //       text: "Amount Debited",
              //       size: 12.sp,
              //       // textAlign: TextAlign.right,
              //     ),
              //     Row(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         CustomBigText(
              //           text: amount,
              //           size: 24.sp,
              //           // color: Color(0xffEB5757),
              //           color: Color(0xff4F4F4F),
              //           letterspacing: -0.408,
              //         ),
              //         width(10.w),
              //         CustomSmallText(
              //           text: 'Coins',
              //           size: 10.sp,
              //         ),
              //       ],
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _button({required String buttonName, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: 240.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: Color(0xff0047C3)),
        child: Center(
          child: CustomBigText(
            text: buttonName,
            size: 14.sp,
            color: Color(0xffF2F2F2),
          ),
        ),
      ),
    );
  }
}
