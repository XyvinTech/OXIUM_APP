import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/View/WalletPage/popup.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';
import '../Widgets/customText.dart';

class PopUpPage extends StatelessWidget {
  const PopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .062, vertical: size.height * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: SvgPicture.asset(
                              'assets/svg/arrow_back_ios.svg'))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: CustomBigText(
                              text: 'Topup Plans',
                              size: 18,
                              color: Color(0xff4F4F4F),
                              fontWeight: FontWeight.bold))),
                  width(size.width * 0.06)
                ],
              ),
              height(size.height * 0.04),
              InkWell(
                onTap: () {
                  Get.to(() => PopUp());
                },
                child: _topupCard(
                  title: "Mini top-up",
                  color: Color(0xff2F80ED),
                ),
              ),
              height(size.height * 0.02),
              InkWell(
                onTap: () {
                  Get.to(() => PopUp());
                },
                child: _topupCard(
                  title: "Normal top-up",
                  color: Color(0xffF2994A),
                ),
              ),
              height(size.height * 0.02),
              InkWell(
                child: _topupCard(
                  title: "Golden top-up",
                  color: Color(0xff2F80ED),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffCEAE65),
                      Color(0xffEEBC3D),
                      Color(0xffFAEDB6),
                      Color(0xffD2B269),
                      Color(0xffF0E6A8),
                    ],
                  ),
                  textColor: Color(0xff4F4F4F),
                ),
              ),
              height(size.height * 0.02),
              InkWell(
                child: _topupCard(
                  title: "Golden top-up",
                  color: Color(0xff2F80ED),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff3E3E3E),
                      Color(0xff969696),
                      Color(0xff666666),
                      Color(0xff929292),
                    ],
                  ),
                  textColor: Color(0xffF2F2F2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
              laterspacing: -0.0408,
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
                      laterspacing: -0.408,
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
                    laterspacing: -0.408,
                    color: Color(0xff0047C3),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
