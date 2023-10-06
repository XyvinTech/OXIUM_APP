import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';
import '../Widgets/customText.dart';
import '../Widgets/textfield.dart';

class PopUpPage extends GetView<WalletPageController> {
  const PopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .062, vertical: size.height * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              height(size.height * 0.02),
              Row(
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
                          child: CustomBigText(
                              text: 'Add Coins',
                              size: 18,
                              color: Color(0xff4F4F4F),
                              fontWeight: FontWeight.bold))),
                  width(size.width * 0.06)
                ],
              ),
              height(size.height * 0.04),
              // InkWell(
              //   onTap: () {
              //     Get.to(() => PopUp());
              //   },
              //   child: _topupCard(
              //     title: "Mini top-up",
              //     color: Color(0xff2F80ED),
              //   ),
              // ),
              // height(size.height * 0.02),
              // InkWell(
              //   onTap: () {
              //     Get.to(NormalTopUp());
              //   },
              //   child: _topupCard(
              //     title: "Normal top-up",
              //     color: Color(0xffF2994A),
              //   ),
              // ),
              // height(size.height * 0.02),
              // InkWell(
              //   onTap: () {
              //     Get.to(GoldenTopUP());
              //   },
              //   child: _topupCard(
              //     title: "Golden top-up",
              //     color: Color(0xff2F80ED),
              //     gradient: LinearGradient(
              //       colors: [
              //         Color(0xffFAEDB6),
              //         Color(0xffD2B269),
              //         Color(0xffF0E6A8),
              //         Color(0xffCEAE65),
              //         Color(0xffEEBC3D),
              //       ],
              //     ),
              //     textColor: Color(0xff4F4F4F),
              //   ),
              // ),
              // height(size.height * 0.02),
              // InkWell(
              //   onTap: () {
              //     Get.to(PlatinumTopUp());
              //   },
              //   child: _topupCard(
              //     title: "Platinum top-up",
              //     color: Color(0xff2F80ED),
              //     gradient: LinearGradient(
              //       colors: [
              //         Color(0xff3E3E3E),
              //         Color(0xff969696),
              //         Color(0xff666666),
              //         Color(0xff929292),
              //       ],
              //     ),
              //     textColor: Color(0xffF2F2F2),
              //   ),
              // ),

              CustomText(
                text: 'Balance Coins',
                fontWeight: FontWeight.w400,
                size: 13.5,
                color: Color(0xffB7B7B7),
              ),
              Obx(
                () => CustomText(
                  text:
                      "${appData.userModel.value.balanceAmount.toStringAsFixed(2)}",
                  fontWeight: FontWeight.bold,
                  size: 24,
                  color: Color(0xff0047C2),
                ),
              ),
              height(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: '₹ 1 = 1 Coins',
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4F4F4F),
                      size: 16),
                  Column(
                    children: [
                      CustomText(
                        text: 'Wallet Minimum',
                        fontWeight: FontWeight.w400,
                        size: 13.5,
                        color: Color(0xffB7B7B7),
                      ),
                      CustomText(
                          text: '200 Coins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4F4F4F),
                          size: 16),
                    ],
                  ),
                ],
              ),
              height(50.h),
              CustomText(
                text: 'Enter the amount you wish to top-up',
                fontWeight: FontWeight.w400,
                size: 14.5,
                color: Color(0xff828282),
              ),
              height(20.h),
              AppTextField(
                color: controller.amountController == true
                    ? Color(0xff0047C3)
                    : Color(0xffE0E0E0),
                onTap: () {
                  // controller.mailTextFieldColorChange();
                },
                hintText: "Enter amount",
                icon: Icon(
                  Icons.currency_rupee,
                  size: 20,
                ),
                // icon: Image.asset("assets/images/sms.png"),
                keyboardtype: TextInputType.number,
                Controller: controller.amountController,
                onChanged: (String val) {
                  appData.rechargeAmount = val;
                },
              ),
              height(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.amountController.text = '100';
                      appData.rechargeAmount = '100';
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffDEEAFF)),
                      child: CustomText(
                          text: '100 Coins',
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff909090)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.amountController.text = '200';
                      appData.rechargeAmount = '200';
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffDEEAFF)),
                      child: CustomText(
                          text: '200 Coins',
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff909090)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.amountController.text = '500';
                      appData.rechargeAmount = '500';
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffDEEAFF)),
                      child: CustomText(
                          text: '500 Coins',
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff909090)),
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  controller.orderTopUp();
                  // Dialogs().tariffPopUp(kBookingModel);
                },
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    decoration: BoxDecoration(
                        color: Color(0xff0047C3),
                        borderRadius: BorderRadius.circular(56.r)),
                    child: Center(
                      child: CustomBigText(
                        text: "Add Money",
                        size: 16.sp,
                        color: Color(0xffF2F2F2),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  _topupCard(
      {required String title,
      required Color color,
      Gradient? gradient,
      Color? textColor}) {
    return Container(
      height: size.height * 0.15,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.5,
          color: Color(0xffE0E0E0),
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * 0.04,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: color,
            ),
            child: CustomBigText(
              text: title,
              size: 12,
              letterspacing: -0.0408,
              color: textColor ?? Color(0xffF2F2F2),
            ),
          ),
          height(size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBigText(
                      text: "100 Coins",
                      color: Color(0xff0047C3),
                      letterspacing: -0.408,
                    ),
                    height(size.height * 0.002),
                    CustomSmallText(
                      text: "Added Expiry : 30 days",
                      size: 13,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.023),
                  child: Row(
                    children: [
                      Text(
                        "₹",
                        style: TextStyle(
                            fontFamily: "Arial",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0047C3)),
                      ),
                      width(4.w),
                      CustomSmallText(
                        text: "2000",
                        size: 20,
                        color: Color(0xff0047C3),
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
