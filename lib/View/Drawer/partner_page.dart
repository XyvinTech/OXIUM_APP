import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/partner_page_controller.dart';
import 'package:freelancer_app/View/Widgets/countrypick.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/toastUtils.dart';
import '../Widgets/apptext.dart';
import '../Widgets/customText.dart';
import '../Widgets/phonenumtext_field.dart';

class PartnerScreen extends GetView<PartnerPageController> {
  const PartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xffF5F9FF),

            floating: true,
            pinned: true,
            //expandedHeight: size.height * 0.52,
            expandedHeight: 375.h,
            leading: Container(),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: _appBar(
                        title: "Partner with us",
                        ontap: () {
                          Get.back();
                        }),
                  ),
                  height(10.h),
                  Obx(
                    () => Container(
                      // height: size.height * 0.33,
                      height: 285.h,
                      width: double.maxFinite,

                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CarouselSlider(
                              // onPageChanged: (index, reason) => _currentIndex = index,

                              items: controller.carouselImage
                                  .map(
                                    (img) => Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 37.w),
                                      // height: size.height * 0.25,
                                      // height: 300.h,
                                      // width: size.width * 0.8,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(img),
                                            fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                            blurRadius: 34.r,
                                            color: Color(0xff000000)
                                                .withOpacity(0.06),
                                          ),
                                        ],
                                      ),
                                      child: Column(children: [
                                        Expanded(child: Container()),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CustomBigText(
                                                text: controller.carouselText[
                                                    controller.currentIndex
                                                        .toInt()],
                                                size: 13.sp,
                                                 color: Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                                align: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                      ]),
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                // height: size.height * 0.25,
                                height: 220.h,
                                initialPage: 0,
                                autoPlay: false,
                                reverse: false,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlayInterval: Duration(seconds: 2),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 2000),
                                onPageChanged: (index, reason) => controller
                                    .currentIndex.value = index.toDouble(),
                              ),
                            ),
                          ),
                          height(15.h),
                          // new DotsIndicator(
                          //   decorator: DotsDecorator(

                          //     color: Color(0xffDEEAFF), // Inactive color
                          //     activeColor: Color(0xff0047C3),
                          //   ),
                          //   dotsCount: controller.carouselText.length,
                          //   position: controller.currentIndex.value,
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.carouselText
                                .asMap()
                                .entries
                                .map((entry) {
                              return GestureDetector(
                                onTap: () {
                                  controller.carouselController!
                                      .animateToPage(entry.key);
                                },
                                child: Container(
                                  width: 8.w,
                                  height: 8.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 4.w),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (controller.currentIndex.value ==
                                              entry.key
                                          ? Color(0xff0047C3)
                                          : Color(0xffDEEAFF))),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height(10.h),
                ],
              ),
            ),
            bottom: PreferredSize(
                child: Container(
                  color: kwhite,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // height(30.h),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Container(
                          height: 5.h,
                          width: 113.w,
                          decoration: BoxDecoration(
                              color: Color(0xffE0E0E0),
                              borderRadius: BorderRadius.circular(10.r)),
                        ),
                      ),
                      height(10.h),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(25.h)),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 570.h,
              color: kwhite,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        height(10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: EditTextField(
                            size: size,
                            controller: controller.nameController,
                            hintText: 'Full Name',
                          ),
                        ),
                        height(15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: EditTextField(
                            size: size,
                            controller: controller.emailController,
                            hintText: 'Email',
                          ),
                        ),
                        height(15.h),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 40.w),
                        //   child: PhoneNumberTextField2(
                        //       hintText: "Phone Number",
                        //       controller1: controller.phnNumberController),
                        // ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 20.w,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 40.w),
                          height: 64.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffE0E0E0),
                              )),
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
                                          print(
                                              'Select country: ${country.displayName}');
                                          controller.country.value =
                                              country.phoneCode;
                                        },
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "+${controller.country.value}",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.expand_more,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  );
                                },
                                // icon: Container(
                                //     margin: EdgeInsets.only(right: 5),
                                //     height: size.height * 0.03,
                                //     width: size.width * 0.03,
                                //     child:
                                //         Image.asset("assets/images/chevron_left.png")),
                              ),
                              SizedBox(
                                width: size.width * 0.014,
                              ),
                              Container(
                                height: 50.h,
                                width: 1.w,
                                color: Color(0xffE0E0E0),
                              ),
                              SizedBox(
                                width: size.width * 0.035,
                              ),
                              Form(
                                child: Container(
                                  height: size.height * 0.065,
                                  width: size.width * 0.5,
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    onChanged: (String value) {
                                      controller.textfield.value = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    inputFormatters: [
                                      // LengthLimitingTextInputFormatter(10),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                      hintText: "Phone Number",
                                      hintStyle: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffBDBDBD),
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        height(15.h),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.h),
                            child: Obx(
                              () => Container(
                                width: 310.w + 0 * controller.reload.value,
                                height: 65.h,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.r),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE0E0E0),
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
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      child: Text(value),
                                      value: value,
                                    );
                                  }).toList(),
                                  icon: SvgPicture.asset(
                                      "assets/svg/arrow_downward_ios.svg"),
                                  onChanged: (String? value) {
                                    controller.onChangeStateGetCityList(value);
                                  },
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                            )),
                        height(15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Obx(
                            () => Container(
                              width: 310.w + 0 * controller.reload.value,
                              height: 65.h,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.r),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
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
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList(),
                                icon: SvgPicture.asset(
                                    "assets/svg/arrow_downward_ios.svg"),
                                onChanged: (String? val) {
                               controller.   onChangeCity(val);
                                },
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                        ),
                        height(25.h),
                      ],
                    ),
                  ),
                  Container(
                    height: 140.h,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 17)
                    ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        'By clicking the button below, you are confirming that you \nhave read and understood GOEC  ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      color: Color(0xffABABAB),
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: Color(0xff0092F4),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                    text: '.',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xffABABAB),
                                      fontWeight: FontWeight.w500,
                                    ))
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            height: 55.h,
                            width: 220.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2F80ED).withOpacity(1)),
                            child: CustomText(
                                text: 'Save',
                                color: Color(0xffFFFFFF),
                                size: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget _appBar({required String title, required void Function() ontap}) {
    return Row(
      children: [
        InkWell(
            onTap: ontap,
            child: Container(
                padding: EdgeInsets.all(5.w),
                child: SvgPicture.asset('assets/svg/arrow_back_ios.svg'))),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: CustomBigText(
              text: title,
              size: 16.sp,
              color: Color(0xff828282),
            ),
          ),
        ),
        width(24)
      ],
    );
  }

  Widget EditTextField({
    required TextEditingController controller,
    required String hintText,
    required Size size,
  }) {
    return Container(
      height: 65.h,
      width: double.maxFinite,
      child: TextField(
        controller: controller,
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
          contentPadding: EdgeInsets.only(left: 25.h, bottom: 34.h),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
        ),
      ),
    );
  }

  Widget _countryPickerField({
    required TextEditingController controller,
    required String hintText,
    required Size size,
    Widget? icon,
    void Function()? ontap,
  }) {
    return Container(
      height: 56.h,
      width: double.maxFinite,
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Color(0xff828282),
        ),
        decoration: InputDecoration(
          suffixIcon: InkWell(onTap: ontap ?? null, child: icon ?? null),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          // contentPadding: EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide(color: Color(0xff628EDB))),
        ),
      ),
    );
  }

  Widget Partner() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .062, vertical: size.height * .02),
            child: _appBar(
                title: "Partner with us",
                ontap: () {
                  Get.back();
                }),
          ),
          height(size.height * 0.04),
          Obx(
            () => Container(
              height: size.height * 0.33,
              width: size.width,
              color: Color(0xffF5F9FF),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(
                      // onPageChanged: (index, reason) => _currentIndex = index,

                      items: controller.carouselText
                          .map(
                            (text) => Container(
                              height: size.height * 0.25,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                    blurRadius: 34,
                                    color: Color(0xff000000).withOpacity(0.06),
                                  ),
                                ],
                              ),
                              child: Column(children: [
                                Expanded(child: Container()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      right: size.width * 0.01),
                                  child: CustomText(
                                      text: text,
                                      size: 13,
                                      color: Color(0xff828282)),
                                ),
                                SizedBox(
                                  height: size.height * .03,
                                ),
                              ]),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: size.height * 0.25,
                        initialPage: 0,
                        autoPlay: true,
                        reverse: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        onPageChanged: (index, reason) =>
                            controller.currentIndex.value = index.toDouble(),
                      ),
                    ),
                  ),
                  height(size.height * 0.02),
                  // new DotsIndicator(
                  //   decorator: DotsDecorator(

                  //     color: Color(0xffDEEAFF), // Inactive color
                  //     activeColor: Color(0xff0047C3),
                  //   ),
                  //   dotsCount: controller.carouselText.length,
                  //   position: controller.currentIndex.value,
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        controller.carouselText.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          controller.carouselController!
                              .animateToPage(entry.key);
                        },
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (controller.currentIndex.value == entry.key
                                  ? Color(0xff0047C3)
                                  : Color(0xffDEEAFF))),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          height(size.height * 0.02),
          Container(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: EditTextField(
              size: size,
              controller: controller.nameController,
              hintText: 'Full Name',
            ),
          ),
          height(size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: EditTextField(
              size: size,
              controller: controller.nameController,
              hintText: 'Email',
            ),
          ),
          height(size.height * .02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: PhoneNumberTextField2(
                hintText: "Phone Number",
                controller1: controller.phnNumberController),
          ),
          height(size.height * .02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: CountryPickerField(
              text: controller.countryName.value,
            ),
          ),
          height(size.height * .02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: CountryPickerField(
              text: controller.countryName.value,
            ),
          ),
          height(size.height * .02),
        ],
      ),
    );
  }

  Widget Partner2() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          backgroundColor: Color(0xffF5F9FF),
          floating: true,
          pinned: true,
          expandedHeight: 375.h,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: _appBar(
                      title: "Partner with us",
                      ontap: () {
                        Get.back();
                      }),
                ),
                height(10.h),
                Obx(
                  () => Container(
                    height: 285.h,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CarouselSlider(
                            items: controller.carouselText
                                .map(
                                  (text) => Container(
                                    width: 300.w,
                                    decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                          blurRadius: 34.r,
                                          color: Color(0xff000000)
                                              .withOpacity(0.06),
                                        ),
                                      ],
                                    ),
                                    child: Column(children: [
                                      Expanded(child: Container()),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: CustomSmallText(
                                              text: text,
                                              size: 13.sp,
                                              color: Color(0xff828282),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                    ]),
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                              // height: size.height * 0.25,
                              height: 220.h,
                              initialPage: 0,
                              autoPlay: true,
                              reverse: false,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlayInterval: Duration(seconds: 2),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 2000),
                              onPageChanged: (index, reason) => controller
                                  .currentIndex.value = index.toDouble(),
                            ),
                          ),
                        ),
                        height(15.h),
                        // new DotsIndicator(
                        //   decorator: DotsDecorator(

                        //     color: Color(0xffDEEAFF), // Inactive color
                        //     activeColor: Color(0xff0047C3),
                        //   ),
                        //   dotsCount: controller.carouselText.length,
                        //   position: controller.currentIndex.value,
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.carouselText
                              .asMap()
                              .entries
                              .map((entry) {
                            return GestureDetector(
                              onTap: () {
                                controller.carouselController!
                                    .animateToPage(entry.key);
                              },
                              child: Container(
                                width: 8.w,
                                height: 8.h,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 4.w),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (controller.currentIndex.value ==
                                            entry.key
                                        ? Color(0xff0047C3)
                                        : Color(0xffDEEAFF))),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                height(10.h),
              ],
            ),
          ),
          bottom: PreferredSize(
              child: Container(
                color: kwhite,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // height(30.h),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Container(
                        height: 5.h,
                        width: 113.w,
                        decoration: BoxDecoration(
                            color: Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                    height(10.h),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(25.h)),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 420.h,
            color: kwhite,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      height(10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: EditTextField(
                          size: size,
                          controller: controller.nameController,
                          hintText: 'Full Name',
                        ),
                      ),
                      height(15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: EditTextField(
                          size: size,
                          controller: controller.nameController,
                          hintText: 'Email',
                        ),
                      ),
                      height(15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: PhoneNumberTextField2(
                            hintText: "Phone Number",
                            controller1: controller.phnNumberController),
                      ),
                      height(15.h),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.h),
                          child: Obx(
                            () => CountryPickerField(
                              text: controller.countryName.value,
                              onTap: () {
                                // showCountryPicker(
                                //   context: context,
                                //   onSelect: (Country country) {
                                //     print(
                                //         'Select country: ${country.displayName}');
                                //     controller.countryName.value = country.name;
                                //   },
                                // );
                              },
                            ),
                          )),
                      height(15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Obx(
                          () => CountryPickerField(
                            text: controller.countryName.value,
                            onTap: () {
                              // showCountryPicker(
                              //   context: context,
                              //   onSelect: (Country country) {
                              //     print(
                              //         'Select country: ${country.displayName}');
                              //     controller.countryName.value = country.name;
                              //   },
                              // );
                            },
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
        )
      ],
    );
  }
}
