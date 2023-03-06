import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:get/get.dart';

import '../../Utils/routes.dart';
import '../../constants.dart';
import '../Widgets/appbar.dart';
import '../Widgets/apptext.dart';

class MyVehiclePage extends StatelessWidget {
  const MyVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.09),
        child: CustomAppBar(
          logo: CustomBigText(
            text: "My Vehicle",
            size: 15.sp,
            color: Color(0xffF2F2F2),
          ),
          icon: Image.asset("assets/images/add.png"),
          icononTap: (() {
            Get.toNamed(Routes.addvehiclesRoute);
          }),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.045,
            right: size.width * 0.045,
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
                onTap: () {
                  Get.toNamed(Routes.smartchargeRoute);
                },
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
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1.5,
            color: Color(0xffE0E0E0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/jeep1.png",
              height: size.height * 0.1,
              width: size.width * 0.3,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSmallText(
                          text: "Jeep",
                          color: Color(0xff828282),
                          size: 15.sp,
                        ),
                        CustomBigText(
                          text: "RUBICON",
                          size: 18.sp,
                          color: Color(0xff4F4F4F),
                        ),
                      ],
                    ),
                  ),
                  height(15.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 9.w),
                          child: Row(
                            children: [
                              CustomBigText(
                                text: "Vehicle No: ",
                                size: 14.sp,
                              ),
                              width(5.w),
                              CustomBigText(
                                text: "KL 07 A 6577",
                                size: 14.sp,
                                color: Color(0xff333333),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.0035,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Color.fromRGBO(184, 210, 255, 0.6),
                              ),
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
                              padding: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Color.fromRGBO(184, 210, 255, 0.6),
                              ),
                              child: Center(
                                child: CustomSmallText(
                                  text: "Type2",
                                  color: Color(0xff0047C3),
                                  size: 15.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
