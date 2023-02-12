import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';
import '../../constants.dart';

class PopUp extends StatelessWidget {
  const PopUp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .062, vertical: size.height * .02),
        child: Column(
          children: [
            height(size.height * 0.02),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child:
                            SvgPicture.asset('assets/svg/arrow_back_ios.svg'))),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: CustomBigText(
                            text: 'Topup Plans',
                            size: 18,
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.bold))),
                width(size.width * 0.06),
              ],
            ),
            height(size.height * 0.05),
            Container(
              height: size.height * 0.11,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [Color(0xff414141), Color(0xff303030)])),
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.027,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSmallText(
                          text: "Blance Credits",
                          size: 13,
                          color: Color(0xffBDBDBD),
                        ),

                        // Text(
                        //   "₹ 12556",
                        //   style: TextStyle(
                        //     fontSize: 24,
                        //     fontWeight: FontWeight.bold,
                        //     color: Color(0xff00FF83),
                        //   ),
                        // ),
                        CustomBigText(
                          text: "₹ 12556",
                          size: 24,
                          color: Color(0xff00FFB3),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomBigText(
                          text: "21 Jun 2022",
                          size: 16,
                          color: Color(0xffF2F2F2),
                        ),
                        height(size.height * 0.005),
                        CustomSmallText(
                          text: "Expiry date",
                          size: 13,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            height(size.height * 0.04),
            InkWell(
              onTap: () {},
              child: _topupCard(
                title: "Mini top-up",
                color: Color(0xff2F80ED),
              ),
            ),
            Expanded(child: Container()),
            InkWell(onTap: () {}, child: _button("Add Credit")),
            height(size.height * 0.06)
          ],
        ),
      ),
    ));
  }

  _topupCard(
      {required String title,
      required Color color,
      Gradient? gradient,
      Color? textColor}) {
    return Container(
      height: size.height * 0.15,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.5,
          color: Color(0xffE0E0E0),
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * 0.04,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: color,
            ),
            child: CustomBigText(
              text: title,
              size: 12,
              letterspacing: -0.0408,
              color: textColor ?? Color(0xffF2F2F2),
            ),
          ),
          height(size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBigText(
                      text: "100 Coins",
                      color: Color(0xff0047C3),
                      letterspacing: -0.408,
                    ),
                    height(size.height * 0.002),
                    CustomSmallText(
                      text: "Added Expiry : 30 days",
                      size: 13,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.023),
                  child: CustomSmallText(
                    text: "₹ 2000",
                    size: 20,
                    letterspacing: -0.408,
                    color: Color(0xff0047C3),
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _button(String title) {
    return Container(
      height: size.height * 0.065,
      width: size.width * 0.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(73),
          color: Color(0xff0047C3),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 26,
              spreadRadius: 0,
              color: Color(0xff000000).withOpacity(.25),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.13),
        child: Row(
          children: [
            SizedBox(),
            Icon(
              Icons.add,
              size: size.width * 0.06,
              color: Color(0xffD9D9D9),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            CustomBigText(
              text: title,
              size: 16,
              color: kwhite,
            ),
          ],
        ),
      ),
    );
  }
}
