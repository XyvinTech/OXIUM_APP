import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/View/Widgets/textfield_home.dart';
import 'package:get/get.dart';
import '../../Controller/search_places_controller.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/customText.dart';

class SearchPlacesScreen extends GetView<SearchPlacesScreenController> {
  const SearchPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: Color(0xffF5F9FF),
      child: SafeArea(
        child: Column(children: [
          height(size.height * .01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(size.height * .024),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 8)
                  ], shape: BoxShape.circle, color: Colors.white),
                  child: SvgPicture.asset('assets/svg/arrow_back_ios.svg'),
                ),
              ),
              width(size.width * .02),
              Container(
                height: size.height * .057,
                width: size.width * .75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade400, blurRadius: 8)
                    ],
                    color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Obx(
                    () => textField(
                      controller: controller.searchTextController,
                      hintText: 'Search',
                      size: size,
                      autofocus: true,
                      suffix: controller.isShowCross.value
                          ? InkWell(
                              onTap: () {
                                controller.searchTextController.text = '';
                                controller.isShowCross.value = false;
                              },
                              child: SvgPicture.asset(
                                'assets/svg/close.svg',
                              ),
                            )
                          : InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/svg/search-zoom-in.svg',
                              ),
                            ),
                      onChanged: (value) {
                        if (value.isEmpty) return;
                        controller.debouncer.run(() {
                          log(value);
                          controller.searchPlace(value);
                        });
                        if (value.isEmpty)
                          controller.isShowCross.value = false;
                        else if (!controller.isShowCross.value)
                          controller.isShowCross.value = true;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () => controller.isShowCross.value
                ? Container()
                : Container(
                    height: size.height * .065,
                    margin: EdgeInsets.only(
                        top: size.height * .02, left: size.width * .04),
                    // color: Colors.amber,
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.suggestions.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: size.height * .04,
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * .01),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .035),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        color: Colors.grey.shade300,
                                        offset: Offset(0, 6))
                                  ]),
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  controller.searchTextController.text =
                                      controller.suggestions[index];
                                  controller.isShowCross.value = true;
                                },
                                child: CustomText(
                                    text: controller.suggestions[index],
                                    size: 12.5),
                              ),
                            ),
                          );
                        }),
                  ),
          ),
          height(size.height * .02),
          Expanded(
            child: Obx(
              () => controller.autoCompletePrediction.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: CustomText(text: 'Search you places!'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.autoCompletePrediction.length,
                      itemBuilder: (context, index) {
                        int distance = controller
                                .autoCompletePrediction[index].distanceMeters ??
                            0;

                        String disText = distance > 1000
                            ? (distance / 1000).ceil().toString() + ' km'
                            : distance.toString() + ' m';
                        String name = controller
                            .autoCompletePrediction[index].description!
                            .split(', ')
                            .first;
                        String subtitle = controller
                            .autoCompletePrediction[index].description!
                            .replaceFirst(name + ', ', '');

                        return InkWell(
                          onTap: () {
                            Get.back(result: [
                              controller.autoCompletePrediction[index]
                            ]);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * .04),
                            child: Column(
                              children: [
                                Row(children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/device_reset.svg'),
                                        CustomText(
                                            text: disText,
                                            size: 10,
                                            color: Color(0xff828282))
                                      ],
                                    ),
                                  ),
                                  width(size.width * .02),
                                  Expanded(
                                      flex: 6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: name,
                                            size: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff4F4F4F),
                                          ),
                                          CustomText(
                                            text: subtitle,
                                            size: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xff828282),
                                          ),
                                        ],
                                      )),
                                  SvgPicture.asset(
                                      'assets/svg/arrow_forward_ios.svg')
                                ]),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * .007),
                                  child: Divider(),
                                ),
                                height(size.height * .0065)
                              ],
                            ),
                          ),
                        );
                      }),
            ),
          )
        ]),
      ),
    ));
  }
}
