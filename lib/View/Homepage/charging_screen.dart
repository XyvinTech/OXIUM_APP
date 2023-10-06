// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/charging_screen_controller.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Homepage/ChargningAnimations/lottie_loading_animation.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/cached_network_image.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Singletones/dialogs.dart';
import 'ChargningAnimations/gradiant_circular_progressbar.dart';
import 'ChargningAnimations/percentage_circular_progress_indicator.dart';

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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .0,
                              vertical: size.height * .02),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                          'assets/svg/arrow_back_ios.svg'))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: CustomText(
                                          text: 'Charging Session',
                                          size: 18,
                                          color: Color(0xff4F4F4F),
                                          fontWeight: FontWeight.bold))),
                              width(24)
                            ],
                          ),
                        ),
                        Container(
                          height: 400.h,
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
                                  child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Obx(
                                        () => controller.chargingStatus.value ==
                                                    'initiating' ||
                                                ((controller.chargingStatus
                                                            .value.isEmpty ||
                                                        controller
                                                                .booking_model
                                                                .value
                                                                .outputType ==
                                                            'AC') &&
                                                    (controller.chargingStatus
                                                            .value !=
                                                        'finished'))
                                            ? GradientIndicator()
                                            : PercentageIndicator(
                                                progress: (controller
                                                            .status_model
                                                            .value
                                                            .SOC /
                                                        100.0) +
                                                    .001),
                                      )),
                                  Container(
                                      // color: Colors.amber,
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      height(55.h),
                                      Image.asset(
                                        'assets/images/bolt.png',
                                        height: 50,
                                      ),
                                      height(5.h),
                                      CustomText(
                                        text:
                                            '${controller.status_model.value.SOC}%',
                                        isItalic: true,
                                        fontWeight: FontWeight.w700,
                                        size: 20,
                                        color: Color(0xff2F80ED),
                                      ),
                                      height(20.h),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: '${controller.time[0]}',
                                                fontWeight: FontWeight.bold,
                                                size: 16,
                                                color: Color(0xff0047C2),
                                              ),
                                              CustomText(
                                                text: 'hrs',
                                                fontWeight: FontWeight.w400,
                                                size: 12,
                                                color: Color(0xff828282),
                                              ),
                                            ],
                                          ),
                                          width(10.w),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: '${controller.time[1]}',
                                                fontWeight: FontWeight.bold,
                                                size: 16,
                                                color: Color(0xff0047C2),
                                              ),
                                              CustomText(
                                                text: 'min',
                                                fontWeight: FontWeight.w400,
                                                size: 12,
                                                color: Color(0xff828282),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              )),
                              if (controller.chargingStatus.value ==
                                      "connected" ||
                                  controller.chargingStatus.value == "progress")
                                CustomBigText(
                                    text: "Charging In Progress",
                                    size: 12.sp,
                                    color: Color(0xff828282))
                              else if (controller.chargingStatus.value ==
                                  "finishing")
                                CustomBigText(
                                    text: "Charging finishing...",
                                    size: 12.sp,
                                    color: Color(0xff828282))
                              else if (controller.chargingStatus.value ==
                                  "finished")
                                CustomBigText(
                                    text: "Charging Finished",
                                    size: 12.sp,
                                    color: Color(0xff0047C3))
                              else if (controller.chargingStatus.value ==
                                  "completed")
                                CustomBigText(
                                    text: "Charging Completed",
                                    size: 12.sp,
                                    color: Color(0xff219653))
                              else if (controller.chargingStatus.value ==
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
                              else if (controller.chargingStatus.value ==
                                  'initiating')
                                CustomBigText(
                                    text: "Initiating ...",
                                    size: 12.sp,
                                    color: Color(0xff0047C3))
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
                                      // Image.asset(
                                      //     width: 76, "assets/images/jeep1.png"),
                                      cachedNetworkImage(
                                          appData.userModel.value.defaultVehicle
                                              .icon,
                                          width: 80.sp),
                                      SizedBox(width: 13),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomSmallText(
                                              text: appData
                                                  .userModel
                                                  .value
                                                  .defaultVehicle
                                                  .vehicleDetails),
                                          CustomBigText(
                                            text: appData.userModel.value
                                                .defaultVehicle.modelName,
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
                                      text:
                                          "${controller.status_model.value.OutputType} ${controller.status_model.value.Capacity} KwH",
                                      size: 14.sp,
                                      color: Color(0xff4F4F4F),
                                    ),
                                    Row(
                                      children: [
                                        CustomBigText(
                                          text:
                                              "${controller.status_model.value.ConnectorType}",
                                          size: 14.sp,
                                          color: Color(0xff4F4F4F),
                                        ),
                                        SizedBox(width: 14.w),
                                        if (controller.status_model.value
                                            .ConnectorType.isNotEmpty)
                                          SvgPicture.asset(
                                              height: 24.h,
                                              "assets/svg/${controller.status_model.value.ConnectorType.toLowerCase()}.svg")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.00),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomSmallText(
                                      text: 'Tariff',
                                      size: 12,
                                    ),
                                    CustomSmallText(
                                      text:
                                          '₹ ${controller.status_model.value.tariff} /KwH',
                                      size: 12,
                                    ),
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
                                    Obx(
                                      () => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomBigText(
                                              text:
                                                  "₹${(controller.status_model.value.amount + controller.status_model.value.taxamount).toStringAsFixed(2)}",
                                              size: 16.sp,
                                              color: Color(0xff0047C3),
                                            ),
                                            CustomBigText(
                                              text:
                                                  "${controller.status_model.value.unit.toStringAsFixed(2)} kWh",
                                              size: 16.sp,
                                              color: Color(0xff0047C3),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              //  !buttons
                              if (controller.chargingStatus.value ==
                                      "progress" ||
                                  controller.chargingStatus.value ==
                                      'finishing')
                                _withBgBtn(
                                  text: controller.chargingStatus.value ==
                                          'finishing'
                                      ? 'Finishing...'
                                      : 'Stop Charging',
                                  onTap: () async {
                                    if (controller.chargingStatus.value ==
                                        'progress') {
                                      controller.chargingStatus.value =
                                          'finishing';
                                    }
                                    if (Get.isDialogOpen == false)
                                      Dialogs().gunStatusAlert('Finishing up',
                                          'Please wait till Charging session is finished to unplug the charger');
                                    controller.changeStatus(
                                        isStart: false,
                                        bookingId: controller
                                            .booking_model.value.bookingId);
                                  },
                                  color: controller.chargingStatus.value ==
                                          'finishing'
                                      ? Colors.grey.shade500
                                      : Color(0xffEB5757),
                                  textColor: Color(0xffF2F2F2),
                                )
                              else if (controller.chargingStatus.value ==
                                  "connected")
                                _withBgBtn(text: 'Connected', onTap: () {})
                              else if (controller.chargingStatus.value ==
                                      "finished" ||
                                  controller.chargingStatus.value ==
                                      "completed" ||
                                  controller.chargingStatus.value ==
                                      "disconnected")
                                // _dualBtn(
                                //     (){controller.toReconnect()},
                                //    (){controller.toReconnect()})
                                _dualBtn(() async {
                                  controller.downloadInvoice();
                                }, () {
                                  controller.onClickFinished();
                                })
                              else
                                _connectingBtn(onTap: () {
                                  // controller.toConnected();
                                })
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )));
  }

  Widget _withBgBtn(
      {required String text,
      VoidCallback? onTap,
      Color? color,
      Color? textColor}) {
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

  Widget _dualBtn(VoidCallback? onTap_left, VoidCallback? onTap_right) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: InkWell(
              onTap: onTap_left,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff0047C3)),
                      borderRadius: BorderRadius.circular(56.r)),
                  child: Center(
                    child: CustomBigText(
                      text: "Download Invoice",
                      size: 14.sp,
                      color: Color(0xff0047C3),
                    ),
                  )),
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Flexible(
            child: InkWell(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
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

  Widget _connectingBtn({VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xff0047C3)),
              borderRadius: BorderRadius.circular(56.r)),
          child: Row(
            children: [
              Obx(
                () => CustomBigText(
                  text: controller.chargingStatus.value == 'initiating'
                      ? 'Initiating...'
                      : "Connecting...",
                  size: 14.sp,
                  color: Color(0xff0047C3),
                ),
              ),
              Spacer(),
              Expanded(
                child: Container(child: LottieLoadingWidget()),
              )
            ],
          )),
    );
  }
}
