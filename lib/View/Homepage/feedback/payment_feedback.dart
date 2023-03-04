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
import '../../../Utils/routes.dart';
import '../../../constants.dart';
import '../../Widgets/apptext.dart';

class PaymentFeedbackScreen extends GetView<FeedBackPageController> {
  const PaymentFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = "Payment Process";
    List<String> currnecy = <String>[
      "Payment Process",
      "Charging Experience",
      "Finding Your destination",
      "Custom",
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              height(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  height: 170.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 32,
                          color: Color(0xff000000).withOpacity(.06),
                        )
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
                      Wrap(
                        children: List.generate(
                            5,
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
                ),
              ),
              height(20.h),
              Padding(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, bottom: 40.w, top: 20.w),
                child: Container(
                  // height: 505.h,
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
                      Obx(
                        () => DropdownButton<String>(
                          value: controller.selectName.value,
                          items: controller.selected
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          icon: SvgPicture.asset(
                              "assets/svg/arrow_downward_ios.svg"),
                          onChanged: (String? val) {
                            controller.selectName.value = val.toString();
                          },
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      height(20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: TextFormField(
                          minLines: 11,
                          maxLines: 11,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              hintText: "Leave Your Feedback here",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Color(0xffBDBDBD),
                                  )),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.41,
                                  color: Color(0xffBDBDBD)),
                              contentPadding:
                                  EdgeInsets.only(left: 20.w, top: 25.h)),
                        ),
                      ),
                      height(30.h),
                      _button(
                        button: "Submit",
                        onTap: () {
                          Get.toNamed(Routes.thankfeedbackPageRoute);
                        },
                      ),
                      height(40.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget expandable() {
    return Padding(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => CustomBigText(
                        text: controller.selectName.value,
                        size: 14.sp,
                        color: Color(0xff4F4F4F),
                      ),
                    ),
                    SvgPicture.asset("assets/svg/arrow_downward_ios.svg")
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
                        padding: EdgeInsets.symmetric(horizontal: 13.w),
                        child: InkWell(
                          onTap: () {
                            controller.selectName.value =
                                controller.selected[index];
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
