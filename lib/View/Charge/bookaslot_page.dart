import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:freelancer_app/Bindings/bookaslot_screen_binding.dart';
import 'package:freelancer_app/Controller/bookaslot_controller.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../Widgets/apptext.dart';
import '../Widgets/borderButton.dart';
import '../Widgets/button.dart';

class BookASlotScreen extends GetView<BookASlotScreenController> {
  BookASlotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDefaultHomePageBackgroundColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .04, vertical: size.height * .04),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(size.width * .03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: size.height * .01),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: size.width * 0.06,
                                    color: Color(0xff828282),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: size.width * 0.17,
                            // ),
                            CustomBigText(
                              text: "Book a Slot",
                              size: 14,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      height(size.height * .01),
                      Obx(() {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BorderButton(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .03,
                                  vertical: 6,
                                ),
                                backgroundColor:
                                    controller.isTodayButtonPress.value
                                        ? Const.activeDateBgtColor
                                        : Const.inactiveDateBgtColor,
                                borderColor: controller.isTodayButtonPress.value
                                    ? Const.activeDateTextColor
                                    : Const.inactiveDateBgtColor,
                                textColor: controller.isTodayButtonPress.value
                                    ? Const.activeDateTextColor
                                    : Const.inactiveDateTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                text:
                                    "${controller.today.day} ${DateFormat('MMM').format(controller.today)}",
                                onTap: () {
                                  controller.isTodayButtonPress.value = true;
                                  controller.id = (-1).obs;
                                }),
                            SizedBox(
                              width: 15,
                            ),
                            BorderButton(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .03,
                                  vertical: 6,
                                ),
                                backgroundColor:
                                    !controller.isTodayButtonPress.value
                                        ? Const.activeDateBgtColor
                                        : Const.inactiveDateBgtColor,
                                borderColor:
                                    !controller.isTodayButtonPress.value
                                        ? Const.activeDateTextColor
                                        : Const.inactiveDateBgtColor,
                                textColor: !controller.isTodayButtonPress.value
                                    ? Const.activeDateTextColor
                                    : Const.inactiveDateTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                text:
                                    "${controller.tomorrow.day} ${DateFormat('MMM').format(controller.tomorrow)}",
                                onTap: () {
                                  controller.isTodayButtonPress.value = true;
                                  controller.isTodayButtonPress.value = false;
                                  controller.id = (-1).obs;
                                }),
                          ],
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    // height: 300,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: GridView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                          childAspectRatio: 1.6,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var now = DateTime.now();
                          // DateTime(2022, 9, 1, 13, 59);

                          var time = 9 + index;
                          //condition is min 30 minutes before is available

                          return Obx(() {
                            bool condition = false;
                            //select today or tomorrow
                            if (controller.isTodayButtonPress.value) {
                              controller.daySelected = controller.weekDay;
                            } else {
                              controller.daySelected = controller.nextWeekDay;
                            }
                            //if comes from chat page
                            if (controller.isReschedule) {
                              // log(daySelected);
                              // log(condition.toString());
                              condition = (!controller
                                      .isTodayButtonPress.value ||
                                  (time > now.hour + 1) ||
                                  (time - now.hour == 1) && now.minute <= 30);
                            } else {
                              //if from login
                              condition = !controller
                                      .isTodayButtonPress.value ||
                                  (time > now.hour + 1) ||
                                  (time - now.hour == 1) && now.minute <= 30;
                            }

                            return InkWell(
                              onTap: () {
                                if (condition) controller.id.value = index;
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: controller.id.value == index
                                            ? Const.cardBorderActiveColor
                                            : Const.cardBorderColor,
                                        width: controller.id.value == index
                                            ? 1.5
                                            : 1),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: controller.isLoading.value
                                        ? Container(
                                            alignment: Alignment.center,
                                            child: CircularProgressIndicator(
                                              color: Colors.deepOrange,
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  color: controller.id.value ==
                                                          index
                                                      ? Const.activeCardBgColor
                                                      : Colors.white,
                                                  child: Center(
                                                    child: Text(
                                                      "${index > 3 ? (9 + index) % 12 : 9 + index}:00 ${index >= 3 ? "PM" : "AM"}",
                                                      style: controller
                                                                  .id.value ==
                                                              index
                                                          ? TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 18,
                                                              color: Const
                                                                  .cardBorderActiveColor,
                                                            )
                                                          : TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 18,
                                                              color: Const
                                                                  .inactiveDateTextColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Center(
                                                    child: Text(
                                                      condition
                                                          ? "Available"
                                                          : 'Not Available',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 11,
                                                        color: condition
                                                            ? Const
                                                                .availableTextColor
                                                            : Const
                                                                .notAvailableTextColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                color: !condition
                                                    ? Color.fromARGB(
                                                        25, 244, 67, 54)
                                                    : controller.id.value ==
                                                            index
                                                        ? Colors.white
                                                        : Const
                                                            .activeCardBgColor,
                                              )
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.id == -1) return;
                      appData.isReserved.value = true;
                      Get.back();
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        height: size.height * .07,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff0047C3)),
                          child: CustomText(
                            text: 'Reserve slot',
                            size: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
