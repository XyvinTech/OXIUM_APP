import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class CardTrip extends StatelessWidget {
  const CardTrip({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              height(size.height * 0.1),
              _tripCard(),
              height(size.height * 0.1),
              _tripNameCard(),
              height(size.height * 0.1),
              _trip01Card(),
              height(size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tripCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.height * 0.02),
        height: size.height * 0.215,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xff000000).withOpacity(.12)),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/ev_charger.svg"),
                    width(size.width * 0.02),
                    CustomBigText(
                      text: "Reservation",
                      size: 12,
                      color: Color(
                        0xff0047C3,
                      ),
                      letterspacing: -0.408,
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/conversation_path.svg"),
                    width(size.width * 0.02),
                    CustomSmallText(
                      text: "Route via Adimali",
                      size: 12,
                      letterspacing: -0.408,
                    )
                  ],
                )
              ],
            ),
            height(size.height * 0.02),
            Row(
              children: [
                CustomBigText(
                  text: "2 hr 17 min",
                  size: 20,
                  color: Color(0xff27AE60),
                ),
                width(size.width * 0.015),
                CustomSmallText(
                  text: "( 324 KMS )",
                  size: 14,
                ),
              ],
            ),
            height(size.height * 0.025),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * .45,
                    decoration: BoxDecoration(
                      color: Color(0xff0047C3),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 11),
                          blurRadius: 22,
                          color: Color(0xff000000).withOpacity(0.21),
                        )
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/route.svg"),
                        width(size.width * 0.04),
                        CustomBigText(
                          text: "Start your Trip",
                          size: 14,
                          color: Color(0xffDEEAFF),
                        ),
                      ],
                    ),
                  ),
                ),
                width(size.width * 0.13),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/bookmark.svg"),
                      width(size.width * 0.015),
                      CustomBigText(
                        text: "Save",
                        size: 16,
                        color: Color(0xff0047C3),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _tripNameCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.02),
        height: size.height * .45,
        width: size.width,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xff000000).withOpacity(.12)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSmallText(
              text: "Name Your Trip",
              size: 11,
              letterspacing: -0.32,
            ),
            height(size.height * 0.007),
            Container(
              height: size.height * 0.06,
              width: size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffF2F2F2),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.04),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Trip Name",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffBDBDBD),
                    ),
                  ),
                ),
              ),
            ),
            height(size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/ev_charger.svg"),
                    width(size.width * 0.015),
                    CustomBigText(
                      text: "Reservation",
                      size: 12,
                      color: Color(
                        0xff0047C3,
                      ),
                      letterspacing: -0.408,
                    )
                  ],
                ),
                CustomSmallText(
                  text: "324 KMS",
                  size: 11,
                )
              ],
            ),
            height(size.height * 0.025),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.008),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/adjust1.svg"),
                  width(size.width * 0.015),
                  CustomSmallText(
                    text: "Starting Point",
                    size: 12,
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
                  CustomSmallText(
                    text: "Ending Point",
                    size: 12,
                    letterspacing: -0.408,
                  )
                ],
              ),
            ),
            height(size.height * 0.004),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomBigText(
                text: "S4 Bt , Elam Street , Jarkhand",
                size: 14,
                color: Color(0xff4F4F4F),
                letterspacing: -0.408,
              ),
            ),
            height(size.height * 0.04),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * .4,
                    decoration: BoxDecoration(
                      color: Color(0xff0047C3),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 11),
                          blurRadius: 22,
                          color: Color(0xff000000).withOpacity(0.21),
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/bookmark.svg",
                            color: Color(0xffF2F2F2),
                          ),
                          width(size.width * 0.015),
                          CustomBigText(
                            text: "Save",
                            size: 16,
                            color: Color(0xffF2F2F2),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                width(size.width * 0.13),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/delete.svg"),
                    width(size.width * 0.015),
                    CustomBigText(
                      text: "Discard",
                      size: 16,
                      color: Color(0xffEB5757),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _trip01Card() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.02),
        height: size.height * .38,
        width: size.width,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xff000000).withOpacity(.12)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/conversation_path.svg",
                  color: Color(0xffF2994A),
                  height: size.height * 0.02,
                  width: size.width * 0.04,
                ),
                width(size.width * 0.01),
                CustomBigText(
                  text: "Trip 01",
                  size: 16,
                )
              ],
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
                      text: "Reservation",
                      size: 12,
                      color: Color(
                        0xff0047C3,
                      ),
                      letterspacing: -0.408,
                    )
                  ],
                ),
                CustomSmallText(
                  text: "324 KMS",
                  size: 11,
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
                    size: 12,
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
                  CustomSmallText(
                    text: "Ending Point",
                    size: 12,
                    letterspacing: -0.408,
                  )
                ],
              ),
            ),
            height(size.height * 0.004),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomBigText(
                text: "S4 Bt , Elam Street , Jarkhand",
                size: 14,
                color: Color(0xff4F4F4F),
                letterspacing: -0.408,
              ),
            ),
            height(size.height * 0.04),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.025),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * .4,
                      decoration: BoxDecoration(
                        color: Color(0xff39FF8E).withOpacity(.23),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: size.width * 0.015),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/check.svg",
                            ),
                            width(size.width * 0.015),
                            CustomBigText(
                              text: "Saved",
                              size: 16,
                              color: Color(0xff219653),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                width(size.width * 0.07),
                CustomBigText(
                  ontap: () {},
                  text: "Back to Trips",
                  size: 16,
                  color: Color(0xff0047C3),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


}
