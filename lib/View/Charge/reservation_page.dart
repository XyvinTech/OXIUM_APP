import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/reservation_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class ReservationScreen extends GetView<ReservationScreenController> {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              height: size.height * 0.75,
              width: size.width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kwhite,
                  boxShadow: [
                    BoxShadow(
                      offset: (Offset(0, 4)),
                      spreadRadius: 0,
                      blurRadius: 32,
                      color: Color(0xff000000).withOpacity(0.06),
                    )
                  ]),
              child: Column(
                children: [
                  _reservationAppBar(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        _detailsSection(),
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        _reservationTime(),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        _jeepModel(),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        _carDCdetails(),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        _reservationButton(),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: CustomBigText(
                                text: "Back to Reservation",
                                size: 14,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget _reservationAppBar() {
    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: Color(0xffDEEAFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.07),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: size.width * 0.05,
                color: Color(0xff828282),
              ),
            ),
            SizedBox(
              width: size.width * 0.17,
            ),
            CustomBigText(
              text: "Reservation 3245",
              size: 14,
            )
          ],
        ),
      ),
    );
  }

  Widget _detailsSection() {
    return Container(
      child: Row(
        children: [
          Image.asset(
            "assets/images/coffee.png",
            height: size.height * 0.085,
            width: size.width * 0.19,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomBigText(
                    text: "Calista Cafe",
                    size: 16,
                    color: Color(0xff4F4F4F),
                  ),
                  SizedBox(
                    width: size.width * 0.015,
                  ),
                  CustomSmallText(
                    text: "13 km Away",
                    size: 12,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.006,
              ),
              Row(
                children: [
                  Icon(
                    (Icons.wc_outlined),
                    size: size.width * 0.04,
                    color: Color(0xff828282),
                  ),
                  SizedBox(
                    width: size.width * 0.015,
                  ),
                  CustomSmallText(
                    text: "Rest Room",
                    size: 12,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Icon(
                    (Icons.hotel_outlined),
                    size: size.width * 0.04,
                    color: Color(0xff828282),
                  ),
                  SizedBox(
                    width: size.width * 0.015,
                  ),
                  CustomSmallText(
                    text: "Hotel",
                    size: 12,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Icon(
                    (Icons.local_cafe_outlined),
                    size: size.width * 0.04,
                    color: Color(0xff828282),
                  ),
                  SizedBox(
                    width: size.width * 0.015,
                  ),
                  CustomSmallText(
                    text: "Cafe",
                    size: 12,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              CustomSmallText(
                text: "Mannampatta . Near Govt ",
                size: 12,
                color: Color(0xff4F4F4F),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _reservationTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSmallText(
          text: "Reservation Time :",
          size: 16,
          color: kblack,
        ),
        CustomSmallText(
          text: "10:00 AM",
          size: 16,
          color: kblack,
        ),
      ],
    );
  }

  Widget _jeepModel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * .045),
      height: size.height * 0.085,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Color(0xff0047C3).withOpacity(0.6),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/jeep1.png",
            height: size.height * 0.06,
            width: size.width * 0.17,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02, right: size.width * 0.015),
            child: Column(
              children: [
                CustomSmallText(
                  text: "Jeep",
                  size: 12,
                ),
                CustomBigText(
                  text: "RUBICON",
                  size: 15,
                  color: Color(0xff4F4F4F),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _carDCdetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBigText(
          text: "DC 34 kWh",
          size: 14,
          color: Color(0xff4F4F4F),
        ),
        Row(
          children: [
            CustomBigText(
              text: "Type 2",
              size: 14,
              color: Color(0xff4F4F4F),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/icon1.png",
                  height: size.height * 0.02,
                  width: size.width * 0.045,
                ),
                Image.asset(
                  "assets/images/icon2.png",
                  height: size.height * 0.015,
                  width: size.width * 0.045,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _reservationButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: AppButton(
          text: "Scan and Charge",
          color: Color(0xff0047C3),
          sizeheight: size.height * 0.07),
    );
  }
}
