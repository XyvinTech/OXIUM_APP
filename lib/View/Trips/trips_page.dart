import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/cached_network_image.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/View/Widgets/rounded_container.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Controller/trips_screen_controller.dart';
import '../../Singletones/app_data.dart';
import '../../Utils/routes.dart';

class TripsScreen extends StatefulWidget {
  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen>
    with AutomaticKeepAliveClientMixin {
  TripsScreenController controller = Get.find();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: CustomScrollView(shrinkWrap: true, slivers: [
          SliverAppBar(
              backgroundColor: Color(0xffF5F9FF),
              automaticallyImplyLeading: false,
              expandedHeight: size.height * 0.65,
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
                        bottom: size.height * 0.01,
                      ),
                      child: Container(
                        height: size.height * 0.6,
                        width: size.width,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // Container(
                                        //   child: Image.asset(
                                        //     "assets/images/jeep1.png",
                                        //     height: size.height * 0.05,
                                        //     width: size.width * 0.15,
                                        //   ),
                                        // ),
                                        Obx(
                                          ()=> cachedNetworkImage(
                                              appData.userModel.value
                                                  .defaultVehicle.icon,
                                              width: size.width * .18),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                        Obx(
                                          ()=> Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomSmallText(
                                                text: appData.userModel.value.defaultVehicle.brand,
                                                size: 12,
                                              ),
                                              CustomBigText(
                                                text: appData.userModel.value.defaultVehicle.modelName,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    //refresh button
                                    InkWell(
                                      onTap: () {},
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
                                  // top: size.height * 0.07,
                                  // bottom: size.height * 0.02,
                                  ),
                              height: size.height * 0.37,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomBigText(
                                    text: 'Choose destinations',
                                    size: 14,
                                    color: Color(0xff4f4f4f),
                                  ),
                                  height(size.height * .02),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: size.width * .05,
                                          right: size.width * .015,
                                        ),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg/adjust.svg'),
                                            Column(
                                              children: List.generate(
                                                  4,
                                                  (index) => Container(
                                                        height: 5,
                                                        width: 1,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    size.height *
                                                                        .0038),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.grey),
                                                      )),
                                            ),
                                            SvgPicture.asset(
                                                'assets/svg/location_on_red.svg')
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Obx(
                                              () => rounded_container(
                                                  hintText: 'Starting point',
                                                  text: controller.source.value
                                                              .placeId ==
                                                          null
                                                      ? null
                                                      : controller.source.value
                                                          .description!
                                                          .split(', ')
                                                          .first,
                                                  onTap: () {
                                                    controller.getSource();
                                                  }),
                                            ),
                                            height(size.height * .02),
                                            Obx(
                                              () => rounded_container(
                                                  hintText: 'Destination',
                                                  text: controller.destination
                                                              .value.placeId ==
                                                          null
                                                      ? null
                                                      : controller.destination
                                                          .value.description!
                                                          .split(', ')
                                                          .first,
                                                  onTap: () {
                                                    controller.getDestination();
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                      width(size.width * .051)
                                    ],
                                  ),
                                  height(size.height * .025),
                                  Padding(
                                      padding: EdgeInsets.only(
                                        left: size.width * 0.055,
                                        right: size.width * 0.055,
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await controller
                                              .getDirectionsPolyline();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.065),
                                          height: size.height * 0.064,
                                          width: size.width * .45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(65),
                                            color: Color(0xff0047C3),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/svg/route.svg'),
                                                Text(
                                                  'Find route',
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    color: Color(0xffF2F2F2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                  Visibility(
                                    visible: false,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: CustomText(
                                        text: 'Empty Fields',
                                        size: 14,
                                        color: Color(0xffEB5757),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(size.height * .15),
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
                        height: size.height * 0.015,
                      ),
                      CustomBigText(
                        text: 'Trips',
                        size: 14,
                        color: Color(0xff4f4f4f),
                      ),
                      height(size.height * .01),
                      Container(
                        height: size.height * .057,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * .045,
                            vertical: size.height * .00),
                        decoration: BoxDecoration(
                            color: Color(0xffDEEAFF),
                            borderRadius: BorderRadius.circular(8)),
                        child: TabBar(
                          padding: EdgeInsets.all(2.5),
                          labelColor: kblue,
                          controller: controller.tabController,
                          indicatorColor: kwhite,
                          onTap: (index) {
                            controller.IsTabIndex.value = index;
                          },
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffffffff),
                          ),
                          tabs: [
                            Tab(
                              child: CustomSmallText(
                                text: "All trips",
                                size: 14,
                                color: kblack,
                              ),
                            ),
                            Tab(
                              child: CustomSmallText(
                                text: "Saved trips",
                                size: 14,
                                color: kblack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      height(10.h)
                    ],
                  ),
                ),
              )),
          SliverToBoxAdapter(
            child: Container(
              height: size.height * .097 * 45,
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
                      child: Container(
                        child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            _tripsTab(),
                            _tripsTab(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  // ignore: unused_element
  Widget _chargeTab() {
    return Container(
      // margin: EdgeInsets.symmetric(
      //     horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.12,
            width: size.width * 0.85,
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
                        size: 16,
                        color: kwhite,
                      ),
                      SizedBox(
                        height: size.height * 0.017,
                      ),
                      CustomSmallText(
                        text: "Scan and charge for awail neew",
                        size: 10,
                        color: kwhite,
                      ),
                      CustomSmallText(
                        text: "offers and rewards",
                        size: 10,
                        color: kwhite,
                      )
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/G.png",
                  // height: size.height * 0.05,
                  // width: size.width * 0.15,
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomBigText(
            text: "Charging History",
            fontWeight: FontWeight.w500,
            size: 12,
            color: Color(0xff4F4F4F),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: 40,
                  // shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return InkWell(onTap: () {}, child: _chargeHistoryCard());
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget _chargeHistoryCard() {
    return Column(
      children: [

        InkWell(
          onTap: () {
            // Get.toNamed(Routes.reservationPageRoute);
          },
          child: Container(
            padding: EdgeInsets.only(
              left: size.width * 0.03,
              top: size.height * 0.015,
              bottom: size.height * 0.015,
              right: size.width * 0.03,
            ),
            height: size.height * 0.1,
            width: size.width,
            // decoration: BoxDecoration(
            //   color: kwhite,
            //   border: Border.all(
            //     color: Color(0xffBDBDBD),
            //     width: 0.4,
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    
                    Image.asset(
                      "assets/images/coffee.png",
                      height: size.height * 0.055,
                      width: size.width * 0.13,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.012),
                      child: Column(
                        children: [
                          CustomSmallText(
                            text: "Calista cafe",
                            size: 10,
                          ),
                          SizedBox(
                            height: size.height * 0.007,
                          ),
                          CustomSmallText(
                            text: "DC 45 kWh",
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
                            text: "1 H 23 MIN",
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
        Divider(),
      ],
    );
  }

  Widget _tripsTab() {
    return Container(
      child: Column(
        children: [
          Expanded(
            // height: size.height * 0.32,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 40,
                itemBuilder: (_, index) {
                  return ExpandablePanel(
                    collapsed: ExpandableButton(child: _tripsCard()),
                    expanded: _tripsCardExpanded(),
                  );
                }),
          )
        ],
      ),
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
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 15.h,
        ),
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
            _exploreTripButton(
                title: "Explore Trip",
                onTap: () {
                  Get.toNamed(Routes.exploreTripPageRoute);
                }),
            height(10.h),
          ],
        ),
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
}
