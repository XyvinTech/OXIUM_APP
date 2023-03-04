import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/smartcharge_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';
import '../Widgets/customText.dart';

class RFIDnumberScreen extends GetView<SmartChargeController> {
  const RFIDnumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
                          child: SvgPicture.asset(
                              'assets/svg/arrow_back_ios.svg'))),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: CustomBigText(
                          text: 'RFID',
                          size: 16,
                          color: Color(0xff828282),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  width(24)
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
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
                                      color:
                                          Color(0xff000000).withOpacity(0.06),
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
                                color:
                                    (controller.currentIndex.value == entry.key
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
            SizedBox(
              height: size.height * 0.1,
            ),
            CustomSmallText(text: "RFID Number"),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              height: size.height * 0.055,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: Color(0xff0047C3).withOpacity(.25),
                  )),
              child: Center(
                child: CustomSmallText(
                  color: Color(0xffEB5757),
                  text: "No RFID Found",
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Container(
              height: size.height * 0.075,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(73),
                  color: Color(0xff0047C3),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 6),
                      blurRadius: 26,
                      spreadRadius: 0,
                      color: Color(0xff000000).withOpacity(.25),
                    ),
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.09,
                  ),
                  Icon(
                    Icons.add,
                    size: size.width * 0.06,
                    color: Color(0xffD9D9D9),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  CustomBigText(
                    text: "Order RFID",
                    size: 16,
                    color: kwhite,
                  ),
                  SizedBox(
                    width: size.width * 0.06,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
