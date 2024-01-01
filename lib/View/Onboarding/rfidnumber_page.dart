import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/rfid_page_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';

class RFIDnumberScreen extends GetView<RfidPageController> {
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
                                      color:
                                          Color(0xff000000).withOpacity(0.06),
                                    ),
                                  ],
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(child: Container()),
                                      SizedBox(
                                        width: 220.w,
                                        child: CustomBigText(
                                          text: controller.carouselText[
                                              controller.currentIndex.toInt()],
                                          size: 13.sp,
                                          color: Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                          align: TextAlign.center,
                                        ),
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
                          onPageChanged: (index, reason) =>
                              controller.currentIndex.value = index.toDouble(),
                        ),
                      ),
                    ),
                    height(20.h),
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
            height(size.height * 0.02),
            SizedBox(
              height: size.height * 0.06,
            ),
            CustomSmallText(text: "RFID Numbers"),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .15),
              child: Obx(
                () => controller.rfid_list.length == 0
                    ? Container(
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
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.rfid_list.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            height: size.height * 0.055,
                            width: size.width * 0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff0047C3).withOpacity(.25),
                                )),
                            child: Center(
                              child: CustomText(
                                color: Color(0xff4f4f4f),
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600,
                                text: controller.rfid_list[index],
                                size: 16,
                              ),
                            ),
                          );
                        })),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Spacer(),
            InkWell(
              onTap: () {
                controller.orderRFID();
              },
              child: Container(
                height: 56.h,
                width: 218.w,
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
                      size: 16.sp,
                      color: kwhite,
                    ),
                    SizedBox(
                      width: size.width * 0.06,
                    ),
                  ],
                ),
              ),
            ),
            height(size.height * .05)
          ],
        ),
      ),
    );
  }
}
