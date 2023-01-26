import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/smartcharge_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class RFIDnumberScreen extends GetView<SmartChargeController> {
  const RFIDnumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        appBar: AppBar(
          backgroundColor: Color(0xffF5F9FF),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: size.width * 0.05,
              color: Color(0xff828282),
            ),
          ),
          centerTitle: true,
          title: CustomBigText(
            text: "RFID",
            size: 14,
            color: Color(0xff828282),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.055,
            right: size.width * 0.055,
            top: size.height * 0.020,
            bottom: size.height * 0.045,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: size.width * 0.04),
                        child: Container(
                          height: size.height * 0.25,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                                blurRadius: 34,
                                color: Color(0xff000000).withOpacity(0.06),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Expanded(child: Container()),
                            CustomSmallText(
                                text:
                                    "Lorem ipsum dolor sit amet, consectetur"),
                            CustomSmallText(
                                text: "adipiscing elit, sed do eiusmod tempor"),
                            SizedBox(
                              height: size.height * .03,
                            ),
                          ]),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              CustomSmallText(text: "RFID Number"),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                height: size.height * 0.055,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1,
                      color: Color(0xff0047C3).withOpacity(.25),
                    )),
                child: Center(
                  child: CustomSmallText(
                    color: Color(0xffEB5757),
                    text: "No RFID Found",
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                height: size.height * 0.075,
                width: size.width * 0.5,
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
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.09,
                    ),
                    Icon(
                      Icons.add,
                      size: size.width * 0.06,
                      color: Color(0xffD9D9D9),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    CustomBigText(
                      text: "Order RFID",
                      size: 16,
                      color: kwhite,
                    ),
                    SizedBox(
                      width: size.width * 0.06,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
