import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/qr_controller.dart';
import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/orderModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:freelancer_app/View/Charge/charge_transaction_dialog.dart';
import 'package:freelancer_app/View/Widgets/cached_network_image.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/calista_cafePage_controller.dart';
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
            height: 490.h,
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
                height(15.h),
                Container(
                  height: 80.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffEDF4FF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSmallText(
                        text: 'Charger Name',
                        size: 13,
                      ),
                      CustomText(
                          text: '${_bookingModel.chargerName}',
                          color: Color(0xff4f4f4f),
                          size: 15,
                          fontWeight: FontWeight.bold),
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
                    color: Color(0xffEDF4FF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text:
                                  '${_bookingModel.outputType} ${_bookingModel.capacity} kWh',
                              color: Color(0xff4f4f4f),
                              size: 15,
                              fontWeight: FontWeight.bold),
                          Row(
                            children: [
                              CustomText(
                                  text: '${_bookingModel.connectorType}',
                                  color: Color(0xff4f4f4f),
                                  size: 15,
                                  fontWeight: FontWeight.bold),
                              width(8.w),
                              SvgPicture.asset(
                                'assets/svg/${_bookingModel.connectorType.toLowerCase()}.svg',
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
                            text: '₹ ${_bookingModel.tariff} /KwH',
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
                          Obx(() => cachedNetworkImage(
                              appData.userModel.value.defaultVehicle.icon,
                              width: size.width * .18)),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomSmallText(
                                  text: appData.userModel.value.defaultVehicle
                                      .vehicleDetails,
                                  size: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomBigText(
                                  text: appData
                                      .userModel.value.defaultVehicle.modelName,
                                  size: 15.sp,
                                  color: Color(0xff4F4F4F),
                                ),
                              ],
                            ),
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
                    Get.offAllNamed(Routes.chargingPageRoute,
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

  wallet_transaction_popup({
    required OrderModel model,
  }) {
    kLog(model.status);
    String title = '';
    Color color = Colors.transparent;
    if (model.status == 'P') {
      title = 'Success';
      color = Color(0xff219653);
    } else if (model.statusUpdateBy == 'M' && model.status == 'I') {
      title = 'Pending';
      color = Color(0xffDF8600);
    } else {
      title = 'Failed';
      color = Color(0xffDC2525);
    }
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.all(0),
      content: Container(
        // height: size.height * 0.63,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBigText(
                    text: "Payments",
                    size: 14,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset("assets/svg/close.svg"),
                    ),
                  ),
                ],
              ),
            ),
            height(size.height * 0.01),
            Divider(
              thickness: size.height * 0.002,
              color: Color(0xffE0E0E0),
            ),
            height(size.height * 0.02),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.04,
                right: size.width * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/wallet_topup.svg',
                        width: size.width * 0.1,
                      ),
                      width(size.width * 0.04),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.00),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSmallText(
                              text: model.statusUpdateBy == 'M'
                                  ? 'Wallet Topup'
                                  : 'Admin topup',
                              letterspacing: -0.408,
                              size: 16,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/calendar_month.svg",
                                  width: size.width * 0.045,
                                ),
                                width(size.width * 0.01),
                                CustomSmallText(
                                  text: getTimeFromTimeStamp(
                                      model.pgOrderGenTime,
                                      'dd MMM yyyy hh:mm a'),
                                  size: 12,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  if (model.pgOrderId.isNotEmpty) ...[
                    height(size.height * .04),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSmallText(text: 'Order ID'),
                          CustomBigText(text: model.pgOrderId),
                        ],
                      ),
                    ),
                  ],
                  height(size.height * .04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSmallText(text: 'Payment Type'),
                          height(size.height * 0.01),
                          CustomBigText(
                            text: model.type,
                            color: Color(0xff5C5C5C),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSmallText(text: 'Payment Status'),
                          height(size.height * 0.01),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .03,
                                  vertical: size.width * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: color.withOpacity(.3)),
                              child: CustomSmallText(
                                text: title,
                                color: color,
                                fontWeight: FontWeight.bold,
                                size: 12,
                              )),
                        ],
                      ),
                    ],
                  ),
                  height(size.height * .045),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.008,
                        horizontal: size.width * 0.04),
                    height: size.height * 0.095,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xff219653),
                      ),
                    ),
                    child: Column(
                      children: [
                        CustomSmallText(
                          text: "Topup Added",
                          size: 12,
                        ),
                        height(size.height * 0.004),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomBigText(
                              text: "${model.amount.toStringAsFixed(2)}",
                              color: color,
                              size: 24,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomSmallText(
                              text: " Coins",
                              size: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  height(size.height * 0.04),
                  Visibility(
                    visible: title == 'Success',
                    child: InkWell(
                      onTap: () {
                        //TODO: on download invoice
                        CommonFunctions()
                            .downloadBookingInvoice(model.bookingId);
                        kLog(model.bookingId.toString());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/download.svg'),
                          width(size.width * .02),
                          CustomBigText(
                            text: 'Download invoice',
                            color: Color(0xff0047C3),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  height(25.h),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  charge_transaction_popup(
      {required BookingModel model,
      required final String stationName,
      required final String stationAddress}) {
    Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: EdgeInsets.all(0),
        content: ChargeTransactionDialog(
            model: model,
            stationName: stationName,
            stationAddress: stationAddress)));
  }

  connectPortTipDialog() {
    Get.dialog(
        Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: CustomText(text: 'Connect port please')),
        barrierDismissible: true);
  }

  Widget writeReviewDialog(CalistaCafePageController controller) {
    return AlertDialog(
      backgroundColor: kwhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.all(0),
      content: Container(
          padding: EdgeInsets.all(20.w),
          height: 460.h,
          width: 348.w,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 32,
                  color: Color(0xff000000).withOpacity(0.06),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSmallText(
                text: "How is your Experience?",
                size: 16.sp,
                letterspacing: -0.41,
              ),
              height(20.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Obx(
                  () => Row(
                    children: List.generate(
                        5,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectedRating.value = index + 1;
                                },
                                child: SvgPicture.asset(
                                  controller.selectedRating.value == 0 ||
                                          controller.selectedRating.value - 1 <
                                              index
                                      ? "assets/svg/star_rate.svg"
                                      : "assets/svg/star_rate3.svg",
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              height(25.h),
              TextFormField(
                minLines: 7,
                maxLines: 7,
                controller: controller.reviewController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "Leave Your Feedback here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff908484),
                        )),
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.41,
                        color: Color(0xffBDBDBD)),
                    contentPadding: EdgeInsets.only(left: 20.w, top: 25.h)),
              ),
              height(20.h),
              _button(
                  button: "Leave feedback",
                  onTap: () async {
                    bool status = await controller.postReviewForChargeStation();
                    if (status) Get.dialog(_responseDialougebox());
                  }),
              height(20.h),
              CustomBigText(
                ontap: () {
                  Get.back();
                },
                text: "Cancel",
                size: 15.sp,
                color: Color(0xff0047C3),
              )
            ],
          )),
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

  Widget _responseDialougebox() {
    return AlertDialog(
      backgroundColor: kwhite,
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
      content: Container(
        padding: EdgeInsets.all(20.w),
        // height: 265.h,
        width: 348.w,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffEBF8F1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.w,
                          color: Color(0xff05A660),
                        )),
                    child: Center(
                      child: Image.asset(
                        "assets/images/vector1.png",
                        height: 17,
                        width: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height(15.h),
            CustomBigText(
              text: "Thank you for your response",
              size: 20.sp,
              align: TextAlign.center,
              color: Color(0xff4F4F4F),
            ),
            height(10.h),
            CustomSmallText(
              text: "Your response has been added",
              size: 13.sp,
            ),
            height(10.h),
            InkWell(
              onTap: () {
                Get.offAllNamed(Routes.homePageRoute);
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
                    text: "Back to Maps",
                    size: 15.sp,
                    color: Color(0xffF2F2F2),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


saveSnack(String message){
  return Get.snackbar("", "",
        titleText: Container(),
        messageText: Center(
            child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset("assets/svg/successful.svg"),
                    ),
                    width(15),
                    CustomBigText(
                      text: message,
                      color: Colors.white,
                    ),
                  ],
                ))),
        backgroundColor: Color(0xff6fcf97));
}