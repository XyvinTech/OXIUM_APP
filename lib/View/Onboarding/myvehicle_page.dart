import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';

import '../../constants.dart';
import '../Widgets/appbar.dart';
import '../Widgets/apptext.dart';

class MyVehiclePage extends StatelessWidget {
  const MyVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.09),
          child: CustomAppBar(
            icon: Image.asset("assets/images/add.png"),
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
              _myVehicle(),
              Expanded(child: Container()),
              StartedButton(
                color: Color(0xff0047C3),
                text: "Get Charged",
                textColor: Color(0xffF2F2F2),
                iconColor: Color(0xffF2F2F2),
              ),
              // LoginButton(color: Color(0xff0047C3), text: "Get Charged"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myVehicle() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * 0.155,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          color: Color(0xffEFFFF6),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
            color: Color.fromRGBO(135, 221, 171, 0.6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/jeep1.png",
              height: size.height * 0.12,
              width: size.width * 0.32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSmallText(
                      text: "Jeep",
                      color: Color(0xff828282),
                    ),
                    SizedBox(
                      height: size.height * 0.0035,
                    ),
                    CustomBigText(
                      text: "RUBICON",
                      size: 16,
                      color: Color(0xff4F4F4F),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomBigText(
                      text: "Vehicle No:  KL 07 A 6577",
                      size: 12,
                    ),
                    SizedBox(
                      height: size.height * 0.008,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 22,
                          color: Color.fromRGBO(184, 210, 255, 0.6),
                          child: Center(
                            child: CustomSmallText(
                              text: "Type2 CCS",
                              color: Color(0xff0047C3),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Container(
                          height: 22,
                          color: Color.fromRGBO(184, 210, 255, 0.6),
                          child: Center(
                            child: CustomSmallText(
                              text: "Type2 CCS",
                              color: Color(0xff0047C3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
