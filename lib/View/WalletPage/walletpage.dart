import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends GetView<WalletPageController> {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF5F9FF),
          body: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: kwhite,
                expandedHeight: size.height * 0.66,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height * 0.58,
                            width: size.width,
                            color: Color(0xffF5F9FF),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.46,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    Color(0xff4F4F4F),
                                    Color(0xff202020),
                                  ])),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: SvgPicture.asset(
                                            "assets/svg/g1.svg"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: size.width * 0.44,
                            top: size.height * 0.04,
                            child: CustomBigText(
                              text: "Wallet",
                              color: Color(0xffF2F2F2),
                              size: 18,
                            ),
                          ),
                          Positioned(
                            left: size.width * 0.11,
                            top: size.height * 0.12,
                            child: SvgPicture.asset("assets/svg/goeclogo.svg"),
                          ),
                          Positioned(
                            right: size.width * 0.11,
                            top: size.height * 0.11,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomBigText(
                                  text: "324",
                                  size: 18,
                                  color: Color(0xffF2F2F2),
                                ),
                                height(size.height * 0.003),
                                CustomSmallText(
                                  text: "No of Charges",
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            right: size.width * 0.11,
                            top: size.height * 0.23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomBigText(
                                  text: "21 Jun 2022",
                                  size: 18,
                                  color: Color(0xffF2F2F2),
                                ),
                                height(size.height * 0.003),
                                CustomSmallText(
                                  text: "Expiry date",
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: size.width * 0.11,
                            top: size.height * 0.23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSmallText(
                                  text: "Balance Credits",
                                ),
                                height(size.height * 0.003),
                                CustomBigText(
                                  text: "₹ 12556",
                                  size: 26,
                                  color: Color(0xff00FFB3),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: size.height * 0.025,
                            left: size.width * 0.04,
                            child: _walletCard(
                                title: "TopUp",
                                assets: "assets/svg/circledoller.svg",
                                color: Color(0xff0047C3),
                                shadowColor: Color(0xff000000).withOpacity(.33),
                                textColor: Color(0xff00FFB3)),
                          ),
                          Positioned(
                            bottom: size.height * 0.025,
                            right: size.width * 0.04,
                            child: _walletCard(
                                title: "Scan Code",
                                assets: "assets/svg/qr_code.svg",
                                color: kwhite,
                                shadowColor: Color(0xff000000).withOpacity(.06),
                                textColor: Color(0xff0047C3)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(size.height * 0.1),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.006,
                        width: size.width * 0.35,
                        color: Color(0xffE0E0E0),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      CustomBigText(
                        text: "Payments",
                        size: 14,
                        color: Color(0xff828282),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    height(size.height * 0.01),
                    Container(
                      height: 1000,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: size.width * .92,
                              child: ListView.builder(
                                  itemCount: 40,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: size.height * 0.01),
                                      child: Container(
                                        height: size.height * 0.08,
                                        decoration: BoxDecoration(
                                            color: kwhite,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 4),
                                                  blurRadius: 32,
                                                  spreadRadius: 0,
                                                  color: Color(0xff000000)
                                                      .withOpacity(.08))
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: size.height * 0.05,
                                                    width: size.width * 0.12,
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(
                                                        "assets/images/coffee1.png",
                                                      ),
                                                    ),
                                                  ),
                                                  width(size.width * 0.03),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: size.height *
                                                            0.015),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomSmallText(
                                                          text: "Calista Cafe",
                                                          laterspacing: -0.408,
                                                          size: 16,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              "assets/svg/calendar_month.svg",
                                                              width:
                                                                  size.width *
                                                                      0.045,
                                                            ),
                                                            width(size.width *
                                                                0.01),
                                                            CustomSmallText(
                                                              text:
                                                                  "12 Jun 2022 at 03:30 PM",
                                                              size: 12,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CustomBigText(
                                                    text: "+500 Cr",
                                                    size: 16,
                                                    color: Color(0xff27AE60),
                                                  ),
                                                  width(size.width * 0.03),
                                                  SvgPicture.asset(
                                                      "assets/svg/arrow_forward_ios.svg")
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _walletCard(
      {required String title,
      required String assets,
      required Color color,
      required Color shadowColor,
      required Color textColor}) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              spreadRadius: 0,
              color: shadowColor,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assets),
          height(size.height * 0.01),
          CustomBigText(
            text: title,
            size: 14,
            color: textColor,
          )
        ],
      ),
    );
  }

  Widget _Charger() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: size.height * 0.58,
              width: size.width,
              color: Color(0xffF5F9FF),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.46,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xff4F4F4F),
                      Color(0xff202020),
                    ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: SvgPicture.asset("assets/svg/g1.svg"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: size.width * 0.44,
              top: size.height * 0.04,
              child: CustomBigText(
                text: "Wallet",
                color: Color(0xffF2F2F2),
                size: 18,
              ),
            ),
            Positioned(
              left: size.width * 0.11,
              top: size.height * 0.12,
              child: SvgPicture.asset("assets/svg/goeclogo.svg"),
            ),
            Positioned(
              right: size.width * 0.11,
              top: size.height * 0.11,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomBigText(
                    text: "324",
                    size: 18,
                    color: Color(0xffF2F2F2),
                  ),
                  height(size.height * 0.003),
                  CustomSmallText(
                    text: "No of Charges",
                  )
                ],
              ),
            ),
            Positioned(
              right: size.width * 0.11,
              top: size.height * 0.23,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomBigText(
                    text: "21 Jun 2022",
                    size: 18,
                    color: Color(0xffF2F2F2),
                  ),
                  height(size.height * 0.003),
                  CustomSmallText(
                    text: "Expiry date",
                  )
                ],
              ),
            ),
            Positioned(
              left: size.width * 0.11,
              top: size.height * 0.23,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSmallText(
                    text: "Balance Credits",
                  ),
                  height(size.height * 0.003),
                  CustomBigText(
                    text: "₹ 12556",
                    size: 26,
                    color: Color(0xff00FFB3),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: size.height * 0.025,
              left: size.width * 0.04,
              child: _walletCard(
                  title: "TopUp",
                  assets: "assets/svg/circledoller.svg",
                  color: Color(0xff0047C3),
                  shadowColor: Color(0xff000000).withOpacity(.33),
                  textColor: Color(0xff00FFB3)),
            ),
            Positioned(
              bottom: size.height * 0.025,
              right: size.width * 0.04,
              child: _walletCard(
                  title: "Scan Code",
                  assets: "assets/svg/qr_code",
                  color: kwhite,
                  shadowColor: Color(0xff000000).withOpacity(.06),
                  textColor: Color(0xff0047C3)),
            ),
          ],
        ),
        Expanded(
            child: Container(
          color: kblue,
        ))
      ],
    );
  }
}
