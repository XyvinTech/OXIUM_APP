import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/search_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/textfield_home.dart';
import 'package:get/get.dart';

import '../../Singletones/map_functions.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/customText.dart';

class SearchScreen extends GetView<SearchScreenController> {
  const SearchScreen({super.key});

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
                  width: 48.w,
                  height: 48.w,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 8)
                  ], shape: BoxShape.circle, color: Colors.white),
                  child: SvgPicture.asset('assets/svg/arrow_back_ios.svg',
                      width: 24.w, height: 24.w),
                ),
              ),
              width(size.width * .02),
              Container(
                height: 48.w,
                width: size.width * .75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(83),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade400, blurRadius: 8)
                    ],
                    color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: textField(
                    controller: controller.searchTextController,
                    hintText: 'Search',
                    size: size,
                    autofocus: true,
                    suffix:
                        // controller.isShowCross.value
                        //     ? InkWell(
                        //         onTap: () {
                        //           controller.searchTextController.text = '';
                        //           controller.isShowCross.value = false;
                        //         },
                        //         child: SvgPicture.asset(
                        //           'assets/svg/close.svg',
                        //         ),
                        //       )
                        //     :
                        InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svg/search-zoom-in.svg',
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) return;
                      controller.debouncer.run(() {
                        controller.getSearchedChargeStationList(value);
                      });
                      if (value.isEmpty)
                        controller.isShowCross.value = false;
                      else if (!controller.isShowCross.value)
                        controller.isShowCross.value = true;
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: size.height * .065,
            margin:
                EdgeInsets.only(top: size.height * .02, left: size.width * .04),
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
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * .01),
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .035),
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
                          controller.getSearchedChargeStationList(
                              controller.searchTextController.text);
                        },
                        child: CustomText(
                            text: controller.suggestions[index], size: 12.5),
                      ),
                    ),
                  );
                }),
          ),
          height(size.height * .02),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.search_list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.calistaCafePageRoute,
                            arguments: controller.search_list[index].id);
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * .04),
                        child: Column(
                          children: [
                            Row(children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svg/device_reset.svg'),
                                    height(5.h),
                                    CustomText(
                                        text:
                                            '${(MapFunctions.distanceBetweenCoordinates(MapFunctions().curPos!.latitude, MapFunctions().curPos!.longitude, controller.search_list[index].lattitude, controller.search_list[index].longitude) / 1000.0).toPrecision(2)} km',
                                        size: 10,
                                        color: Color(0xff828282))
                                  ],
                                ),
                              ),
                              width(size.width * .03),
                              Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller.search_list[index]
                                            .chargestation_name,
                                        size: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff4F4F4F),
                                      ),
                                      height(1.5.h),
                                      CustomText(
                                        text: controller
                                            .search_list[index].location_name,
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
