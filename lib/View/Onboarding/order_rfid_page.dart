import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/order_rfid_controller.dart';
import 'package:freelancer_app/Controller/rfid_page_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';

import '../../Utils/routes.dart';
import '../../constants.dart';

class OrderRFIDScreen extends GetView<RfidPageController> {
  const OrderRFIDScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    print(size.width);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.09),
          child: AppBarwidget(),
        ),
        body: Column(
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
              height: size.height * 0.7,
              width: size.width,
              // color: Color(0xffF3F5F9),

              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: size.height * 0.48,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Color(0xff0047C2),
                          borderRadius: BorderRadius.vertical(
                              top: Radius.elliptical(
                                  MediaQuery.of(context).size.width * 4,
                                  300.0)),
                        ),
                      )),
                  Positioned(
                      top: size.height * 0.055,
                      left: size.width * 0.10,
                      right: size.width * 0.10,
                      child: Container(
                        height: size.height * 0.46,
                        width: size.width * 0.70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/goecpower.png"),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.065,
                              left: size.width * 0.04,
                              right: size.width * 0.04),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .06),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomBigText(
                                      text: "GO EC RFID",
                                      color: Color(0xff4F4F4F),
                                    ),
                                    Obx(
                                      () => CustomBigText(
                                        text:
                                            "₹ ${controller.rfid_price.value}",
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff219653),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: size.height * 0.1,
                      left: size.width * 0.1,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.rfidNumberRoute,
                          );
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
                                color: Color(0xff0047C3),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    bottom: size.height * 0.04,
                    left: size.width * 0.318,
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

  Widget no() {
    return Column(
      children: [
        Image.asset(
          "assets/images/goecpower.png",
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
