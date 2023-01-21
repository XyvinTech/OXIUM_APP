import 'package:flutter/material.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';

import '../../Utils/routes.dart';
import '../../constants.dart';
import '../Widgets/appbar.dart';

class SmartChargeScreen extends StatelessWidget {
  const SmartChargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.09),
          child: AppBarwidget(),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.020,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.055,
                      right: size.width * 0.055,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomBigText(
                          text: "GO EC Smart Charge RFID",
                          color: Color(0xff4F4F4f),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        CustomSmallText(text: "GO EC RFID make your charging"),
                        CustomSmallText(text: "much easier"),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.724,
                width: size.width,
                // color: Color(0xffF3F5F9),

                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        child: Container(
                          height: size.height * 0.47,
                          width: size.width,
                          color: Color(0xff0047C2),
                        )),
                    Positioned(
                        top: size.height * 0.055,
                        left: size.width * 0.17,
                        child: Container(
                          height: size.height * 0.452,
                          width: size.width * 0.67,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/key.png",
                                height: size.height * 0.34,
                                width: size.width * 0.67,
                              ),
                              Container(
                                height: size.height * 0.11,
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/sub.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomBigText(text: "GO EC RFID"),
                                    CustomBigText(
                                      text: "₹ 399",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff219653),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: size.height * 0.1,
                        left: size.width * 0.1,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.rfidNumberRoute);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.1),
                            width: size.width * 0.8,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(65),
                              color: Color(0xff00FFB3),
                            ),
                            child: Center(
                              child: Text(
                                "Order RFID",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffF2F2F2),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      bottom: size.height * 0.04,
                      left: size.width * 0.37,
                      child: InkWell(
                        onTap: (() {
                          Get.offAllNamed(Routes.homePageRoute);
                        }),
                        child: Row(
                          children: [
                            CustomBigText(
                              text: "Register RFID later",
                              color: Color(0xff00FFB3),
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: size.width * 0.05,
                              color: Color(0xff00FFB3),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget AppBarwidget() {
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.055,
        right: size.width * 0.055,
      ),
      height: size.height * 0.09,
      color: Color(0xffF3F5F9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/bluelogo.png",
                height: size.height * 0.065,
                width: size.width * 0.17,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
