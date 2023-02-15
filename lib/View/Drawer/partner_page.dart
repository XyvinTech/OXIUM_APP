import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          backgroundColor: Color(0xffF5F9FF),
          floating: true,
          pinned: true,
          expandedHeight: size.height * 0.52,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .062,
                      vertical: size.height * .02),
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
                                          color: Color(0xff000000)
                                              .withOpacity(0.06),
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
              ],
            ),
          ),
          bottom: PreferredSize(
              child: Container(
                color: kwhite,
                width: size.width,
                child: Column(
                  children: [
                    height(size.height * 0.04),
                    Container(
                      height: size.height * 0.008,
                      width: size.width * 0.34,
                      decoration: BoxDecoration(
                          color: Color(0xffE0E0E0),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(size.height * 0.08)),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: kwhite,
            child: Expanded(
                child: Column(
              children: [
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
                    child: Obx(
                      () => CountryPickerField(
                        text: controller.countryName.value,
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              print('Select country: ${country.displayName}');
                              controller.countryName.value = country.name;
                            },
                          );
                        },
                      ),
                    )),
                height(size.height * .02),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                    child: Obx(
                      () => CountryPickerField(
                        text: controller.countryName.value,
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              print('Select country: ${country.displayName}');
                              controller.countryName.value = country.name;
                            },
                          );
                        },
                      ),
                    )),
                height(size.height * .05),
              ],
            )),
          ),
        )
      ],
    )));
  }

  Widget _appBar({required String title, required void Function() ontap}) {
    return Row(
      children: [
        InkWell(
            onTap: ontap,
            child: Container(
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset('assets/svg/arrow_back_ios.svg'))),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: CustomBigText(
              text: title,
              size: 16,
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
      height: size.height * .085,
      width: size.width,
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
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
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
      height: size.height * .085,
      width: size.width,
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
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
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
}
