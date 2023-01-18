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
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          elevation: 0,
          leading: Icon(
            Icons.arrow_back,
            size: size.width,
            color: Color(0xffD9D9D9),
          ),
          title: CustomBigText(
            text: "RFID",
            size: 14,
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
              Container(
                height: size.height * 0.4,
                width: size.width * 0.7,
                child: ListView.builder(itemBuilder: (_, index) {
                  return Container(
                    height: size.height * 0.35,
                    width: size.width * 0.65,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                          blurRadius: 32,
                          color: Color(0xff000000).withOpacity(0.06),
                        )
                      ],
                    ),
                    child: Column(children: []),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
