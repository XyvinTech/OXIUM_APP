import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/partner_page_controller.dart';
import 'package:freelancer_app/View/Widgets/countrypick.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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

                          items: controller.carouselImage
                              .map(
                                (image) => Container(
                                  height: size.height * 0.25,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(image),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                        blurRadius: 34,
                                        color:
                                            Color(0xff000000).withOpacity(0.06),
                                      ),
                                    ],
                                  ),
                                  child: Column(children: [
                                    Expanded(child: Container()),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 44.w),
                                        child: CustomBigText(
                                          text: controller.carouselText[
                                              controller.currentIndex.toInt()],
                                          size: 12.sp,
                                          color: Color(0xffF9F9F9),
                                          align: TextAlign.center,
                                        )),
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
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
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
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: size.width * .1),
              //   child: _countryPickerField(
              //     // icon: SvgPicture.asset("assets/svg/sms.svg"),
              //     size: size,
              //     controller: controller.nameController,
              //     hintText: 'Country',
              //     icon: SvgPicture.asset("assets/svg/down_arrow.svg"),
              //   ),
              // ),
              // height(size.height * .02),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: size.width * .1),
              //   child: _countryPickerField(
              //       // icon: SvgPicture.asset("assets/svg/sms.svg"),
              //       size: size,
              //       controller: controller.nameController,
              //       hintText: '+${controller.countryName.value}',
              //       icon: SvgPicture.asset(
              //         "assets/svg/route.svg",
              //         height: 10,
              //         width: 10,
              //       ),
              //       ontap: () {
              //         showCountryPicker(
              //           context: context,
              //           favorite: ['IN', 'BD'],
              //           showPhoneCode: true,
              //           onSelect: (Country country) {
              //             print('Select country: ${country.displayName}');
              //             controller.countryName.value = country.displayName;
              //           },
              //         );
              //       }),
              // ),
              height(size.height * .04),
              Container(
                padding: EdgeInsets.only(
                    left: 25.w, right: 25.w, top: 15.h, bottom: 25.h),
                width: size.width,
                decoration: BoxDecoration(color: kwhite, boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -4),
                    blurRadius: 29,
                    spreadRadius: 0,
                    color: Color(0xff000000).withOpacity(.10),
                  )
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSmallText(
                      text:
                          "By clicking the button below, you are confirming that you",
                      size: 12.sp,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSmallText(
                          text: "have read and understood GOEC ",
                          size: 12.sp,
                          textAlign: TextAlign.center,
                        ),
                        CustomSmallText(
                          ontap: () {},
                          text: " Privacy Policy.",
                          size: 12.sp,
                          textAlign: TextAlign.center,
                          color: Color(0xff0092F4),
                          decoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                    height(15.h),
                    // button
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Container(
                          height: 56.h,
                          width: 240.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Color(0xff007AFF),
                          ),
                          child: Center(
                            child: CustomBigText(
                              text: "Submit",
                              size: 16.sp,
                              color: kwhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: size.width * .1),
          //   child: _countryPickerField(
          //     // icon: SvgPicture.asset("assets/svg/sms.svg"),
          //     size: size,
          //     controller: controller.nameController,
          //     hintText: 'Country',
          //     icon: SvgPicture.asset("assets/svg/down_arrow.svg"),
          //   ),
          // ),
          // height(size.height * .02),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: size.width * .1),
          //   child: _countryPickerField(
          //       // icon: SvgPicture.asset("assets/svg/sms.svg"),
          //       size: size,
          //       controller: controller.nameController,
          //       hintText: '+${controller.countryName.value}',
          //       icon: SvgPicture.asset(
          //         "assets/svg/route.svg",
          //         height: 10,
          //         width: 10,
          //       ),
          //       ontap: () {
          //         showCountryPicker(
          //           context: context,
          //           favorite: ['IN', 'BD'],
          //           showPhoneCode: true,
          //           onSelect: (Country country) {
          //             print('Select country: ${country.displayName}');
          //             controller.countryName.value = country.displayName;
          //           },
          //         );
          //       }),
          // ),
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
          //expandedHeight: size.height * 0.52,
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
                    // height: size.height * 0.33,
                    height: 285.h,
                    width: double.maxFinite,

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CarouselSlider(
                            // onPageChanged: (index, reason) => _currentIndex = index,

                            items: controller.carouselText
                                .map(
                                  (text) => Container(
                                    // height: size.height * 0.25,
                                    // height: 300.h,
                                    // width: size.width * 0.8,
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
