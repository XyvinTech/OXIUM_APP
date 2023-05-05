import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/WalletPage/topup_page.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Singletones/app_data.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with AutomaticKeepAliveClientMixin {
  WalletPageController controller = Get.find();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: kwhite,
              expandedHeight: size.height * 0.66 + 0 * controller.reload.value,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
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
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                      Color(0xff202020),
                                      Color(0xff4F4F4F),
                                    ])),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        child: SvgPicture.asset(
                                            "assets/svg/g1.svg"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.44,
                          top: size.height * 0.02,
                          child: SafeArea(
                            child: CustomBigText(
                              text: "Wallet",
                              color: Color(0xffF2F2F2),
                              size: 18,
                            ),
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
                            child: CustomBigText(
                              text: '₹ 1 = 1 Coins',
                              color: Color(0xffF2F2F2),
                            )
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     CustomBigText(
                            //       text:
                            //           "${appData.userModel.value.total_sessions}",
                            //       size: 18,
                            //       color: Color(0xffF2F2F2),
                            //     ),
                            //     height(size.height * 0.003),
                            //     CustomSmallText(
                            //       text: "No of Charges",
                            //     )
                            //   ],
                            // ),
                            ),
                        Positioned(
                          right: size.width * 0.11,
                          top: size.height * 0.23,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomBigText(
                                text:
                                    "${appData.userModel.value.total_sessions}",
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
                          left: size.width * 0.11,
                          top: size.height * 0.23,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSmallText(
                                text: "Balance Credits",
                              ),
                              height(size.height * 0.003),
                              Obx(
                                () => CustomBigText(
                                  text:
                                      "₹ ${appData.userModel.value.balanceAmount.toStringAsFixed(2)}",
                                  size: 26,
                                  color: Color(0xff00FFB3),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: size.height * 0.083,
                          left: size.width * .02,
                          right: size.width * .02,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => PopUpPage());
                            },
                            child: _walletCard(
                                title: "TopUp",
                                assets: "assets/svg/circledoller.svg",
                                color: Color(0xff0047C3),
                                shadowColor: Color(0xff000000).withOpacity(.33),
                                textColor: Color(0xff00FFB3)),
                          ),
                        ),
                        // Positioned(
                        //   bottom: size.height * 0.025,
                        //   right: size.width * 0.04,
                        //   child: _walletCard(
                        //       title: "Scan Code",
                        //       assets: "assets/svg/qr_code.svg",
                        //       color: kwhite,
                        //       shadowColor: Color(0xff000000).withOpacity(.06),
                        //       textColor: Color(0xff0047C3)),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(size.height * 0.1),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.008,
                        width: size.width * 0.34,
                        decoration: BoxDecoration(
                            color: Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(10)),
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
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    height(size.height * 0.01),
                    Container(
                      height: 1000,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              // width: size.width * .92,
                              padding: EdgeInsets.only(top: size.height * .01),
                              child: ListView.builder(
                                  itemCount: 40,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * .03,
                                          vertical: size.height * .01),
                                      child: InkWell(
                                        onTap: () {
                                          Get.dialog(
                                            _dialougebox(
                                              title: "Calista Cafe",
                                              amount: "+500 Cr",
                                              amountColor: Color(0xff27AE60),
                                            ),
                                          );

                                          // wallet loss credit dialogue

                                          //            Get.dialog(
                                          //   _dialougebox(
                                          //     title: "Wallet Credit",
                                          //     amount: "-500 Cr",
                                          //     amountColor: Color(0xffEB5757),
                                          //   ),
                                          // );
                                        },
                                        child: _creditCard(
                                            title: "Calista Cafe",
                                            date: "12 Jun 2022",
                                            time: "03:30 PM",
                                            amount: "+500 Cr"),
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
              ),
            )
          ],
        ));
  }

  Widget _walletCard(
      {required String title,
      required String assets,
      required Color color,
      required Color shadowColor,
      required Color textColor}) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              spreadRadius: 0,
              color: shadowColor,
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assets,
            width: 30.h,
          ),
          width(size.width * 0.025),
          CustomBigText(
            text: title,
            size: 14,
            color: textColor,
          )
        ],
      ),
    );
  }

  Widget _creditCard({
    required String title,
    required String date,
    required String time,
    required String amount,
  }) {
    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                spreadRadius: 0,
                color: Color(0xff000000).withOpacity(.08))
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.12,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/coffee1.png",
                    ),
                  ),
                ),
                width(size.width * 0.03),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.015),
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
                            text: "${date} at ${time}",
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
                  text: amount,
                  size: 16,
                  color: Color(0xff27AE60),
                ),
                width(size.width * 0.03),
                SvgPicture.asset("assets/svg/arrow_forward_ios.svg")
              ],
            )
          ],
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
                      children: [
                        CustomSmallText(
                          text: "Amount(in coins)",
                          size: 12,
                        ),
                        height(size.height * 0.004),
                        CustomBigText(
                          text: amount,
                          color: amountColor,
                          size: 24,
                          fontWeight: FontWeight.w500,
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
}
