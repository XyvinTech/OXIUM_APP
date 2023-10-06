import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/vehicles_screen_controller.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/textfield.dart';
import 'package:get/get.dart';

import '../../Utils/routes.dart';
import '../../constants.dart';
import '../Widgets/appbar.dart';
import '../Widgets/cached_network_image.dart';

class PersonalVechileDetailsPage extends GetView<VehiclesScreenController> {
  const PersonalVechileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.09),
        child: CustomAppBar(
          icononTap: () {
            Get.toNamed(Routes.vehicledetailspageRoute);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(30.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: CustomSmallText(
                text: "Personal Details",
                color: Color(0xff828282),
                size: 15.sp,
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Obx(
                () => CustomBigText(
                  text: appData.userModel.value.name,
                  color: Color(0xff4F4F4F),
                  size: 21.sp,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.0055,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Obx(
                () => CustomSmallText(
                  text: appData.userModel.value.email,
                  color: Color(0xff4F4F4F),
                  size: 15.sp,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              child: _userVehicle(),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: CustomBigText(
                text: "Enter your Vehicle No",
                size: 14,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: AppTextField(
                onTap: () {
                  controller.enablemailTextfield.value = true;
                },
                hintText: "Vehicle no",
                icon: SvgPicture.asset("assets/svg/directions_car1.svg"),
                keyboardtype: TextInputType.name,
                Controller: controller.numEditingController,
                onChanged: (String val) {},
                color: controller.enablemailTextfield == true
                    ? Color(0xff0047C3).withOpacity(0.6)
                    : Color(0xffE0E0E0),
              ),
            ),
            height(160.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: AppButton(
                text: "Submit",
                onTap: () {
                  if (controller.numEditingController.text.isEmpty) {
                    EasyLoading.showInfo('Vehicle no is required');
                    return;
                  }
                  controller.onVehicleSubmit();
                },
              ),
            ),
            height(20.h),
          ],
        ),
      ),
    ));
  }

  Widget _userVehicle() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * .16,
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
            controller.selectedVehicle.value.icon.isEmpty
                ? Image.asset(
                    "assets/images/jeep1.png",
                    height: size.height * 0.12,
                    width: size.width * 0.32,
                  )
                : cachedNetworkImage(
                    controller.selectedVehicle.value.icon,
                    width: 140.w,
                  ),
            width(20.w),
            Expanded(
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
                          text: controller.selectedVehicle.value.vehicleDetails,
                          color: Color(0xff828282),
                        ),
                        CustomBigText(
                          text: controller.selectedVehicle.value.modelName,
                          size: 16,
                          color: Color(0xff4F4F4F),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.selectedVehicle.value.evPort.length,
                      itemBuilder: ((context, index1) => Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 22,
                              margin: EdgeInsets.only(right: 5.w),
                              color: Color.fromRGBO(184, 210, 255, 0.6),
                              child: Center(
                                child: CustomSmallText(
                                  text: controller.selectedVehicle.value
                                      .evPort[index1]['connectorType'],
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
