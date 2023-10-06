//Add Invoice Details Page
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/addInvoice_page_controller.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/apptext.dart';
import '../Widgets/customText.dart';
import '../Widgets/phonenumtext_field.dart';
import 'editprofile_screen.dart';

class AddInvoiceDetails extends GetView<AddInvoiceDetailsController> {
  const AddInvoiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kscaffoldBackgroundColor2,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Obx(() => Container(
                padding: EdgeInsets.all(0.0 + 0 * controller.reload.value))),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .062, vertical: size.height * .03),
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
                    width(14.w),
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: CustomText(
                                text: 'Invoice Details',
                                size: 15,
                                color: Color(0xff828282),
                                fontWeight: FontWeight.bold))),
                    TextButton(
                        onPressed: () {
                          controller.onClear();
                        },
                        child: CustomBigText(
                          text: "Clear",
                          size: 15,
                          color: kOnboardingColors,
                        )),
                    //width(24)
                  ],
                )),

            height(size.height * 0.02),
            EditTextField(
              size: size,
              controller: controller.companyNameController,
              hintText: 'Company Name',
            ),
            //height(size.height * 0.01),
            PhoneNumberTextFieldSlim(
                hintText: "Phone Number",
                controller1: controller.phnNumberController),
            //height(size.height * 0.002),

            // EditTextField(
            //   size: size,
            //   controller: controller.cityNameController,
            //   hintText: 'City',
            // ),
            //height(size.height * 0.01),
            EditTextField(
              size: size,
              controller: controller.postalCodeController,
              hintText: 'Postal Code',
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .08,
                    vertical: size.height * 0.008),
                child: Obx(
                  () => Container(
                    width: size.width + 0 * controller.reload.value,
                    height: size.height * 0.073,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 158, 158, 158),
                        )),
                    child: DropdownButton<String>(
                      value: controller.selectedState,
                      hint: Text(
                        'State',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 155, 154, 154),
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4F4F4F),
                      ),
                      dropdownColor: kwhite,
                      isExpanded: true,
                      elevation: 0,
                      underline: SizedBox(),
                      items: controller.states
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      icon:
                          SvgPicture.asset("assets/svg/arrow_downward_ios.svg"),
                      onChanged: (String? value) {
                        controller.onChangeStateGetCityList(value);
                      },
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                )),

            //height(size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .08, vertical: size.height * 0.008),
              child: Obx(
                () => Container(
                  width: size.height + 0 * controller.reload.value,
                  height: size.height * 0.073,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 158, 158, 158),
                      )),
                  child: DropdownButton<String>(
                    value: controller.selectedCity,
                    hint: Text(
                      'City',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 155, 154, 154),
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4F4F4F),
                    ),
                    dropdownColor: kwhite,
                    isExpanded: true,
                    elevation: 0,
                    underline: SizedBox(),
                    items: controller.stateCitys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    icon: SvgPicture.asset("assets/svg/arrow_downward_ios.svg"),
                    onChanged: (String? val) {
                      controller.onChangeCity(val);
                    },
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ),

            // EditTextField(
            //   size: size,
            //   controller: controller.stateNameController,
            //   hintText: 'State',
            // ),
            //height(size.height * 0.01),
            EditTextField(
              size: size,
              controller: controller.countryNameController,
              hintText: 'Country',
            ),
            //height(size.height * 0.01),
            EditTextField(
              size: size,
              controller: controller.gstNoController,
              hintText: 'GST No',
            ),

            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
              child: SaveButton(onTaop: () {
                controller.onSave();
              }),
            )),
          ]),
        ),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [height(size.height * 0.01)],
        // ),
        // resizeToAvoidBottomInset: true,
      ),
    );
  }
}
