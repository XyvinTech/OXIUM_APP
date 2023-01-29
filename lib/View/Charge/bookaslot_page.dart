import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freelancer_app/Bindings/bookaslot_screen_binding.dart';
import 'package:freelancer_app/Controller/bookaslot_controller.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:get/get.dart';

class RescheduleScreen extends GetView<BookASlotScreenController> {
  RescheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                //
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 65),
                      child: Column(
                        children: [
                          
                          Obx(() {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BorderButton(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 6,
                                    ),
                                    backgroundColor:
                                        controller.isTodayButtonPress.value
                                            ? Const.activeDateBgtColor
                                            : Const.inactiveDateBgtColor,
                                    borderColor:
                                        controller.isTodayButtonPress.value
                                            ? Const.activeDateTextColor
                                            : Const.inactiveDateBgtColor,
                                    textColor:
                                        controller.isTodayButtonPress.value
                                            ? Const.activeDateTextColor
                                            : Const.inactiveDateTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    text:
                                        "${controller.today.day} ${DateFormat('MMM').format(controller.today)}",
                                    onTap: () {
                                      controller.isTodayButtonPress.value =
                                          true;
                                      controller.id = (-1).obs;
                                    }),
                                SizedBox(
                                  width: 15,
                                ),
                                BorderButton(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24,
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
                                    textColor:
                                        !controller.isTodayButtonPress.value
                                            ? Const.activeDateTextColor
                                            : Const.inactiveDateTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    text:
                                        "${controller.tomorrow.day} ${DateFormat('MMM').format(controller.tomorrow)}",
                                    onTap: () {
                                      controller.isTodayButtonPress.value =
                                          true;
                                      controller.isTodayButtonPress.value =
                                          false;
                                      controller.id = (-1).obs;
                                    }),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      // height: 300,
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 65, vertical: 10),
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                            childAspectRatio: 1.5,
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

                                if (controller.timeSlots == null) {
                                  //if time slot is null do nothing
                                } else if (controller
                                        .timeSlots[controller.daySelected] !=
                                    null) {
                                  // log(index.toString());
                                  // log(controller
                                  //     .timeSlots[controller.daySelected]
                                  //         [index.toString()]
                                  //     .toString());
                                  if (controller.timeSlots[controller
                                              .daySelected][index.toString()] !=
                                          null &&
                                      controller
                                              .timeSlots[controller.daySelected]
                                                  [index.toString()]
                                              .millisecondsSinceEpoch <
                                          Timestamp.now()
                                              .millisecondsSinceEpoch) {
                                    // log('condition');
                                    condition = true;
                                  }
                                }
                                // log(condition.toString());
                                condition = condition &&
                                    (!controller.isTodayButtonPress.value ||
                                        (time > now.hour + 1) ||
                                        (time - now.hour == 1) &&
                                            now.minute <= 30);
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
                                                        ? Const
                                                            .activeCardBgColor
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: 56,
                      child: Button(
                          text: "Submit".toUpperCase(),
                          onTap: () async {
                            // if (appData.phone.isEmpty) {
                            //   Get.offAllNamed(Routes.loginPageRoute);
                            //   return;
                            // }
                            if (controller.id < 0) {
                              //TODO: alert dialog used by amir
                              log('select at least one slot');
                              showToasT('Please select at least one slot');
                              return;
                            }
                            if (controller.isReschedule)
                              await FirebaseRepo().rescheduleWithCouncilor(
                                  controller, controller.councilorModel.uid!);
                            else
                              await FirebaseRepo()
                                  .findBestCouncilor(controller);
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
