import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/editprofile_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/phonenumtext_field.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/customText.dart';

class EditProfileScreen extends GetView<EditProfileScreenController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: kDefaultHomePageBackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                                      text: 'Profile',
                                      size: 14,
                                      color: Color(0xff828282),
                                      fontWeight: FontWeight.bold))),
                          width(24)
                        ],
                      )),
                  height(size.width * .07),
                  Container(
                    height: size.height * .11,
                    width: size.height * .11,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xff0047C3)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 7),
                        ]),
                    child: Container(
                      height: size.height * .11,
                      width: size.height * .11,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kDefaultHomePageBackgroundColor),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset('assets/images/profile_pic.png'),
                      ),
                    ),
                  ),
                  height(size.height * .01),
                  Container(
                    height: size.height * .04,
                    width: size.width * .35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff2F80ED),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/edit.svg'),
                        width(size.width * .02),
                        CustomText(
                          text: 'Edit image',
                          color: Colors.white,
                          size: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  height(size.height * .06),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                    child: EditTextField(
                      icon: SvgPicture.asset("assets/svg/face.svg"),
                      size: size,
                      controller: controller.nameController,
                      hintText: 'Jane Doe',
                    ),
                  ),
                  height(size.height * .02),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                  //   child: Container(
                  //     padding: EdgeInsets.only(
                  //       left: size.width * 0.05,
                  //     ),
                  //     height: size.height * .085,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(60),
                  //         border: Border.all(
                  //           width: 2,
                  //           color: Color(0xffE0E0E0),
                  //         )),
                  //     child: Row(
                  //       children: [
                  //         Obx(
                  //           () {
                  //             return InkWell(
                  //               onTap: () {
                  //                 showCountryPicker(
                  //                   context: context,
                  //                   favorite: ['IN', 'BD'],
                  //                   showPhoneCode: true,
                  //                   onSelect: (Country country) {
                  //                     print(
                  //                         'Select country: ${country.displayName}');
                  //                     controller.country.value =
                  //                         country.phoneCode;
                  //                   },
                  //                 );
                  //               },
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     "+${controller.country.value}",
                  //                     style: TextStyle(
                  //                       fontSize: 15,
                  //                       color: Color(0xff4F4F4F),
                  //                     ),
                  //                   ),
                  //                   Icon(
                  //                     Icons.expand_more,
                  //                     size: 20,
                  //                     color: Color(0xff4F4F4F),
                  //                   )
                  //                 ],
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //         SizedBox(
                  //           width: size.width * 0.014,
                  //         ),
                  //         Container(
                  //           height: size.height * 0.06,
                  //           width: size.width * 0.005,
                  //           color: Color(0xffE0E0E0),
                  //         ),
                  //         SizedBox(
                  //           width: size.width * 0.035,
                  //         ),
                  //         Form(
                  //           child: Container(
                  //             height: size.height * 0.065,
                  //             width: size.width * 0.5,
                  //             child: Padding(
                  //               padding:
                  //                   EdgeInsets.only(top: size.height * 0.0017),
                  //               child: TextFormField(
                  //                 onChanged: (String value) {
                  //                   controller.textfield.value = value;
                  //                 },
                  //                 keyboardType: TextInputType.number,
                  //                 maxLines: 1,
                  //                 inputFormatters: [
                  //                   // LengthLimitingTextInputFormatter(10),
                  //                   FilteringTextInputFormatter.digitsOnly,
                  //                 ],
                  //                 decoration: InputDecoration(
                  //                   hintText: "Phone Number",
                  //                   hintStyle: TextStyle(
                  //                     color: Colors.grey,
                  //                   ),
                  //                   border: InputBorder.none,
                  //                   focusedBorder: InputBorder.none,
                  //                   enabledBorder: InputBorder.none,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                    child: PhoneNumberTextField(
                        hintText: "Phone Number",
                        controller1: controller.phnNumberController),
                  ),
                  height(size.height * .02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                    child: EditTextField(
                      icon: Image.asset(
                        "assets/images/sms.png",
                        width: size.width * 0.06,
                        height: size.height * 0.028,
                      ),
                      // icon: SvgPicture.asset("assets/svg/sms.svg"),
                      size: size,
                      controller: controller.nameController,
                      hintText: 'janedoe@example.com',
                    ),
                  ),
                  // Spacer(),
                  Container(
                    height: size.height * .067,
                    width: size.width * .65,
                    margin: EdgeInsets.only(top: size.height * .16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff2F80ED).withOpacity(1)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save_outlined, color: Color(0xffFFFFFF)),
                          width(size.width * .02),
                          CustomText(
                              text: 'Save',
                              color: Color(0xffFFFFFF),
                              size: 14,
                              fontWeight: FontWeight.bold)
                        ]),
                  ),
                  height(size.height * .04)
                ],
              ),
            ),
          )),
    );
  }

  Widget EditTextField({
    required TextEditingController controller,
    required String hintText,
    required Size size,
    required Widget icon,
  }) {
    return Container(
      height: size.height * .085,
      width: size.width,
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Color(0xff828282),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          // contentPadding: EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Color(0xffE0E0E5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Color(0xff628EDB))),
          prefixIcon: Container(
            width: 20,
            alignment: Alignment.center,
            child: icon,
          ),
        ),
      ),
    );
  }
}
