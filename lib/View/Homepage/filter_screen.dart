import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../Controller/filter_screen_controller.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/customText.dart';

class FilterScreen extends GetView<FilterScreenController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Color(0xffF0F1F6),
        backgroundColor: Colors.white,
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        child: CustomText(
                            text: 'Filter',
                            size: 18,
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.bold))),
                width(24)
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Row(children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: size.height * .055),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.parentList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.selectedParent.value = index;
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.only(left: size.width * .045),
                                  height: size.height * .06,
                                  color:
                                      controller.selectedParent.value == index
                                          ? Color(0xffF5F9FF)
                                          : null,
                                  child: CustomText(
                                      text: controller.parentList[index],
                                      size: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff4F4F4F)),
                                ),
                              ),
                            );
                          },
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * .045,
                              bottom: size.height * .05),
                          child: Container(
                            width: size.width * .38,
                            height: size.height * .055,
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                controller.resetFilter();
                              },
                              child: CustomText(
                                  text: 'Reset Filters',
                                  color: Color(0xff0047C3),
                                  size: 12,
                                  isUnderScore: true),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 8,
                    child: Container(
                      color: Color(0xffF5F9FF),
                      padding: EdgeInsets.only(top: size.height * .055),
                      child: Column(
                        children: [
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                  itemCount: controller
                                      .filterList[
                                          controller.selectedParent.value]
                                      .length,
                                  itemBuilder: (context, index) {
                                    String title = controller
                                        .filterList[controller
                                            .selectedParent.value][index]
                                        .title;
                                    return InkWell(
                                      onTap: () {
                                        controller
                                                .filterList[controller
                                                    .selectedParent
                                                    .value][index]
                                                .isSelected =
                                            !controller
                                                .filterList[controller
                                                    .selectedParent
                                                    .value][index]
                                                .isSelected;
                                        controller.reload++;
                                      },
                                      child: Row(
                                        children: [
                                          Obx(() {
                                            return Padding(
                                              padding: EdgeInsets.all(0.0 *
                                                  controller.reload.value),
                                              child: Checkbox(
                                                  activeColor:
                                                      Color(0xff0047C3),
                                                  value: controller
                                                      .filterList[controller
                                                          .selectedParent
                                                          .value][index]
                                                      .isSelected,
                                                  onChanged: (value) {
                                                    controller
                                                        .filterList[controller
                                                            .selectedParent
                                                            .value][index]
                                                        .isSelected = value!;
                                                    controller.reload++;
                                                  }),
                                            );
                                          }),
                                          // width(size.width * .01),
                                          if (controller.selectedParent.value ==
                                                  2 ||
                                              controller.selectedParent.value ==
                                                  4)
                                            SvgPicture.asset(
                                                'assets/svg/${title}.svg'),
                                          width(size.width * .03),
                                          CustomText(
                                              text: title,
                                              color: Color(0xff4F4F4F),
                                              size: 14)
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * .045,
                                bottom: size.height * .05),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: size.width * .38,
                                height: size.height * .055,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff0047C3)),
                                child: CustomText(
                                  text: 'Apply',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ]),
            ),
          )
        ])));
  }
}
