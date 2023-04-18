import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/qr_controller.dart';
import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:get/get.dart';

import '../Utils/routes.dart';
import '../Utils/toastUtils.dart';
import '../View/Widgets/apptext.dart';
import '../constants.dart';
import 'app_data.dart';

class Dialogs {
  //make it singleTone class
  static final Dialogs _singleton = Dialogs._internal();
  factory Dialogs() {
    return _singleton;
  }
  Dialogs._internal();

  tariffPopUp(BookingModel _bookingModel) {
    Get.dialog(
        AlertDialog(
          backgroundColor: kscaffoldBackgroundColor,
          contentPadding: EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
          content: Container(
            padding: EdgeInsets.all(20.w),
            height: 370.h,
            width: 348.w,
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: 'Initiate Charging',
                        color: Color(0xff828282),
                        size: 15,
                        fontWeight: FontWeight.bold),
                    IconButton(
                      onPressed: () {
                        Get.back();
                        if (Get.currentRoute == Routes.qrScanPageRoute) {
                          QrController _controller = Get.find();
                          _controller.qrViewController?.resumeCamera();
                        }
                      },
                      icon: Icon(Icons.close),
                      splashRadius: 20,
                    )
                  ],
                ),
                Divider(),
                Container(
                  height: 80.h,
                  // width: 80.w,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffEDF4FF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: 'DC 34 kWh',
                              color: Color(0xff4f4f4f),
                              size: 15,
                              fontWeight: FontWeight.bold),
                          Row(
                            children: [
                              CustomText(
                                  text: 'Type 2',
                                  color: Color(0xff4f4f4f),
                                  size: 15,
                                  fontWeight: FontWeight.bold),
                              width(8.w),
                              SvgPicture.asset(
                                'assets/svg/type 2.svg',
                                color: Color(0xff4f4f4f),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSmallText(
                            text: 'Tariff',
                            size: 13,
                          ),
                          CustomSmallText(
                            text: '₹ 22 /KwH',
                            size: 13,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height(20.h),
                Container(
                  height: 80.h,
                  // width: 80.w,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffFFFFFF),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/jeep1.png",
                              height: size.height * 0.05,
                              width: size.width * 0.15,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSmallText(
                                text: "Jeep",
                                size: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomBigText(
                                text: "RUBICON",
                                size: 15.sp,
                                color: Color(0xff4F4F4F),
                              ),
                            ],
                          )
                        ],
                      ),
                      //refresh button
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.myvehicleRoute);
                        },
                        child: Image.asset(
                          "assets/images/refresh.png",
                          width: size.height * 0.025,
                        ),
                      ),
                    ],
                  ),
                ),
                // height(15.h),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.chargingPageRoute,
                        arguments: [appData.qr, _bookingModel]);
                  },
                  child: Container(
                    height: 56.h,
                    width: 156.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: Color(0xff0047C3),
                    ),
                    child: Center(
                      child: CustomBigText(
                        text: "Start Charging",
                        size: 15.sp,
                        color: Color(0xffF2F2F2),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }

  notEnoughCreditPopUp() {
    Get.dialog(
        AlertDialog(
            backgroundColor: kwhite,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.w)),
            content: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                height: 370.h,
                width: 360.w,
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: 'Payments',
                            color: Color(0xff828282),
                            size: 15,
                            fontWeight: FontWeight.bold),
                        IconButton(
                          onPressed: () {
                            Get.back();
                            if (Get.currentRoute == Routes.qrScanPageRoute) {
                              QrController _controller = Get.find();
                              _controller.qrViewController?.resumeCamera();
                            }
                          },
                          icon: Icon(Icons.close),
                          splashRadius: 20,
                        )
                      ],
                    ),
                    Divider(),
                    Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFEBEB),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/info-circle.png",
                          // height: 17,
                          width: 50.sp,
                        ),
                      ),
                    ),
                    height(10.h),
                    CustomBigText(
                      text: "Not Enough Credit\nto Charge",
                      size: 20.sp,
                      align: TextAlign.center,
                      color: Color(0xff4F4F4F),
                    ),
                    height(10.h),
                    CustomSmallText(
                      text: "Recharge for a minimum of 200 Coins charging",
                      size: 13.sp,
                      textAlign: TextAlign.center,
                    ),
                    height(10.h),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.popupPageRoute);
                      },
                      child: Container(
                        height: 56.h,
                        width: 156.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: Color(0xff0047C3),
                        ),
                        child: Center(
                          child: CustomBigText(
                            text: "Recharge Now",
                            size: 15.sp,
                            color: Color(0xffF2F2F2),
                          ),
                        ),
                      ),
                    )
                  ],
                ))),
        barrierDismissible: false);
  }

  rechargePopUp({required bool isSuccess}) {
    Get.dialog(
        AlertDialog(
            backgroundColor: kwhite,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.w)),
            content: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                height: 370.h,
                width: 360.w,
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: 'Payments',
                            color: Color(0xff828282),
                            size: 15,
                            fontWeight: FontWeight.bold),
                        IconButton(
                          onPressed: () {
                            Get.back();
                            if (Get.currentRoute == Routes.qrScanPageRoute) {
                              QrController _controller = Get.find();
                              _controller.qrViewController?.resumeCamera();
                            }
                          },
                          icon: Icon(Icons.close),
                          splashRadius: 20,
                        )
                      ],
                    ),
                    Divider(),
                    Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isSuccess ? Color(0xffEBF8F1) : Color(0xffFFEBEB),
                      ),
                      child: Center(
                        child: Image.asset(
                          isSuccess
                              ? "assets/images/tick-circle.png"
                              : "assets/images/close-circle.png",
                          // height: 17,
                          width: 50.sp,
                        ),
                      ),
                    ),
                    height(10.h),
                    CustomBigText(
                      text: isSuccess
                          ? "Recharge is successful"
                          : "Recharge Failed",
                      size: 20.sp,
                      align: TextAlign.center,
                      color: Color(0xff4F4F4F),
                    ),
                    height(10.h),
                    CustomSmallText(
                        text: isSuccess ? 'Amount credited' : 'Amount'),
                    CustomText(
                        text: '${appData.rechargeAmount} Coins',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4f4f4f)),
                    height(5.h),
                    CustomSmallText(
                      text: isSuccess
                          ? "Coins Successfully credited to your wallet"
                          : "Sorry for the inconvenience , Please try again",
                      size: 13.sp,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        if (isSuccess) {
                          Get.back();
                          CommonFunctions().createBookingAndCheck(appData.qr);
                        } else {
                          Get.back();
                        }
                      },
                      child: Container(
                        height: 56.h,
                        width: 156.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: Color(0xff0047C3),
                        ),
                        child: Center(
                          child: CustomBigText(
                            text: isSuccess ? "Start Charging" : "Retry",
                            size: 15.sp,
                            color: Color(0xffF2F2F2),
                          ),
                        ),
                      ),
                    ),
                    height(5.h),
                  ],
                ))),
        barrierDismissible: false);
  }
}
