//Add Invoice Details Page
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/addInvoice_page_controller.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/apptext.dart';
import '../Widgets/customText.dart';
import '../Widgets/phonenumtext_field.dart';
import 'editprofile_screen.dart';

class AddInvoiceDetails extends GetView<AddInvoiceDetailsController> {
  const AddInvoiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kscaffoldBackgroundColor2,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => Container(
                      padding: EdgeInsets.all(0.0 * controller.reload.value))),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .062,
                          vertical: size.height * .03),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: SvgPicture.asset(
                                      'assets/svg/arrow_back_ios.svg'))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: CustomText(
                                      text: 'Edit Profile',
                                      size: 15,
                                      color: Color(0xff828282),
                                      fontWeight: FontWeight.bold))),
                          TextButton(
                              onPressed: () {
                                controller.onClear();
                              },
                              child: CustomBigText(
                                text: "Clear",
                                size: 15,
                                color: kOnboardingColors,
                              )),
                          //width(24)
                        ],
                      )),

                  height(size.height * 0.02),
                  EditTextField(
                    size: size,
                    controller: controller.companyNameController,
                    hintText: 'Company Name',
                  ),
                  //height(size.height * 0.01),
                  PhoneNumberTextFieldSlim(
                      hintText: "Phone Number",
                      controller1: controller.phnNumberController),
                  //height(size.height * 0.002),
                  EditTextField(
                    size: size,
                    controller: controller.cityNameController,
                    hintText: 'City',
                  ),
                  //height(size.height * 0.01),
                  EditTextField(
                    size: size,
                    controller: controller.postalCodeController,
                    hintText: 'Postal Code',
                  ),
                  //height(size.height * 0.01),
                  EditTextField(
                    size: size,
                    controller: controller.stateNameController,
                    hintText: 'State',
                  ),
                  //height(size.height * 0.01),
                  EditTextField(
                    size: size,
                    controller: controller.countryNameController,
                    hintText: 'Country',
                  ),
                  //height(size.height * 0.01),
                  EditTextField(
                    size: size,
                    controller: controller.gstNoController,
                    hintText: 'GST No',
                  ),
                ]),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: SaveButton(onTaop: () {
                controller.onSave();
              }),
            )),
            height(size.height * 0.01)
          ],
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
