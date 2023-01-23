import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/bottom_nav_screen_controller.dart';
import 'package:freelancer_app/Controller/chargePage_controller.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class ChargeScreen extends GetView<ChargeScreenController> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.055,
                right: size.width * 0.055,
                top: size.height * 0.020,
                bottom: size.height * 0.02,
              ),
              child: Container(
                height: size.height * 0.377,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.08,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            Image.asset(
                              "assets/images/refresh.png",
                              height: size.height * 0.025,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: size.height * 0.07,
                        bottom: size.height * 0.02,
                      ),
                      height: size.height * 0.27,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Expanded(
                child: Container(
              color: kwhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Obx(
                    () => Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelColor: kblue,
                          controller: controller.tabController,
                          indicatorColor: kwhite,
                          onTap: (index) {
                            controller.IsTabIndex.value = index;
                            print(controller.IsTabIndex);
                          },
                          tabs: [
                            Tab(
                              child: Container(
                                height: size.height * 0.035,
                                width: size.width * 0.19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(42),
                                  color: controller.IsTabIndex == 0
                                      ? Color(0xffDEEAFF)
                                      : kwhite,
                                ),
                                child: Center(
                                    child: CustomSmallText(
                                  text: "Charge",
                                  size: 14,
                                  color: kblue,
                                )),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: size.height * 0.038,
                                width: size.width * 0.38,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(42),
                                  color: controller.IsTabIndex == 1
                                      ? Color(0xffDEEAFF)
                                      : kwhite,
                                ),
                                child: Center(
                                    child: CustomSmallText(
                                  text: "Reservations",
                                  size: 14,
                                  color: kblue,
                                )),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: size.height * 0.035,
                                width: size.width * 0.16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(42),
                                  color: controller.IsTabIndex == 2
                                      ? Color(0xffDEEAFF)
                                      : kwhite,
                                ),
                                child: Center(
                                    child: CustomSmallText(
                                  text: "Trips",
                                  size: 14,
                                  color: kblue,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                            _chargeTab(),
                            _reservationsTab(),
                            _tripsTab(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
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
            height: size.height * 0.1,
            width: size.width * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff333333),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    top: size.height * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: size.height * 0.05,
                  width: size.width * 0.15,
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
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.03,
        top: size.height * 0.015,
        bottom: size.height * 0.015,
        right: size.width * 0.03,
      ),
      height: size.height * 0.09,
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
    );
  }

  Widget _reservationsTab() {
    return Container(
      child: Column(
        children: [
          Container(
            height: size.height * 0.32,
            child: ListView.builder(
                itemCount: 40,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    child: InkWell(
                      onTap: () {},
                      child: _reverstaionsCard(),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _reverstaionsCard() {
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.04,
        top: size.height * 0.01,
        right: size.width * 0.02,
      ),
      height: size.height * 0.106,
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
                height: size.height * 0.01,
              ),
              CustomSmallText(
                text: "Vaitilla , Ernakulam , Kerala",
                size: 12,
              ),
              SizedBox(
                height: size.height * 0.01,
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
    );
  }

  Widget _tripsTab() {
    return Container(
      child: Column(
        children: [
          Container(
            height: size.height * 0.32,
            child: ListView.builder(
                itemCount: 40,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: InkWell(
                      onTap: () {},
                      child: _tripsCard(),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _tripsCard() {
    return Container(
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
    );
  }
}
