// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:freelancer_app/Controller/charging_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';

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
                              if (controller.chargignStatus.value ==
                                      "connected" ||
                                  controller.chargignStatus.value == "progress")
                                CustomBigText(
                                    text: "Charging In Progress",
                                    size: 12.sp,
                                    color: Color(0xff828282))
                              else if (controller.chargignStatus.value ==
                                  "finished")
                                CustomBigText(
                                    text: "Charging Finished",
                                    size: 12.sp,
                                    color: Color(0xff0047C3))
                              else if (controller.chargignStatus.value ==
                                  "completed")
                                CustomBigText(
                                    text: "Charging Completed",
                                    size: 12.sp,
                                    color: Color(0xff219653))
                              else if (controller.chargignStatus.value ==
                                  "disconnected")
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          width: 13,
                                          height: 13,
                                          "assets/images/errer.png"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      CustomBigText(
                                          text: "Charger Disconnected",
                                          size: 12.sp,
                                          color: Color(0xffEB5757))
                                    ],
                                  ),
                                )
                              else
                                CustomBigText(
                                    text: "Connecting ...",
                                    size: 12.sp,
                                    color: Color(0xff0047C3)),
                              SizedBox(
                                height: 24.h,
                              ),
                              SizedBox(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                               //  !buttons
                              if (controller.chargignStatus.value == "progress")
                                _withBgBtn(
                                  text: 'Connected',
                                  onTap: controller.toReconnect,
                                  color: Color(0xffEB5757),
                                  textColor: Color(0xffF2F2F2),
                                )
                              else if (controller.chargignStatus.value ==
                                  "connected")
                                _withBgBtn(
                                    text: 'Connected',
                                    onTap: controller.toProgress)
                              else if (controller.chargignStatus.value ==
                                      "finished" ||
                                  controller.chargignStatus.value ==
                                      "completed" ||
                                  controller.chargignStatus.value ==
                                      "disconnected")
                                _dualBtn(
                                    onTap_left: controller.toReconnect,
                                    onTap_right: controller.toReconnect)
                              else
                                _reconnectBtn(onTap: controller.toConnected)
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )));
  }
}

class _withBgBtn extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String text;
  final VoidCallback? onTap;
  const _withBgBtn({
    Key? key,
    this.color,
    this.textColor,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          decoration: BoxDecoration(
              color: color ?? Color(0xffD0FFE4),
              borderRadius: BorderRadius.circular(56.r)),
          child: Center(
            child: CustomBigText(
              text: text,
              size: 14.sp,
              color: textColor ?? Color(0xff219653),
            ),
          )),
      onTap: onTap,
    );
  }
}

class _dualBtn extends StatelessWidget {
  final VoidCallback? onTap_left;
  final VoidCallback? onTap_right;
  const _dualBtn({
    Key? key,
    this.onTap_left,
    this.onTap_right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: InkWell(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff0047C3)),
                      borderRadius: BorderRadius.circular(56.r)),
                  child: Center(
                    child: CustomBigText(
                      text: "Reconnect",
                      size: 14.sp,
                      color: Color(0xff0047C3),
                    ),
                  )),
              onTap: onTap_left,
            ),
          ),
          SizedBox(
            width: 26.w,
          ),
          Flexible(
            child: InkWell(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  decoration: BoxDecoration(
                      color: Color(0xff0047C3),
                      borderRadius: BorderRadius.circular(56.r)),
                  child: Center(
                    child: CustomBigText(
                      text: "Finish",
                      size: 14.sp,
                      color: Color(0xffF2F2F2),
                    ),
                  )),
              onTap: onTap_right,
            ),
          )
        ],
      ),
    );
  }
}

class _reconnectBtn extends StatelessWidget {
  final VoidCallback? onTap;
  const _reconnectBtn({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xff0047C3)),
                borderRadius: BorderRadius.circular(56.r)),
            child: Row(
              children: [
                CustomBigText(
                  text: "Reconnect",
                  size: 14.sp,
                  color: Color(0xff0047C3),
                ),
                Container()
              ],
            )),
        onTap: onTap);
  }
}
