import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Model/bookingModel.dart';
import '../../Singletones/common_functions.dart';

Widget ChargeTransactionDialog({required final BookingModel model}) {
  final a = 5;
  final b = 4;
  int hour = 0, minute = 0;
  List<int> time =
      getTimeDifference(startTime: model.start_time, endtime: model.stop_time);
  if (model.stop_time.isEmpty) {
    hour = 0;
    minute = 0;
  } else {
    hour = time[0];
    minute = time[1];
  }
  return Container(
    height: model.status == 'C' ? 650.h : 600.h,
    width: size.width,
    child: Column(
      children: [
        _reservationAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              _detailsSection(),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  Expanded(
                      flex: a,
                      child: _text_title_value(
                          'Date',
                          getTimeFromTimeStamp(
                              model.book_time, 'dd MMM yyyy'))),
                  Expanded(
                      flex: b,
                      child: _text_title_value(
                          'Charge Point ID', model.chargerName)),
                ],
              ),
              height(30.h),
              Row(
                children: [
                  Expanded(
                      flex: a,
                      child: _text_title_value(
                          'Tarrif', '₹ ${model.tariff} /kWh')),
                  Expanded(
                      flex: b,
                      child: _text_title_value(
                          'Charging Duration', '$hour hrs $minute min')),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(),
              ),
              Row(
                children: [
                  Expanded(
                      flex: a,
                      child: _text_title_value('Charging fee',
                          '₹ ${model.damount.toStringAsFixed(2)}')),
                  Expanded(
                      flex: b,
                      child: _text_title_value('Tax(${model.taxes}%)',
                          '₹ ${model.tdamount.toStringAsFixed(2)}')),
                ],
              ),
              height(50.h),
              _card(
                  energy: '${model.damount.toStringAsFixed(2)}',
                  amount:
                      '${(model.damount + model.tdamount).toStringAsFixed(2)}'),
              Visibility(visible: model.status == 'C', child: height(30.h)),
              Visibility(
                visible: model.status == 'C',
                child: InkWell(
                  onTap: () {
                    //TODO: on download invoice
                    CommonFunctions().downloadBookingInvoice(model.bookingId);
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
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _card({required String energy, required String amount}) {
  return Container(
    height: 85.h,
    width: double.maxFinite,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
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
        ],
      ),
    ),
  );
}

Widget _reservationAppBar() {
  return Container(
    height: size.height * 0.08,
    decoration: BoxDecoration(
      color: Color(0xffDEEAFF),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: size.width * 0.04),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Icon(
                Icons.arrow_back_ios,
                size: size.width * 0.05,
                color: Color(0xff828282),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.01,
          ),
          CustomBigText(
            text: "Charging Summery",
            size: 14,
          )
        ],
      ),
    ),
  );
}

Widget _detailsSection() {
  return Container(
    child: Row(
      children: [
        Image.asset(
          "assets/images/coffee.png",
          height: size.height * 0.085,
          width: size.width * 0.19,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: CustomBigText(
                      text: "Calista Cafe",
                      size: 16,
                      color: Color(0xff4F4F4F),
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomSmallText(
                      text: "Mannampatta . Near Govt ",
                      size: 12,
                      color: Color(0xff4F4F4F),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _text_title_value(
  String title,
  String value,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomSmallText(
        text: title,
        size: 14.sp,
        color: Color(0xffacacac),
      ),
      height(5.h),
      CustomBigText(
        text: value,
        size: 17,
        color: Color(0xff5C5C5C),
        fontWeight: FontWeight.w600,
      )
    ],
  );
}
