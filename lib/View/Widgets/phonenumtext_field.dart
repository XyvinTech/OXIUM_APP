import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/editprofile_screen_controller.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/partner_page_controller.dart';

class PhoneNumberTextField extends GetView<EditProfileScreenController> {
  final String hintText;

  final TextEditingController controller1;
  const PhoneNumberTextField(
      {super.key, required this.hintText, required this.controller1});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .085,
      width: size.width,
      child: Container(
        width: size.width * 0.6,
        height: size.height * .085,
        child: TextField(
          controller: controller1,
          style: TextStyle(
            color: Color(0xff828282),
          ),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              // contentPadding: EdgeInsets.only(left: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Color(0xffE0E0E5))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Color(0xffE0E0E5))),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                  color: Color(0xff628EDB),
                ),
              ),
              prefixIcon: Container(
                padding: EdgeInsets.only(left: size.width * 0.04),
                width: size.width * 0.23,
                child: Row(
                  children: [
                    Obx(
                      () {
                        return InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              favorite: ['IN', 'BD'],
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                print('Select country: ${country.displayName}');
                                controller.country.value = country.phoneCode;
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                // width: size.width * 0.09,
                                child: Text(
                                  "+${controller.country.value}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff4F4F4F),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.expand_more,
                                size: 20,
                                color: Color(0xff4F4F4F),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.014,
                    ),
                    Container(
                      height: size.height * 0.06,
                      width: size.width * 0.005,
                      color: Color(0xffE0E0E0),
                    ),
                    width(size.width * 0.02),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class PhoneNumberTextField2 extends GetView<PartnerPageController> {
  final String hintText;

  final TextEditingController controller1;
  const PhoneNumberTextField2(
      {super.key, required this.hintText, required this.controller1});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: 65.h,
      width: size.width,
      child: TextField(
        controller: controller1,
        style: TextStyle(
          color: Color(0xff828282),
        ),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255, 155, 154, 154),
            ),
            isDense: true,
            contentPadding: EdgeInsets.only(left: 0.w, bottom: 34),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: BorderSide(color: Color(0xffE0E0E5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: BorderSide(color: Color(0xffE0E0E5))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide(
                color: Color(0xff628EDB),
              ),
            ),
            // prefixIconConstraints: BoxConstraints.expand(),

            prefixIcon: Container(
              padding: EdgeInsets.only(left: 20.w),
              width: 66.w,
              child: Row(
                children: [
                  Obx(
                    () {
                      return InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            favorite: ['IN', 'BD'],
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              print('Select country: ${country.displayName}');
                              controller.country.value = country.phoneCode;
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              // width: size.width * 0.09,
                              child: Text(
                                "+${controller.country.value}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Color(0xff4F4F4F),
                                ),
                              ),
                            ),
                            width(5.w),
                            Icon(
                              Icons.unfold_more,
                              size: 20.w,
                              color: Color(0xff4F4F4F),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  width(5.w),
                ],
              ),
            )),
      ),
    );
  }
}
