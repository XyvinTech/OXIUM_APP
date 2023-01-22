import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';

class ChargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 3, vsync: this);
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.055,
              right: size.width * 0.055,
              top: size.height * 0.020,
              bottom: size.height * 0.04,
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
                  height: size.height * 0.02,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelColor: kblue,
                        controller: tabController,
                        onTap: (value) {},
                        tabs: [
                          Tab(
                            child: Container(
                              height: size.height * 0.03,
                              width: size.width * 0.17,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(42),
                                color: Color(0xffDEEAFF),
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
                              height: size.height * 0.03,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(42),
                                color: Color(0xffDEEAFF),
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
                              height: size.height * 0.03,
                              width: size.width * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(42),
                                color: Color(0xffDEEAFF),
                              ),
                              child: Center(
                                  child: CustomSmallText(
                                text: "Trips",
                                size: 14,
                                color: kblue,
                              )),
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(controller: tabController, children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.08,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff333333),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.04,
                                      top: size.height * 0.01,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomBigText(
                                          text: "Scan and Charge",
                                          size: 16,
                                          color: kwhite,
                                        ),
                                        CustomSmallText(
                                          text:
                                              "Scan and charge for awail neew",
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
                            )
                          ],
                        ),
                      ),
                      Text("done"),
                      Text("done"),
                    ]),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
