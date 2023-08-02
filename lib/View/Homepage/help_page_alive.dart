import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/homepage_controller.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/apptext.dart';
import '../Widgets/customText.dart';

class HelpPageAlive extends StatefulWidget {
  const HelpPageAlive({super.key});

  @override
  State<HelpPageAlive> createState() => _HelpPageAliveState();
}

class _HelpPageAliveState extends State<HelpPageAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  HomePageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
                width(24.w)
              ],
            ),
          ),
          height(size.height * 0.04),
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
                              padding: EdgeInsets.symmetric(horizontal: 37.w),
                              // height: size.height * 0.25,
                              // height: 300.h,
                              // width: size.width * 0.8,
                              width: 300.w,
                              decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(img), fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                    blurRadius: 34.r,
                                    color: Color(0xff000000).withOpacity(0.06),
                                  ),
                                ],
                              ),
                              child: Column(children: [
                                Expanded(child: Container()),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CustomBigText(
                                        text: controller.carouselText[
                                            controller.currentIndex.toInt()],
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
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        onPageChanged: (index, reason) =>
                            controller.currentIndex.value = index.toDouble(),
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
                    children:
                        controller.carouselText.asMap().entries.map((entry) {
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
            child:
                _contractCard("Talk to Customer care", Icons.call, "null", () {
              controller.openPhoneCall("+8801738347723");
            }),
          ),
          height(size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .062),
            child: _contractCard(
                "Chat on Whatsapp", null, "assets/images/whatsapp.png", () {
              // if (Platform.isAndroid) {
              //   controller.openWhatsApp();
              //   log("android whatsapp working");
              // } else if (Platform.isIOS) {
              //   controller.openWhatsApp();
              // }
              controller.openWhatsApp();
            }),
          ),
          height(size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .062),
            child: _contractCard(
                "Report an Issue", null, "assets/images/report_issue.png", () {
              // if (Platform.isAndroid) {
              //   controller.openMail("mahmudulhasan5008@gmail.com");
              // } else if (Platform.isIOS) {
              //   controller.openMail("mahmudulhasan5008@gmail.com");
              // }
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

  Widget _contractCard(
      String title, IconData? icon, String? image, void Function()? ontap) {
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
                  icon != null
                      ? Icon(
                          icon,
                          size: 17,
                          color: Color(0xff4F4F4F),
                        )
                      : Center(
                          child:
                              Container(height: 22, child: Image.asset(image!)),
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
