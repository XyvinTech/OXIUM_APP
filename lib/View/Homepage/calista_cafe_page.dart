import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/calista_cafePage_controller.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/toastUtils.dart';
import '../Widgets/customText.dart';

class CalistaCafeScreen extends GetView<CalistaCafePageController> {
  const CalistaCafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: Color(0xff0047C3),
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: size.height * .32,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(children: [
                    height(size.height * .01),
                    // Container(
                    //   height: size.height * .006,
                    //   width: size.width * .25,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Color(0xffD9D9D9)),
                    // ),
                    height(size.height * .015),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .06),
                      child: Row(
                        children: [
                          //TODO: Replace the CachedNetworkImage with Image.asset() below
                          // CachedNetworkImage(imageUrl: imageUrl)
                          Expanded(
                              flex: 3,
                              child: Image.asset('assets/svg/cafe_image.png')),

                          width(size.width * .035),
                          Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * .023,
                                  width: size.width * .12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffFFE1C7)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffF2994A),
                                          size: 15,
                                        ),
                                        CustomText(
                                            text: '5.6',
                                            size: 12,
                                            color: Color(0xffF2994A)),
                                      ]),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText(
                                        text: 'Calista Cafe',
                                        color: Color(0xff4F4F4F),
                                        fontWeight: FontWeight.bold),
                                    width(size.width * .017),
                                    CustomText(
                                        text: '13 km Away',
                                        color: Color(0xff828282),
                                        fontWeight: FontWeight.normal,
                                        size: 12),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/svg/wc.svg'),
                                        width(size.width * .01),
                                        CustomText(
                                            text: 'Rest Room',
                                            color: Color(0xff828282),
                                            fontWeight: FontWeight.normal,
                                            size: 12),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/hotel.svg'),
                                        width(size.width * .01),
                                        CustomText(
                                            text: 'Hotel',
                                            color: Color(0xff828282),
                                            fontWeight: FontWeight.normal,
                                            size: 12),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/local_cafe.svg'),
                                        width(size.width * .01),
                                        CustomText(
                                            text: 'Cafe',
                                            color: Color(0xff828282),
                                            fontWeight: FontWeight.normal,
                                            size: 12),
                                      ],
                                    ),
                                  ],
                                ),
                                height(size.height * .01),
                                CustomText(
                                    text:
                                        'Mannampatta . Near Govt. College , Kearal ',
                                    size: 12,
                                    color: Color(0xff4F4F4F))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    height(size.height * .05),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * .04,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .035),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff219653)),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/tick.svg'),
                                width(size.width * .01),
                                CustomText(
                                    text: 'Charges Available',
                                    size: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffF2F2F2)),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(size.width * .02),
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * .01),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Color(0xffBDBDBD))),
                                child: SvgPicture.asset('assets/svg/share.svg'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * .01),
                                padding: EdgeInsets.all(size.width * .02),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Color(0xffBDBDBD))),
                                child:
                                    SvgPicture.asset('assets/svg/telegram.svg'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * .01),
                                padding: EdgeInsets.all(size.width * .02),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Color(0xffBDBDBD))),
                                child:
                                    SvgPicture.asset('assets/svg/favorite.svg'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
                height(size.height * 0.04),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * .04,
                            vertical: size.height * .01),
                        child: ExpandablePanel(
                            collapsed: ExpandableButton(
                                child: _chargerCard(
                                    title: 'Charge 1 ',
                                    subTitle: 'DC 45 kWh',
                                    trailing: 'Available 2/3',
                                    index: index)),
                            expanded: _chargerCardExpanded(
                                title: 'Charge 1',
                                subTitle: 'DC 45 kWh',
                                trailing: 'Available 2/3',
                                index: index)),
                      );
                    }),
                height(size.height * .2),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: size.height * 0.02),
              height: size.height * 0.15,
              width: size.width,
              color: kwhite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    navigationCard(),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Color(0xff0047C3),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: CustomBigText(
                              text: "Start Charging",
                              size: 15,
                              color: Color(0xffF2F2F2),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  width: 2, color: Color(0xff0047C3))),
                          child: Center(
                            child: CustomBigText(
                              text: "Reserve",
                              size: 15,
                              color: Color(0xff0047C3),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget type2(
      {
      // required Color containerColor,
      // required Color color,
      // required Color borderColor,
      required bool isSelected,
      required String title,
      required}) {
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected
              ? Color(0xff6FCF97).withOpacity(.28)
              : Colors.transparent,
          border: Border.all(
            width: 1.3,
            color: isSelected
                ? Color(0xff6FCF97).withOpacity(.28)
                : Color(0xff0047C3).withOpacity(.6),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Row(
          children: [
            Container(
              height: size.height * 0.016,
              width: size.width * 0.016,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff219653)),
            ),
            width(size.width * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.008),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/type 2 icon1.svg",
                    color: isSelected ? Color(0xff4f4f4f) : Color(0xff0047C3),
                  ),
                  height(size.height * 0.005),
                  SvgPicture.asset(
                    "assets/svg/type 2 icon2.svg",
                    color: isSelected ? Color(0xff333333) : Color(0xff0047C3),
                  ),
                ],
              ),
            ),
            width(size.width * 0.07),
            CustomBigText(
              text: "Type 2",
              size: 14,
              color: isSelected ? Color(0xff333333) : Color(0xff0047C3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chargerCardExpanded({
    required String title,
    required String subTitle,
    required String trailing,
    required int index,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
        alignment: Alignment.center,
        height: size.height * 0.27,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1.5,
            color: Color(0xffBFD6FF).withOpacity(0.6),
          ),
        ),
        child: Column(
          children: [
            ExpandableButton(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                ),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.0075),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => CustomBigText(
                              text: title,
                              size: 13,
                              color: index == controller.selectedCharger.value
                                  ? Color(0xff0047C3)
                                  : Color(0xff4f4f4f),
                            ),
                          ),
                          height(size.height * 0.004),
                          CustomSmallText(
                            text: subTitle,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: size.height * 0.025,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff219653).withOpacity(0.24),
                            ),
                            child: CustomBigText(
                              text: trailing,
                              size: 12,
                              color: Color(0xff219653),
                            ),
                          ),
                          width(size.width * 0.06),
                          SvgPicture.asset("assets/svg/arrow_upward_ios.svg")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            height(size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Container(
                height: size.height * 0.001,
                width: size.width,
                color: Color(0xffE0E0E0),
              ),
            ),
            height(size.height * 0.025),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: GridView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.2,
                      crossAxisCount: 2,
                      mainAxisSpacing: size.width * .01,
                      crossAxisSpacing: size.height * .01,
                    ),
                    itemBuilder: (context, index_grid) {
                      return InkWell(
                        onTap: () {
                          controller.changeCharger(index, index_grid);
                        },
                        child: Obx(
                          () => type2(
                              isSelected: index ==
                                      controller.selectedCharger.value &&
                                  controller.selectedType.value == index_grid,
                              title: 'Type 2'),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chargerCard({
    required String title,
    required String subTitle,
    required String trailing,
    required int index,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.height * 0.01),
        height: size.height * 0.08,
        decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.5,
              color: Color(0xffBFD6FF).withOpacity(.6),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => CustomBigText(
                      text: title,
                      size: 13,
                      color: controller.selectedCharger.value == index
                          ? Color(0xff0047C3)
                          : Color(0xff4f4f4f),
                    ),
                  ),
                  height(size.height * 0.004),
                  CustomSmallText(
                    text: subTitle,
                    size: 12,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.025,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff219653).withOpacity(0.24),
                    ),
                    child: CustomBigText(
                      text: trailing,
                      size: 12,
                      color: Color(0xff219653),
                    ),
                  ),
                  width(size.width * 0.06),
                  SvgPicture.asset("assets/svg/arrow_downward_ios.svg")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navigationCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Container(
        // height: size.height * 0.04,
        // width: size.width * .92,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/location_on.svg"),
                    width(size.width * 0.02),
                    Text(
                      "Location",
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000).withOpacity(.44),
                        fontStyle: FontStyle.normal,
                      )),
                    ),
                  ],
                ),
                Text(
                  "Vaitilla , Ernakulam , Kerala",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4F4F4F),
                    fontStyle: FontStyle.normal,
                  )),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: size.width * 0.03),
              decoration: BoxDecoration(
                color: Color(0xff2F80ED),
                borderRadius: BorderRadius.circular(20),
              ),
              height: size.height * 0.037,
              width: size.width * 0.24,
              child: Row(
                children: [
                  CustomBigText(
                    text: "Navigate",
                    size: 12,
                    color: kwhite,
                  ),
                  width(size.width * 0.02),
                  SvgPicture.asset("assets/svg/assistant_direction.svg")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
