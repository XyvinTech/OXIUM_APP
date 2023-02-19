import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/partner_page_controller.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import 'apptext.dart';

class CountryPickerField extends GetView<PartnerPageController> {
  final String text;
  final void Function()? onTap;
  CountryPickerField({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: kwhite,
            border: Border.all(width: 1.5.r, color: Color(0xffCCCCCC))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomBigText(
                  text: text,
                  fontWeight: FontWeight.w500,
                  size: 14.sp,
                ),
              ),
              SvgPicture.asset("assets/svg/down_arrow.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
