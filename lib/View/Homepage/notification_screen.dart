import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/notification_screen_controller.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NotificationScreen extends GetView<NotificationScreenController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffF0F1F6),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .062, vertical: size.height * .03),
              child: Row(
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
                          child: CustomText(
                              text: 'Notifications',
                              size: 14,
                              color: Color(0xff828282),
                              fontWeight: FontWeight.bold))),
                  width(24)
                ],
              )),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.modelList.length,
                itemBuilder: (context, index) {
                  return Container(
                      // height: size.height * .3,
                      // width: size.width * .90,
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * .02,
                          horizontal: size.width * .03),
                      margin: EdgeInsets.symmetric(
                          vertical: size.height * .01,
                          horizontal: size.width * .035),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/svg/green_bolt.svg'),
                            width(size.width * .02),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: controller.modelList[index].title,
                                      size: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff4F4F4F)),
                                  height(size.height * .02),
                                  CustomText(
                                      text:
                                          controller.modelList[index].subtitle,
                                      // text: '',
                                      size: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff828282)),
                                  height(size.height * .02),
                                  if (!controller
                                      .modelList[index].isDisconnected)
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: size.height * .04,
                                        width: size.width * .4,
                                        child: CustomText(
                                            text: 'Disconnect Charger',
                                            size: 12,
                                            color: Color(0xff0047C3),
                                            fontWeight: FontWeight.bold),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Color(0xff0047C3),
                                              width: .8),
                                        ),
                                      ),
                                    ),
                                  // height(size.height * .012),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: CustomText(
                                        text: '03 : 15 PM',
                                        size: 10,
                                        color: Color(0xffBDBDBD)),
                                  )
                                ],
                              ),
                            ),
                          ]));
                }),
          ),
        ])));
  }
}
