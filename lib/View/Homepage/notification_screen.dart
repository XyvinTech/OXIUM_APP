import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/notification_screen_controller.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/cached_network_image.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
            child: Obx(
              () => controller.modelList.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: CustomText(text: 'Notification is empty'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.modelList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            // height: size.height * .3,
                            // width: size.width * .90,

                            margin: EdgeInsets.symmetric(
                                vertical: size.height * .01,
                                horizontal: size.width * .035),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: Column(
                              children: [
                                if (controller
                                    .modelList[index].imageUrl.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    child: CachedNetworkImage(
                                      imageUrl: controller
                                    .modelList[index].imageUrl,
                                      height: 200.h,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * .02,
                                      horizontal: size.width * .03),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/green_bolt.svg'),
                                        width(size.width * .02),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomText(
                                                  text: controller
                                                      .modelList[index].title,
                                                  size: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff4F4F4F)),
                                              height(size.height * .02),
                                              CustomText(
                                                  text: controller
                                                      .modelList[index].body,
                                                  // text: '',
                                                  size: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff828282)),
                                              height(size.height * .02),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomText(
                                                      text: DateFormat(
                                                              'dd.mm.yyyy')
                                                          .format(DateTime.parse(
                                                                  controller
                                                                      .modelList[
                                                                          index]
                                                                      .timestamp)
                                                              .toLocal()),
                                                      size: 10,
                                                      color: Color(0xffBDBDBD)),
                                                  CustomText(
                                                      text: DateFormat()
                                                          .add_jm()
                                                          .format(DateTime.parse(
                                                                  controller
                                                                      .modelList[
                                                                          index]
                                                                      .timestamp)
                                                              .toLocal()),
                                                      size: 10,
                                                      color: Color(0xffBDBDBD)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ));
                      }),
            ),
          ),
        ])));
  }
}
