import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/chargePage_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controller/loginpage_controller.dart';
import '../Widgets/appbutton.dart';

// ignore: must_be_immutable
class ChargeHistoryFilter extends GetView<ChargeScreenController> {
  final bool isWallet;
  ChargeHistoryFilter({super.key, required this.isWallet});

  //RxBool isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    // _showDatePicker() {
    //   showDateRangePicker(
    //       context: context,
    //       firstDate: DateTime.now(),
    //       lastDate: DateTime(2025));
    // }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        appBar: AppBar(
          title: CustomBigText(
            text: "Filter",
            color: const Color.fromARGB(255, 43, 43, 43),
          ),
          centerTitle: true,
          backgroundColor: kwhite,
          elevation: 00,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              CustomBigText(
                text: 'Payment Time',
                size: 15,
              ),
              SizedBox(height: size.height * 0.02),
              DateTimeField(
                  dateController: controller.startDate,
                  keyboardtype: TextInputType.none,
                  onChanged: (String) {},
                  color: Colors.grey,
                  hintText: 'dd/mm/yyyy',
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  )),
              CustomBigText(
                text: 'to',
                size: 14,
              ),
              DateTimeField(
                  dateController: controller.endDate,
                  keyboardtype: TextInputType.none,
                  onChanged: (String) {},
                  color: Colors.grey,
                  hintText: 'dd/mm/yyyy',
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  )),
              SizedBox(height: size.height * 0.03),
              Visibility(
                  visible: isWallet,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CustomBigText(text: "Payment Mode"),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              ChipOptions(name: "Admin Topup"),
                              ChipOptions(name: "Wallet Topup")
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            ChipOptions(name: "Charging Transactions"),
                          ],
                        ),
                        SizedBox(height: size.height * 0.05),
                        CustomBigText(text: "Payment Status"),
                        SizedBox(height: size.height * 0.02),
                        FittedBox(
                          child: Row(
                            children: [
                              ChipOptions(name: "Completed"),
                              ChipOptions(name: "Pending"),
                              ChipOptions(name: "Failed"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: size.height * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.02, right: size.width * 0.02),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.4,
                      child: StartedButton(
                        color: Colors.white,
                        text: "Clear Filer",
                        textColor: kOnboardingColors,
                        isIcon: false,
                        onTap: () {
                          // Get.back();
                          controller.clearFilter();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.02, right: size.width * 0.02),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.4,
                      child: StartedButton(
                        color: kOnboardingColors,
                        text: "Apply",
                        textColor: Colors.white,
                        isIcon: false,
                        onTap: () {
                          controller.applyFilter();
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DateTimeField extends GetView<LoginPageController> {
  final String hintText;
  final Widget icon;
  final TextInputType keyboardtype;
  final TextEditingController dateController;
  final void Function(String) onChanged;
  final void Function()? onTap;
  final Color color;
  DateTimeField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.keyboardtype,
      required this.dateController,
      required this.onChanged,
      required this.color,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _showDatePicker() {
      Get.dialog(CustomDateTimePicekr(
        controller: dateController,
      ));
    }

    size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.07,
          right: size.width * 0.07,
        ),
        height: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: color),
        ),
        child: CupertinoTextField(
          decoration: BoxDecoration(color: Colors.transparent),
          keyboardType: TextInputType.none,
          controller: dateController,
          onTapOutside: (event) {
            event.down;
          },
          onTap: _showDatePicker,
          //onTap: _showDatePicker(),
          suffix: icon,
          placeholder: hintText,
        ),
      ),
    );
  }
}

// Date Picker
class CustomDateTimePicekr extends StatelessWidget {
  const CustomDateTimePicekr({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
      DateTime.now(),
    ];
    List<String> days = ["San", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                    calendarViewMode: DatePickerMode.day,
                    selectedDayHighlightColor: kOnboardingColors,
                    selectedRangeHighlightColor: kOnboardingColors,
                    selectedRangeDayTextStyle:
                        TextStyle(color: kOnboardingColors),
                    selectedYearTextStyle: TextStyle(color: Colors.white),
                    weekdayLabelTextStyle: TextStyle(color: kOnboardingColors),
                    weekdayLabels: days,
                    selectedDayTextStyle: TextStyle(color: Colors.white)),
                value: _rangeDatePickerValueWithDefaultValue,
                onValueChanged: (dates) =>
                    _rangeDatePickerValueWithDefaultValue = dates,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 0),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.35,
                      child: StartedButton(
                        color: Colors.grey.shade300,
                        text: "Cancel",
                        textColor: Colors.black,
                        isIcon: false,
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 20.w),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.35,
                      child: StartedButton(
                        color: kOnboardingColors,
                        text: "Apply",
                        textColor: Colors.white,
                        isIcon: false,
                        onTap: () {
                          if (_rangeDatePickerValueWithDefaultValue.isNotEmpty)
                            controller.text = DateFormat('dd/MM/yyyy').format(
                                _rangeDatePickerValueWithDefaultValue.first!);
                          ;

                          Get.back();
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChipOptions extends StatelessWidget {
  final String name;
  const ChipOptions({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    RxBool isSelected = false.obs;
    return Obx(() => Padding(
          padding: const EdgeInsets.all(5),
          child: InputChip(
            labelPadding: EdgeInsets.only(
              left: isSelected.value ? 20 : 30,
              top: 5,
              bottom: 5,
            ),
            deleteIcon: isSelected.value
                ? Icon(
                    Icons.clear,
                    color: kOnboardingColors,
                  )
                : Center(),
            onDeleted: () => null,
            side:
                BorderSide(width: 2, color: Color.fromARGB(255, 203, 232, 255)),
            label: CustomBigText(
              text: name,
              size: 16,
              color: kOnboardingColors,
            ),
            selected: isSelected.value,
            onSelected: (value) => isSelected.value = value,
            selectedColor: Color.fromARGB(255, 203, 232, 255),
            backgroundColor: Colors.transparent,
            showCheckmark: false,
            disabledColor: Colors.white,
          ),
        ));
  }
}
