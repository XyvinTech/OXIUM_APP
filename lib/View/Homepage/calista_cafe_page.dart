import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/calista_cafePage_controller.dart';
import 'package:freelancer_app/Model/chargerModel.dart';
import 'package:freelancer_app/Model/evPortsModel.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Singletones/dialogs.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../Widgets/cached_network_image.dart';
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(children: [
                    height(size.height * .01),
                    height(size.height * .015),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .06),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Obx(
                                  () => Container(
                                    color: Colors.grey,
                                    height: 90.w,
                                    // width: 90.w,
                                    child: cachedNetworkImage(
                                        controller.model.value.image),
                                  ),
                                )),
                          ),
                          width(size.width * .035),
                          Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * .023,
                                  width: size.width * .14,
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
                                        Obx(
                                          () => CustomText(
                                              text: controller.model.value
                                                      .rating.isEmpty
                                                  ? '0'
                                                  : double.parse(controller
                                                          .model.value.rating)
                                                      .toStringAsFixed(2),
                                              size: 12,
                                              color: Color(0xffF2994A)),
                                        ),
                                      ]),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () => CustomText(
                                            text: controller.model.value.name,
                                            overflow: TextOverflow.ellipsis,
                                            color: Color(0xff4F4F4F),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    width(size.width * .017),
                                  ],
                                ),
                                Obx(
                                  () => CustomText(
                                      text:
                                          '${controller.distance.value} km away',
                                      color: Color(0xff828282),
                                      fontWeight: FontWeight.normal,
                                      size: 12),
                                ),
                                if (controller.amenities.isNotEmpty &&
                                    controller.amenities[0].isNotEmpty) ...[
                                  height(8.h),
                                  Obx(
                                    () => GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              childAspectRatio: 4.7),
                                      itemCount: controller.amenities.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg/${controller.amenities[index]}.svg'),
                                            width(size.width * .01),
                                            Expanded(
                                              child: CustomText(
                                                  text: controller
                                                      .amenities[index]
                                                      .toTitleCase(),
                                                  color: Color(0xff828282),
                                                  fontWeight: FontWeight.normal,
                                                  size: 12),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  height(8.h),
                                ],
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //TODO: call api for adding as favorite or removing from favorite
                              controller.changeFavoriteStatus();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * .01),
                              padding: EdgeInsets.all(size.width * .02),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Color(0xffBDBDBD))),
                              child: Obx(
                                () => SvgPicture.asset(
                                  controller.model.value.isFavorite
                                      ? 'assets/svg/favorite1.svg'
                                      : 'assets/svg/favorite.svg',
                                  width: 15.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    height(size.height * .03),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/svg/location_on_blue.svg'),
                          width(5.w),
                          Expanded(
                            flex: 3,
                            child: Obx(
                              () => CustomText(
                                  text: controller.model.value.location_name,
                                  size: 12,
                                  color: Color(0xff4F4F4F)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // controller.getDirections(false);
                                    controller.launchOnGoogleMap();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff2F80ED)),
                                    child: SvgPicture.asset(
                                        'assets/svg/direction.svg'),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // controller.getDirections(false);
                                    controller.shareStationLocation();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.grey)),
                                    child: SvgPicture.asset(
                                        'assets/svg/share.svg'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                height(size.height * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .06),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 10.h,
                            width: 10.h,
                            decoration: BoxDecoration(
                                color: controller.isOpen.value
                                    ? Color(0xff219653)
                                    : Color.fromARGB(255, 195, 56, 56),
                                shape: BoxShape.circle),
                          ),
                          width(size.width * .02),
                          CustomText(
                              text: controller.isOpen.value
                                  ? 'Open Now'
                                  : 'Closed Now',
                              color: controller.isOpen.value
                                  ? Color(0xff219653)
                                  : Color.fromARGB(255, 195, 56, 56),
                              size: 13,
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                      Spacer(),
                      CustomText(
                          text:
                              '${convertToPmFormat(controller.model.value.startTime)} to ${convertToPmFormat(
                            controller.model.value.stopTime,
                          )}',
                          color: Color(0xffa9a9a9),
                          size: 14)
                    ],
                  ),
                ),
                height(size.height * .03),
                CustomText(
                    text: 'Select a charger to start charging',
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    size: 13),
                height(size.height * .03),
                Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.model.value.Chargers.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        ChargerModel charger =
                            controller.model.value.Chargers[index];
                        bool isConnected =
                            controller.model.value.Chargers[index].ocppStatus ==
                                'Connected';
                        return Container(
                            // height: 500.h,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * .04,
                                vertical: size.height * .01),
                            child: _chargerCardExpanded(
                              title: charger.charger_name,
                              subTitle: charger.outputType +
                                  ' ' +
                                  charger.capacity +
                                  ' KwH',
                              evPorts: charger.evports,
                              index: index,
                              isConnected: isConnected,
                            ));
                      }),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: size.height * .04),
                //   child: navigationCard(),
                // ),
                height(size.height * .025),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          //TODO: open review write dialog
                          controller.selectedRating.value = 0;
                          controller.reviewController.text = '';
                          Get.dialog(Dialogs().writeReviewDialog(controller));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              color: Color(0xff2F80ED),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('Write Review',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.reviewPageRoute, arguments: [
                            controller.model.value.rating.substring(0, 4),
                            controller.model.value.id
                          ]);
                        },
                        child: Row(
                          children: [
                            CustomText(
                                fontWeight: FontWeight.bold,
                                text: 'View Review',
                                color: Color(0xff0047C3),
                                size: 16),
                            width(10.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Color(0xff0047C3),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                height(50.h)
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.selectedCharger.value != -1 &&
                  controller.selectedType.value != -1,
              child: Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  color: kwhite,
                  padding: EdgeInsets.only(
                      bottom: 32.w, top: 21.w, left: 29.w, right: 29),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            controller.startCharging();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.w),
                            decoration: BoxDecoration(
                                color: Color(0xff0047C3),
                                borderRadius: BorderRadius.circular(35)),
                            child: Center(
                              child: CustomBigText(
                                text: "Start Charging",
                                size: 14.sp,
                                color: Color(0xffF2F2F2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget connectors({
    required bool isSelected,
    required EvPortModel evport,
    required int index,
    required int index1,
    required bool isConnected,
  }) {
    String status;
    if (evport.ocppStatus == kAvailable)
      status = kAvailable;
    else if (evport.ocppStatus == 'Charging')
      status = kBusy;
    else if (evport.ocppStatus == kFaulted)
      status = kFaulted;
    else
      status = kUnavailable;
    if (!isConnected) status = kUnavailable;

    return InkWell(
      onTap: () {
        if (status == kAvailable) controller.changeCharger(index, index1);
      },
      child: Container(
        height: 65.h,
        // width: size.width * 0.4,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isSelected && status == kAvailable
                ? Color(0xff6FCF97).withOpacity(.28)
                : status == kBusy
                    ? Color(0xffE37A2D).withOpacity(.2)
                    : status == kFaulted
                        ? Color.fromARGB(255, 249, 59, 45).withOpacity(.2)
                        : Colors.white,
            boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey.shade300)],
            border: !isSelected
                ? null
                : Border.all(
                    width: 1.3,
                    color: isSelected
                        ? Color(0xff6FCF97)
                        : status == kBusy
                            ? Color(0xffE37A2D)
                            : status == kFaulted
                                ? Color.fromARGB(255, 249, 59, 45)
                                : status == kUnavailable
                                    ? Color(0xff959595)
                                    : Color(0xff0047C3).withOpacity(.6),
                  )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              // Container(
              //   height: 10.h,
              //   width: 10.h,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: status == kBusy
              //           ? Color(0xffE37A2D)
              //           : status == kFaulted
              //               ? Color.fromARGB(255, 249, 59, 45)
              //               : status == kUnavailable
              //                   ? Color(0xff959595)
              //                   : Color(0xff219653)),
              // ),
              width(7.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/${evport.connectorType.toLowerCase().trim()}.svg",
                    width: 25.w,
                    // color: isSelected
                    //     ? Color(0xff4f4f4f)
                    //     : status == kBusy
                    //         ? Color(0xffE333333)
                    //         : status == kUnavailable || status == kFaulted
                    //             ? Color(0xff959595)
                    //             : Color(0xff0047C3),
                  ),
                ],
              ),
              width(12.5.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBigText(
                    text: 'Connector ${index1 + 1}',
                    size: 14.sp,
                    color: Color(0xff333333),
                    // color: isSelected
                    //     ? Color(0xff333333)
                    //     : status == kUnavailable || status == kFaulted
                    //         ? Color(0xff959595)
                    //         : Color(0xff0047C3),
                  ),
                  CustomSmallText(
                    text: evport.connectorType.isEmpty
                        ? 'Null'
                        : evport.connectorType,
                    size: 12.sp,
                    color: Color(0xff333333),
                    // color: isSelected
                    //     ? Color(0xff333333)
                    //     : status == kUnavailable || status == kFaulted
                    //         ? Color(0xff959595)
                    //         : Color(0xff0047C3),
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: 10.w,
                width: 10.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isConnected
                      ? status == kAvailable
                          ? Color(0xff219653)
                          : status == kBusy
                              ? Color(0xffE37A2D)
                              : status == kFaulted
                                  ? Color.fromARGB(255, 249, 59, 45)
                                  : Color(0xff828282)
                      : Color(0xff828282),
                ),
              ),
              width(5.w),
              CustomBigText(
                text: status,
                size: 12,
                color: isConnected
                    ? status == kAvailable
                        ? Color(0xff219653)
                        : status == kBusy
                            ? Color(0xffE37A2D)
                            : status == kFaulted
                                ? Color.fromARGB(255, 249, 59, 45)
                                : Color(0xff828282)
                    : Color(0xff828282),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chargerCardExpanded({
    required String title,
    required String subTitle,
    required List<EvPortModel> evPorts,
    required int index,
    required bool isConnected,
  }) {
    //////////LOGIC CODES////////
    List res = calculateAvailabiliy(evPorts, isConnected);
    int available = res[1];
    String trailing = res[0];
    ///////END LOGIC CODES///////
    kLog(controller.model.value.Chargers[index].evports.length.toString());
    return Container(
      // color: Colors.amber,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
          alignment: Alignment.center,
          height: 70.h +
              77.h * (controller.model.value.Chargers[index].evports.length),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.0075),
                      child: Row(
                        children: [
                          CustomBigText(
                              text: title,
                              size: 16,
                              color:
                                  // index == controller.selectedCharger.value ?
                                  Color(0xff0047C3)
                              // : Color(0xff4f4f4f),
                              ),
                          width(5.w),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: CustomText(
                                text: subTitle,
                                size: 11.5,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    CustomSmallText(
                      text:
                          '₹ ${controller.model.value.Chargers[index].tariff} /KwH',
                      size: 12,
                    ),
                  ],
                ),
              ),
              height(size.height * 0.01),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: evPorts.length,
                      scrollDirection: Axis.vertical,
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   childAspectRatio: 3.2,
                      //   crossAxisCount: 2,
                      //   mainAxisSpacing: size.width * .01,
                      //   crossAxisSpacing: size.height * .01,
                      // ),
                      itemBuilder: (context, index_grid) {
                        return Obx(() {
                          return connectors(
                            isSelected:
                                index == controller.selectedCharger.value &&
                                    controller.selectedType.value == index_grid,
                            index: index,
                            index1: index_grid,
                            evport: evPorts[index_grid],
                            isConnected: isConnected,
                          );
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chargerCard({
    required String title,
    required String subTitle,
    required List<EvPortModel> evPorts,
    required int index,
    required bool isConnected,
  }) {
    //////////LOGIC CODES////////
    List res = calculateAvailabiliy(evPorts, isConnected);
    int available = res[1];
    String trailing = res[0];
    ///////END LOGIC CODES///////
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
                    height: size.height * 0.03,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: available > 0
                          ? Color(0xff219653).withOpacity(0.24)
                          : trailing == kBusy
                              ? kBusyColor
                              : trailing == kFaulted
                                  ? Color.fromARGB(255, 249, 59, 45)
                                      .withOpacity(.2)
                                  : Color(0xff959595).withOpacity(.2),
                    ),
                    child: CustomBigText(
                      text: trailing,
                      size: 12,
                      color: available > 0
                          ? Color(0xff219653)
                          : trailing == kBusy
                              ? Color(0xffE37A2D)
                              : trailing == kFaulted
                                  ? Color.fromARGB(255, 249, 59, 45)
                                  : Color(0xff333333),
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

  Widget _dialougebox() {
    return AlertDialog(
      backgroundColor: kwhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.all(0),
      content: Container(
          padding: EdgeInsets.all(20.w),
          height: 460.h,
          width: 348.w,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 32,
                  color: Color(0xff000000).withOpacity(0.06),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSmallText(
                text: "How is your Experience?",
                size: 16.sp,
                letterspacing: -0.41,
              ),
              height(20.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Obx(
                  () => Row(
                    children: List.generate(
                        5,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectedRating.value = index + 1;
                                },
                                child: SvgPicture.asset(
                                  controller.selectedRating.value == 0 ||
                                          controller.selectedRating.value - 1 <
                                              index
                                      ? "assets/svg/star_rate.svg"
                                      : "assets/svg/star_rate3.svg",
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              height(25.h),
              TextFormField(
                minLines: 7,
                maxLines: 7,
                controller: controller.reviewController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "Leave Your Feedback here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff908484),
                        )),
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.41,
                        color: Color(0xffBDBDBD)),
                    contentPadding: EdgeInsets.only(left: 20.w, top: 25.h)),
              ),
              height(20.h),
              _button(
                  button: "Leave feedback",
                  onTap: () async {
                    bool status = await controller.postReviewForChargeStation();
                    if (status) Get.dialog(_responseDialougebox());
                  }),
              height(20.h),
              CustomBigText(
                ontap: () {
                  Get.back();
                },
                text: "Cancel",
                size: 15.sp,
                color: Color(0xff0047C3),
              )
            ],
          )),
    );
  }

  Widget _responseDialougebox() {
    return AlertDialog(
      backgroundColor: kwhite,
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
      content: Container(
        padding: EdgeInsets.all(20.w),
        height: 265.h,
        width: 348.w,
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffEBF8F1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.w,
                          color: Color(0xff05A660),
                        )),
                    child: Center(
                      child: Image.asset(
                        "assets/images/vector1.png",
                        height: 17,
                        width: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height(15.h),
            CustomBigText(
              text: "Thank you for your response",
              size: 20.sp,
              color: Color(0xff4F4F4F),
            ),
            height(10.h),
            CustomSmallText(
              text: "Your response has been added",
              size: 13.sp,
            ),
            height(10.h),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.homePageRoute);
              },
              child: Container(
                height: 56.h,
                width: 156.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: Color(0xff0047C3),
                ),
                child: Center(
                  child: CustomBigText(
                    text: "Back to Maps",
                    size: 15.sp,
                    color: Color(0xffF2F2F2),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _button({required String button, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: 237.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: Color(0xff0047C3),
        ),
        child: Center(
          child: CustomBigText(
            text: button,
            size: 14.sp,
            color: Color(0xffF2F2F2),
          ),
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
                Obx(
                  () => Text(
                    controller.model.value.location_name,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4F4F4F),
                      fontStyle: FontStyle.normal,
                    )),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                controller.getDirections(true);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.w),
                decoration: BoxDecoration(
                  color: Color(0xff2F80ED),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CustomBigText(
                      text: "Navigate",
                      size: 12.sp,
                      color: kwhite,
                    ),
                    width(size.width * 0.02),
                    SvgPicture.asset("assets/svg/assistant_direction.svg")
                  ],
                ),
              ),
            ),
          ],
        ),
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

  Widget customerReviewCard() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .04, vertical: size.height * .01),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Container(
          // color: Colors.amber,
          alignment: Alignment.topRight,
          child: Container(
            height: size.height * .045,
            width: size.height * .045,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
          ),
        )),
        width(size.width * .015),
        Expanded(
            flex: 8,
            child: Column(
              children: [
                Row(
                  children: [
                    CustomBigText(
                      text: 'Jane Doe',
                      size: 17,
                      color: Color(0xff4f4f4f),
                    ),
                    width(size.width * .02),
                    Row(
                      children: List.generate(
                        4,
                        (index) => Icon(
                          Icons.star,
                          color: Color(0xffF2994A),
                          size: 17,
                        ),
                      ),
                    )
                  ],
                ),
                height(size.height * .01),
                CustomText(
                    color: Color(0xff4f4f4f),
                    size: 15,
                    text:
                        'Lorem ipsom doler set amet, consequent is the worlds best company. Thanks in this case. ')
              ],
            ))
      ]),
    );
  }
}
