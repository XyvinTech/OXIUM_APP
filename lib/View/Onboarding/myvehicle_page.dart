import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/my_vehicles_screen_controller.dart';
import 'package:freelancer_app/Model/myVehicleModel.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:get/get.dart';

import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/appbar.dart';
import '../Widgets/apptext.dart';

class MyVehiclePage extends GetView<MyVehiclesScreenController> {
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
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.myVehicleList.length,
                  itemBuilder: ((context, index) =>
                      _myVehicle(controller.myVehicleList[index])),
                ),
              ),

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

  Widget _myVehicle(MyVehicleModel model) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * .16,
        padding: EdgeInsets.all(5.w),
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
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/jeep1.png",
                height: size.height * 0.12,
                width: size.width * 0.32,
              ),
            ),
            width(5.w),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSmallText(
                          text: model.make,
                          color: Color(0xff828282),
                        ),
                        CustomBigText(
                          text: model.model,
                          size: 16,
                          color: Color(0xff4F4F4F),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      CustomBigText(
                        text: "Vehicle No: ",
                        size: 14.sp,
                      ),
                      width(5.w),
                      Expanded(
                        child: CustomBigText(
                          text: model.evRegNumber,
                          size: 14.sp,
                          color: Color(0xff333333),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 0,
                      itemBuilder: ((context, index1) => Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 22,
                              margin: EdgeInsets.only(right: 5.w),
                              color: Color.fromRGBO(184, 210, 255, 0.6),
                              child: Center(
                                child: CustomSmallText(
                                  text: 'CSS TYPE2',
                                  // .evPort[index1]['connectorType'],
                                  color: Color(0xff0047C3),
                                ),
                              ),
                            ),
                          )),
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
