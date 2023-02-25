import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/charging_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class ChargingScreen extends GetView<ChargingScreenController> {
  const ChargingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => SafeArea(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(left: 21.w, right: 21.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 29.h,
                        ),
                        Container(
                          height: 411.h,
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 39.h, bottom: 42.h),
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(20).r,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(6, 0, 0, 0),
                                    blurRadius: 4.0,
                                    offset: Offset(-4, 4)),
                                BoxShadow(
                                    color: Color.fromARGB(6, 0, 0, 0),
                                    blurRadius: 4.0,
                                    offset: Offset(32, -4))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Container(
                                color: Colors.transparent,
                              )),
                              controller.isConnecting.value
                                  ? CustomBigText(
                                      text: "Charging In Progress",
                                      size: 13.sp,
                                      color: Color(0xff828282))
                                  : CustomBigText(
                                      text: "Connecting ...",
                                      size: 13.sp,
                                      color: Color(0xff0047C3)),
                              SizedBox(
                                height: 24.h,
                              ),
                              SizedBox(
                                width: 162,
                                child: Row(
                                  children: [
                                    Image.asset(
                                        width: 76, "assets/images/jeep1.png"),
                                    SizedBox(width: 13),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomSmallText(text: "Jeep"),
                                        CustomBigText(
                                          text: "RUBICON",
                                          size: 16,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        // ! second card
                        Container(
                          padding: EdgeInsets.only(
                              left: 26.w, top: 21.h, right: 28.w, bottom: 26.h),
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(20).r,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(6, 0, 0, 0),
                                    blurRadius: 4.0,
                                    offset: Offset(-4, 4)),
                                BoxShadow(
                                    color: Color.fromARGB(6, 0, 0, 0),
                                    blurRadius: 4.0,
                                    offset: Offset(32, -4))
                              ]),
                          child: Column(
                            children: [
                              CustomSmallText(
                                text: "Charger Details",
                                size: 12.sp,
                              ),
                              // ?first row
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 17.h, top: 14.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomBigText(
                                      text: "DC 34 kWh",
                                      size: 14.sp,
                                      color: Color(0xff4F4F4F),
                                    ),
                                    Row(
                                      children: [
                                        CustomBigText(
                                          text: "DC 34 kWh",
                                          size: 14.sp,
                                          color: Color(0xff4F4F4F),
                                        ),
                                        SizedBox(width: 14.w),
                                        Image.asset(
                                            height: 24.h,
                                            "assets/images/soket_icon.png")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color(0xffBDBDBD),
                                thickness: .6,
                              ),
                              // ?Second row
                              Container(
                                padding:
                                    EdgeInsets.only(bottom: 32.h, top: 17.h),
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomSmallText(
                                              text: "Charged Amount",
                                              size: 12.sp),
                                          CustomSmallText(
                                              text: "Energy consumed",
                                              size: 12.sp)
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomBigText(
                                            text: "₹ 2000",
                                            size: 16.sp,
                                            color: Color(0xff0047C3),
                                          ),
                                          CustomBigText(
                                            text: "234 kWh",
                                            size: 16.sp,
                                            color: Color(0xff0047C3),
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                              // ? Custom Button
                              controller.isConnecting.value
                                  ? InkWell(
                                      child: Container(
                                          height: 52.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color(0xffD0FFE4),
                                              borderRadius:
                                                  BorderRadius.circular(56.r)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1),
                                            child: Center(
                                              child: CustomBigText(
                                                text: "Reconnect",
                                                size: 14.sp,
                                                color: Color(0xff219653),
                                              ),
                                            ),
                                          )),
                                      onTap: () {
                                      
                                      },
                                    )
                                  : InkWell(
                                      child: Container(
                                          height: 52.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xff0047C3)),
                                              borderRadius:
                                                  BorderRadius.circular(56.r)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1),
                                            child: Row(
                                              children: [
                                                CustomBigText(
                                                  text: "Reconnect",
                                                  size: 14.sp,
                                                  color: Color(0xff0047C3),
                                                ),
                                                Container()
                                              ],
                                            ),
                                          )),
                                      onTap: () {
                                      
                                      },
                                    )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )));
  }
}
