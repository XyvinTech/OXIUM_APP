import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/vehicles_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/textfield.dart';
import 'package:get/get.dart';
import '../../Utils/routes.dart';
import '../../constants.dart';
import '../Widgets/appbar.dart';

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
          ontap: () {
            Get.toNamed(Routes.vehicledetailspageRoute);
          },
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSmallText(
              text: "Personal Details",
              color: Color(0xff828282),
              size: 12,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            CustomBigText(
              text: "Jane Doe",
              color: Color(0xff4F4F4F),
              size: 18,
            ),
            SizedBox(
              height: size.height * 0.0055,
            ),
            CustomSmallText(
              text: "janedoe@example.com",
              color: Color(0xff4F4F4F),
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            _userVehicle(),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomBigText(
              text: "Enter your Vehicle No",
              size: 14,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            AppTextField(
              onTap: () {
                controller.enablemailTextfield.value = true;
              },
              hintText: "Vehicle No",
              icon: Image.asset("assets/images/face.png"),
              keyboardtype: TextInputType.number,
              Controller: controller.numEditingController,
              onChanged: (String val) {},
              color: controller.enablemailTextfield == true
                  ? Color(0xff0047C3).withOpacity(0.6)
                  : Color(0xffE0E0E0),
            ),
            Expanded(child: Container()),
            AppButton(
              text: "submit",
              onTap: () {
                Get.toNamed(Routes.myvehicleRoute);
              },
            ),
          ],
        ),
      ),
    ));
  }

  Widget _userVehicle() {
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
                    CustomBigText(
                      text: "RUBICON",
                      size: 16,
                      color: Color(0xff4F4F4F),
                    ),
                  ],
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
