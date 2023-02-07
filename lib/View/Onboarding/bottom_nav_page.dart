import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/calista_cafePage_controller.dart';
import 'package:freelancer_app/View/Trips/trip_card_page.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Utils/toastUtils.dart';
import '../Widgets/apptext.dart';
import '../Widgets/customText.dart';

class BottomNavScreen extends GetView<CalistaCafePageController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          key: drawerKey,
          bottomSheet: customDrawer(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                height(size.height * 0.2),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                        height: size.height * 0.5,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ExpandablePanel(
                                  collapsed: ExpandableButton(
                                    child: Container(
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(1, 4),
                                                blurRadius: 5,
                                                color: Colors.grey
                                                    .withOpacity(0.5))
                                          ]),
                                    ),
                                  ),
                                  expanded: ExpandableButton(
                                    child: Container(
                                      height: 100,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(1, 4),
                                                blurRadius: 5,
                                                color: Colors.grey
                                                    .withOpacity(0.5))
                                          ]),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.to(() => CardTrip());
                                          },
                                          child: Text("Button")),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )),
                ),
                height(size.height * 0.1),
                InkWell(
                  onTap: () {
                    drawerKey.currentState!.openDrawer();
                  },
                  child: LinearPercentIndicator(
                    width: 200,
                    progressColor: Color(0xff0047C3),
                    lineHeight: 6.0,
                    percent: .7,
                    barRadius: Radius.circular(15),
                    padding: EdgeInsets.zero,
                    animationDuration: 1000,
                    animation: true,
                  ),
                ),
                height(size.height * 0.05),
                reviewProgressBar("1", .5),
                reviewProgressBar("1", .7),

                height(size.height * 0.1),

                //  expandable(),
              ],
            ),
          )),
    );
  }

  Widget customDrawer() {
    return Drawer(
      child: Container(
        height: size.height,
        width: size.width * .4,
        color: Colors.red,
        child: Column(),
      ),
    );
  }

  Widget reviewProgressBar(String title, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LinearPercentIndicator(
          width: size.width * .3,
          animation: true,
          lineHeight: 6.0,
          animationDuration: 1000,
          percent: value,
          barRadius: Radius.circular(15),
          progressColor: Color(0xff0047C3),
          padding: EdgeInsets.zero,
        ),
        Spacer(),
        CustomText(text: title, color: Colors.grey, size: 12)
      ],
    );
  }

  Widget expandable() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * .04, vertical: size.height * .01),
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
        });
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
}
