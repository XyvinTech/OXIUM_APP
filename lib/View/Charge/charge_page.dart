import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/chargePage_controller.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Model/chargeTransactionModel.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/cached_network_image.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Singletones/app_data.dart';
import '../../Utils/routes.dart';

class ChargeScreen extends StatefulWidget {
  @override
  State<ChargeScreen> createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen>
    with AutomaticKeepAliveClientMixin {
  ChargeScreenController controller = Get.find();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: CustomScrollView(shrinkWrap: true, slivers: [
          SliverAppBar(
              backgroundColor: Color(0xffF5F9FF),
              automaticallyImplyLeading: false,
              expandedHeight: size.height * 0.525,
              // collapsedHeight: size.height * 0.01,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.055,
                        right: size.width * 0.055,
                        top: size.height * 0.020,
                        bottom: size.height * 0.02,
                      ),
                      child: Container(
                        height: size.height * 0.43,
                        width: size.width,
                        child: Column(
                          children: [
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                    blurRadius: 32,
                                    color: Color(0xff000000).withOpacity(0.06),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.055,
                                    vertical: size.height * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        cachedNetworkImage(
                                            appData.userModel.value
                                                .defaultVehicle.icon,
                                            width: size.width * .18),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                        Obx(
                                          () => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomSmallText(
                                                text: appData
                                                    .userModel
                                                    .value
                                                    .defaultVehicle
                                                    .vehicleDetails,
                                                size: 14.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              CustomBigText(
                                                text: appData.userModel.value
                                                    .defaultVehicle.modelName,
                                                size: 15.sp,
                                                color: Color(0xff4F4F4F),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    //refresh button
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.myvehicleRoute);
                                      },
                                      child: Image.asset(
                                        "assets/images/refresh.png",
                                        height: size.height * 0.025,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            //resereve charger card
                            Container(
                              padding: EdgeInsets.only(
                                top: size.height * 0.07,
                                bottom: size.height * 0.02,
                              ),
                              height: size.height * 0.285,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                    blurRadius: 32,
                                    color: Color(0xff000000).withOpacity(0.06),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          CustomBigText(
                                            text: "500 kWh",
                                            size: 17.sp,
                                            color: Color(0xff0047C3),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.008,
                                          ),
                                          CustomSmallText(
                                            text: "Energy Charged",
                                            fontWeight: FontWeight.w500,
                                            size: 14.sp,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: size.height * 0.04,
                                        width: size.width * 0.0055,
                                        color: Color(0xffBDBDBD),
                                      ),
                                      Column(
                                        children: [
                                          CustomBigText(
                                            text: "2,340",
                                            size: 17.sp,
                                            color: Color(0xff0047C3),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.008,
                                          ),
                                          CustomSmallText(
                                            text: "KMS Driven",
                                            fontWeight: FontWeight.w500,
                                            size: 14.sp,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.045,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.055,
                                      right: size.width * 0.055,
                                    ),
                                    child: AppButton(
                                      text: "Reserve Charger",
                                      sizeheight: size.height * 0.07,
                                      onTap: () {
                                        HomePageController homeController =
                                            Get.find();

                                        homeController.pageController
                                            .animateToPage(
                                                0,
                                                curve: Curves.ease,
                                                duration: Duration(
                                                    milliseconds: 200));
                                        log('change');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            height(15.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(size.height * .09),
                child: Container(
                  color: kwhite,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.006,
                        width: size.width * 0.25,
                        color: Color(0xffD9D9D9),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.055),
                        child: Container(
                          height: size.height * .06,
                          padding:
                              EdgeInsets.symmetric(vertical: size.height * .01),
                          child: TabBar(
                            labelColor: kblue,
                            controller: controller.tabController,
                            indicatorColor: kwhite,
                            onTap: (index) {
                              controller.IsTabIndex.value = index;
                            },
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(42),
                              color: Color(0xffDEEAFF),
                            ),
                            tabs: [
                              Tab(
                                child: CustomSmallText(
                                  text: "Charge",
                                  size: 15.sp,
                                  color: Color(0xff0047C3),
                                ),
                              ),
                              // Tab(
                              //   child: CustomSmallText(
                              //     text: "Reservations",
                              //     size: 15.sp,
                              //     color: Color(0xff0047C3),
                              //   ),
                              // ),
                              Tab(
                                child: CustomSmallText(
                                  text: "Trips",
                                  size: 15.sp,
                                  color: Color(0xff0047C3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          SliverToBoxAdapter(
            child: Obx(
              () => Container(
                height:
                    (size.height * .1 + 20.h) * controller.model_list.length,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            _chargeTab(),
                            // _reservationsTab(),
                            _tripsTab(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  // ignore: unused_element
  Widget _chargeTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.qrScanPageRoute);
          },
          child: Container(
            height: size.height * 0.12,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff333333),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    // top: size.height * 0.02,
                    // bottom: size.height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomBigText(
                        text: "Scan and Charge",
                        size: 17.sp,
                        color: kwhite,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: size.height * 0.017,
                      ),
                      CustomSmallText(
                        text: "Scan and charge to avail new",
                        size: 10.sp,
                        color: kwhite,
                      ),
                      CustomSmallText(
                        text: "offers and rewards",
                        size: 11.sp,
                        color: kwhite,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 11.h),
                  child: SvgPicture.asset("assets/svg/G2.svg"),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        CustomBigText(
          text: "Charging History",
          fontWeight: FontWeight.w500,
          size: 12.sp,
          color: Color(0xff4F4F4F),
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
                itemCount: controller.model_list.length,
                // shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return _chargeHistoryCard(controller.model_list[index]);
                }),
          ),
        )
      ],
    );
  }

  Widget _chargeHistoryCard(ChargeTransactionModel model) {
    int hour = 0, minute = 0;
    List<int> time = getTimeDifference(
        startTime: model.chargingStartTime, endtime: model.ChargingStopTime);
    if (model.ChargingStopTime.isEmpty) {
      hour = 0;
      minute = 0;
    } else {
      hour = time[0];
      minute = time[1];
    }
    return InkWell(
      onTap: () {
        controller.getBooking(model.bookingId);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          padding: EdgeInsets.only(
            left: size.width * 0.03,
            top: size.height * 0.015,
            bottom: size.height * 0.015,
            right: size.width * 0.03,
          ),
          height: size.height * 0.1,
          width: size.width,
          decoration: BoxDecoration(
            color: kwhite,
            border: Border.all(
              color: Color(0xffBDBDBD),
              width: 0.4,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //TODO: use cached network image here
                  cachedNetworkImage(model.image, width: size.width * .13),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.012),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSmallText(
                          text: model.stationName,
                          size: 10,
                        ),
                        SizedBox(
                          height: size.height * 0.007,
                        ),
                        CustomSmallText(
                          text: model.stationAddress,
                          size: 12,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.004),
                    child: Column(
                      children: [
                        CustomSmallText(
                          text: "$hour H $minute MIN",
                          size: 12,
                        ),
                        SizedBox(
                          height: size.height * 0.007,
                        ),
                        CustomBigText(
                          text: "Cr. 523 ",
                          size: 16,
                          color: Color(0xff4F4F4F),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: size.height * 0.03,
                    color: Color(0xffBDBDBD),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _dialougebox(
      {required String title,
      required String amount,
      required Color amountColor}) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.all(0),
      content: Container(
        height: size.height * 0.4,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBigText(
                    text: "Payments",
                    size: 14,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset("assets/svg/close.svg"),
                  ),
                ],
              ),
            ),
            height(size.height * 0.01),
            Divider(
              thickness: size.height * 0.002,
              color: Color(0xffE0E0E0),
            ),
            height(size.height * 0.01),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.04,
                right: size.width * 0.04,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/coffee1.png',
                    width: size.width * 0.1,
                  ),
                  width(size.width * 0.04),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.00),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSmallText(
                          text: title,
                          letterspacing: -0.408,
                          size: 16,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/calendar_month.svg",
                              width: size.width * 0.045,
                            ),
                            width(size.width * 0.01),
                            CustomSmallText(
                              text: "12 Jun 2022 at 03:30 PM",
                              size: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            height(size.height * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomSmallText(
                    text: "Vehicle details",
                    size: 12,
                    color: Color(0xffBDBDBD),
                  ),
                ),
                height(size.height * 0.002),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.24),
                  child: Row(
                    children: [
                      CustomBigText(
                        text: "Jeep",
                        size: 18,
                      ),
                      width(size.width * 0.02),
                      CustomBigText(
                        text: "RUBICON",
                        size: 18,
                        color: Color(0xff4F4F4F),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomSmallText(
                    text: "Vehicle No : KL 07 A 223",
                    size: 12,
                  ),
                )
              ],
            ),
            height(size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.008,
                    horizontal: size.width * 0.04),
                height: size.height * 0.095,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff219653),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.025,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xffDEEAFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: CustomSmallText(
                              text: "Energy",
                              size: 12,
                              color: Color(0xff0047C3),
                            ),
                          ),
                        ),
                        height(size.height * 0.004),
                        Row(
                          children: [
                            CustomBigText(
                              text: "356",
                              size: 24,
                              color: Color(0xff4F4F4F),
                            ),
                            width(size.width * 0.01),
                            CustomSmallText(text: "kWh"),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomSmallText(
                          text: "Amount(in coins)",
                          size: 13.sp,
                        ),
                        height(size.height * 0.004),
                        CustomBigText(
                          text: amount,
                          color: amountColor,
                          size: 24.sp,
                          fontWeight: FontWeight.w500,
                          align: TextAlign.end,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _reservationsTab() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 40,
              itemBuilder: (_, index) {
                return _reverstaionsCard();
              }),
        )
      ],
    );
  }

  Widget _reverstaionsCard() {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.reservationPageRoute);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Container(
          padding: EdgeInsets.only(
              left: size.width * 0.04,
              top: 10.h,
              right: size.width * 0.02,
              bottom: 10.h),
          height: size.height * 0.114,
          width: size.width,
          decoration: BoxDecoration(
            color: kwhite,
            border: Border.all(
              color: Color(0xffE0E0E0),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomBigText(
                        text: "Reservation 3245",
                        size: 14,
                        color: Color(0xff4F4F4F),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Container(
                        height: size.height * 0.025,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFE9E9),
                        ),
                        child: Center(
                          child: CustomSmallText(
                            text: "Normal",
                            size: 10,
                            color: Color(0xffEB5757),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomSmallText(
                    text: "Vaitilla , Ernakulam , Kerala",
                    size: 12,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                        size: size.height * 0.017,
                        color: Color(0xff828282),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      //time
                      CustomSmallText(
                        text: "03:30 PM",
                        size: 12,
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Icon(
                        Icons.calendar_month,
                        size: size.height * 0.017,
                        color: Color(0xff828282),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      //calender
                      CustomSmallText(
                        text: "12 Jun 2022",
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: size.height * 0.032,
                color: Color(0xffBDBDBD),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _tripsTab() {
    return Column(
      children: [
        Expanded(
          // height: size.height * 0.32,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (_, index) {
              return ExpandablePanel(
                collapsed: ExpandableButton(child: _tripsCard()),
                expanded: _tripsCardExpanded(),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _tripsCard() {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          top: size.height * 0.013,
          right: 20.w,
        ),
        height: size.height * 0.085,
        width: size.width,
        decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                spreadRadius: 0,
                blurRadius: 21,
                color: Color(0xff000000).withOpacity(0.12),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/conversion.png",
                      height: size.height * 0.02,
                      width: size.width * 0.03,
                    ),
                    SizedBox(
                      width: size.width * 0.015,
                    ),
                    CustomSmallText(text: "Trip 01"),
                    SizedBox(
                      width: size.width * 0.018,
                    ),
                    Container(
                      height: size.height * 0.025,
                      width: size.width * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff9B51E0).withOpacity(0.10),
                      ),
                      child: Center(
                        child: CustomBigText(
                          text: "Finished",
                          size: 12,
                          color: Color(0xff9B51E0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: size.height * 0.017,
                      color: Color(0xff828282),
                    ),
                    SizedBox(
                      width: size.width * 0.015,
                    ),
                    //calender
                    CustomSmallText(
                      text: "12 Jun 2022",
                      size: 12,
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: SvgPicture.asset("assets/svg/arrow_down_ios.svg"),
            )
          ],
        ),
      ),
    );
  }

  Widget _tripsCardExpanded() {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        top: size.height * 0.013,
        right: 20.w,
      ),
      height: 330.h,
      width: size.width,
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 21,
              color: Color(0xff000000).withOpacity(0.12),
            )
          ]),
      child: Column(
        children: [
          ExpandableButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/conversion.png",
                              height: size.height * 0.02,
                              width: size.width * 0.03,
                            ),
                            SizedBox(
                              width: size.width * 0.015,
                            ),
                            CustomSmallText(text: "Trip 01"),
                            SizedBox(
                              width: size.width * 0.018,
                            ),
                            Container(
                              height: size.height * 0.025,
                              width: size.width * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff9B51E0).withOpacity(0.10),
                              ),
                              child: Center(
                                child: CustomBigText(
                                  text: "Finished",
                                  size: 12,
                                  color: Color(0xff9B51E0),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: size.height * 0.017,
                              color: Color(0xff828282),
                            ),
                            SizedBox(
                              width: size.width * 0.015,
                            ),
                            //calender
                            CustomSmallText(
                              text: "12 Jun 2022",
                              size: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: SvgPicture.asset("assets/svg/arrow_up_ios.svg"),
                  )
                ],
              ),
            ),
          ),
          height(size.height * 0.01),
          Container(
            height: size.height * 0.002,
            width: size.width,
            color: Color(0xffE0E0E0),
          ),
          height(size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/svg/ev_charger.svg"),
                  width(size.width * 0.015),
                  CustomBigText(
                    ontap: () {},
                    text: "Reservation",
                    size: 13.sp,
                    color: Color(
                      0xff0047C3,
                    ),
                    letterspacing: -0.408,
                  )
                ],
              ),
              CustomSmallText(
                text: "324 KMS",
                size: 13.sp,
              )
            ],
          ),
          height(size.height * 0.02),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.008),
            child: Row(
              children: [
                SvgPicture.asset("assets/svg/adjust1.svg"),
                width(size.width * 0.015),
                CustomSmallText(
                  text: "Starting Point",
                  size: 13.sp,
                  letterspacing: -0.408,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.017),
            child: Row(
              children: [
                SvgPicture.asset("assets/svg/line.svg"),
                width(size.width * 0.03),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: CustomBigText(
                    text: "S4 Bt , Elam Street , Jarkhand",
                    size: 14,
                    color: Color(0xff4F4F4F),
                    letterspacing: -0.408,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.008),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.001),
                  child: SvgPicture.asset(
                    "assets/svg/location_on1.svg",
                  ),
                ),
                width(size.width * 0.015),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: CustomSmallText(
                    text: "Ending Point",
                    size: 13.sp,
                    letterspacing: -0.408,
                  ),
                )
              ],
            ),
          ),
          height(size.height * 0.004),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Row(
              children: [
                CustomBigText(
                  text: "S4 Bt , Elam Street , Jarkhand",
                  size: 14,
                  color: Color(0xff4F4F4F),
                  letterspacing: -0.408,
                ),
              ],
            ),
          ),
          height(size.height * 0.04),
          _exploreTripButton(title: "Explore Trip", onTap: () {})
        ],
      ),
    );
  }

  Widget _exploreTripButton(
      {required String title, required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 37.h,
        width: 183.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: kwhite,
            border: Border.all(
              width: 1.5.w,
              color: Color(0xff0047C3),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBigText(
              text: title,
              size: 15.sp,
              color: Color(0xff0047C3),
            ),
            width(4.w),
            SvgPicture.asset("assets/svg/arrow_frwrd.svg"),
          ],
        ),
      ),
    );
  }

  // Widget ChargePage() {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(
  //           left: size.width * 0.055,
  //           right: size.width * 0.055,
  //           top: size.height * 0.020,
  //           bottom: size.height * 0.02,
  //         ),
  //         child: Container(
  //           height: size.height * 0.377,
  //           width: size.width,
  //           child: Column(
  //             children: [
  //               Container(
  //                 height: size.height * 0.08,
  //                 width: size.width,
  //                 decoration: BoxDecoration(
  //                   color: kwhite,
  //                   borderRadius: BorderRadius.circular(20),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       offset: Offset(0, 4),
  //                       spreadRadius: 0,
  //                       blurRadius: 32,
  //                       color: Color(0xff000000).withOpacity(0.06),
  //                     )
  //                   ],
  //                 ),
  //                 child: Padding(
  //                   padding: EdgeInsets.symmetric(
  //                       horizontal: size.width * 0.03,
  //                       vertical: size.height * 0.02),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Container(
  //                             child: Image.asset(
  //                               "assets/images/jeep1.png",
  //                               height: size.height * 0.05,
  //                               width: size.width * 0.15,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: size.width * 0.04,
  //                           ),
  //                           Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               CustomSmallText(
  //                                 text: "Jeep",
  //                                 size: 12,
  //                               ),
  //                               CustomBigText(
  //                                 text: "RUBICON",
  //                                 size: 14,
  //                               ),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                       //refresh button
  //                       InkWell(
  //                         onTap: () {},
  //                         child: Image.asset(
  //                           "assets/images/refresh.png",
  //                           height: size.height * 0.025,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: size.height * 0.02,
  //               ),
  //               //resereve charger card
  //               Container(
  //                 padding: EdgeInsets.only(
  //                   top: size.height * 0.07,
  //                   bottom: size.height * 0.02,
  //                 ),
  //                 height: size.height * 0.27,
  //                 width: size.width,
  //                 decoration: BoxDecoration(
  //                   color: kwhite,
  //                   borderRadius: BorderRadius.circular(20),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       offset: Offset(0, 4),
  //                       spreadRadius: 0,
  //                       blurRadius: 32,
  //                       color: Color(0xff000000).withOpacity(0.06),
  //                     )
  //                   ],
  //                 ),
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         Column(
  //                           children: [
  //                             CustomBigText(
  //                               text: "500 kWh",
  //                               size: 16,
  //                               color: kblue,
  //                             ),
  //                             SizedBox(
  //                               height: size.height * 0.01,
  //                             ),
  //                             CustomSmallText(
  //                               text: "Energy Charged",
  //                               size: 12,
  //                             ),
  //                           ],
  //                         ),
  //                         Container(
  //                           height: size.height * 0.04,
  //                           width: size.width * 0.0055,
  //                           color: Color(0xffBDBDBD),
  //                         ),
  //                         Column(
  //                           children: [
  //                             CustomBigText(
  //                               text: "2,340",
  //                               size: 16,
  //                               color: kblue,
  //                             ),
  //                             SizedBox(
  //                               height: size.height * 0.01,
  //                             ),
  //                             CustomSmallText(
  //                               text: "KMS Driven",
  //                               size: 12,
  //                             ),
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: size.height * 0.045,
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.only(
  //                         left: size.width * 0.055,
  //                         right: size.width * 0.055,
  //                       ),
  //                       child: AppButton(
  //                         text: "Reserve Charger",
  //                         sizeheight: size.height * 0.07,
  //                         onTap: () {
  //                           HomePageController homeController = Get.find();
  //                           homeController.pageController.jumpToPage(0);
  //                           log('change');
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           // height: size.height * 0.425,
  //           // width: size.width,
  //           color: kwhite,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               SizedBox(
  //                 height: size.height * 0.01,
  //               ),
  //               Container(
  //                 height: size.height * 0.006,
  //                 width: size.width * 0.25,
  //                 color: Color(0xffD9D9D9),
  //               ),
  //               SizedBox(
  //                 height: size.height * 0.005,
  //               ),
  //               Obx(
  //                 () => Container(
  //                   child: Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: TabBar(
  //                       labelColor: kblue,
  //                       controller: controller.tabController,
  //                       indicatorColor: kwhite,
  //                       onTap: (index) {
  //                         controller.IsTabIndex.value = index;
  //                       },
  //                       tabs: [
  //                         Tab(
  //                           child: Container(
  //                             height: size.height * 0.035,
  //                             width: size.width * 0.19,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(42),
  //                               color: controller.IsTabIndex == 0
  //                                   ? Color(0xffDEEAFF)
  //                                   : kwhite,
  //                             ),
  //                             child: Center(
  //                                 child: CustomSmallText(
  //                               text: "Charge",
  //                               size: 14,
  //                               fontWeight: FontWeight.bold,
  //                               color: kblue,
  //                             )),
  //                           ),
  //                         ),
  //                         Tab(
  //                           child: Container(
  //                             height: size.height * 0.038,
  //                             width: size.width * 0.38,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(42),
  //                               color: controller.IsTabIndex == 1
  //                                   ? Color(0xffDEEAFF)
  //                                   : kwhite,
  //                             ),
  //                             child: Center(
  //                                 child: CustomSmallText(
  //                               text: "Reservations",
  //                               fontWeight: FontWeight.bold,
  //                               size: 14,
  //                               color: kblue,
  //                             )),
  //                           ),
  //                         ),
  //                         Tab(
  //                           child: Container(
  //                             height: size.height * 0.035,
  //                             width: size.width * 0.16,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(42),
  //                               color: controller.IsTabIndex == 2
  //                                   ? Color(0xffDEEAFF)
  //                                   : kwhite,
  //                             ),
  //                             child: Center(
  //                                 child: CustomSmallText(
  //                               text: "Trips",
  //                               size: 14,
  //                               fontWeight: FontWeight.bold,
  //                               color: kblue,
  //                             )),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: size.height * 0.02,
  //               ),
  //               Expanded(
  //                 child: Padding(
  //                   padding:
  //                       EdgeInsets.symmetric(horizontal: size.width * 0.05),
  //                   child: Container(
  //                     child: TabBarView(
  //                       controller: controller.tabController,
  //                       children: [
  //                         _chargeTab(),
  //                         _reservationsTab(),
  //                         _tripsTab(),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
