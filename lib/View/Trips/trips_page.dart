import 'package:flutter/material.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Controller/trips_screen_controller.dart';
import '../../Utils/routes.dart';

class TripsScreen extends GetView<TripsScreenController> {
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
              expandedHeight: size.height * 0.6,
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
                        height: size.height * 0.4,
                        width: size.width,
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.09,
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
                                        Container(
                                          child: Image.asset(
                                            "assets/images/jeep1.png",
                                            height: size.height * 0.05,
                                            width: size.width * 0.15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomSmallText(
                                              text: "Jeep",
                                              size: 12,
                                            ),
                                            CustomBigText(
                                              text: "RUBICON",
                                              size: 14,
                                            ),
                                          ],
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
                                top: size.height * 0.07,
                                bottom: size.height * 0.02,
                              ),
                              height: size.height * 0.28,
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
                                            size: 16,
                                            color: kblue,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          CustomSmallText(
                                            text: "Energy Charged",
                                            size: 12,
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
                                            size: 16,
                                            color: kblue,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          CustomSmallText(
                                            text: "KMS Driven",
                                            size: 12,
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
                                    ),
                                  ),
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
                preferredSize: Size.fromHeight(size.height * .14),
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
                        color: Color(0xff828282),
                      ),
                      height(size.height * .01),
                      Container(
                        height: size.height * .065,
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
            Get.toNamed(Routes.reservationPageRoute);
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
                    //TODO: use cached network image here
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
                  return Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: _tripsCard(),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _tripsCard() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.reservationPageRoute);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.04,
          top: size.height * 0.013,
          right: size.width * 0.02,
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
                blurRadius: 2,
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
                        color: Color(0xffFFE9E9),
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
            Icon(
              Icons.arrow_forward_ios,
              size: size.height * 0.032,
              color: Color(0xffBDBDBD),
            )
          ],
        ),
      ),
    );
  }
}
