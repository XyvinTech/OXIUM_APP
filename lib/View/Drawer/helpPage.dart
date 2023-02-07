import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/help_page_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/toastUtils.dart';
import '../Widgets/customText.dart';

class HelpScreen extends GetView<HelpPageController> {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (size.height == 0) size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .062, vertical: size.height * .02),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child:
                            SvgPicture.asset('assets/svg/arrow_back_ios.svg'))),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: CustomBigText(
                        text: 'Help',
                        size: 16,
                        color: Color(0xff828282),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                width(24)
              ],
            ),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .062),
            child: _contractCard("Talk to Customer care", () {
              controller.openPhoneCall("+8801738347723");
            }),
          ),
          height(size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .062),
            child: _contractCard("Chat on Whatsapp", () {
              controller.openWhatsApp();
              log("whatsapp working");
            }),
          ),
          height(size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .062),
            child: _contractCard("Report an Issue", () {
              controller.openMail("mahmudulhasan5008@gmail.com");
            }),
          ),
          height(size.height * 0.025),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.2,
                right: size.width * 0.13,
                bottom: size.height * 0.05),
            child: CustomText(
              color: Color(0xff4f4f4f),
              size: 12,
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
            ),
          ),
        ],
      ),
    ));
  }

  Widget _contractCard(String title, void Function()? ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: size.height * 0.075,
        decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                color: Color(0xff000000).withOpacity(0.12),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.call,
                    size: 17,
                    color: Color(0xff4F4F4F),
                  ),
                  width(size.width * 0.05),
                  CustomBigText(
                    text: title,
                    size: 14,
                    color: Color(0xff4F4F4F),
                    letterspacing: -0.408,
                  )
                ],
              ),
              SvgPicture.asset("assets/svg/arrow_forward_ios.svg")
            ],
          ),
        ),
      ),
    );
  }
}
