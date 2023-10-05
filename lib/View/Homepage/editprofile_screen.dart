import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/editprofile_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/phonenumtext_field.dart';
import 'package:get/get.dart';

import '../../Singletones/app_data.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/cached_network_image.dart';
import '../Widgets/customText.dart';
import 'addInvoice_page.dart';

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
                                      text: 'Edit Profile',
                                      size: 14,
                                      color: Color(0xff828282),
                                      fontWeight: FontWeight.bold))),
                          width(24)
                        ],
                      )),
                  height(size.width * .01),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Obx(
                              () => cachedNetworkImage(
                                  appData.userModel.value.image,
                                  width: double.infinity,
                                  fit: BoxFit.cover),
                            ),
                          )
                          // Image.asset('assets/images/profile_pic.png'),
                          ),
                    ),
                  ),
                  height(size.height * .01),
                  InkWell(
                    onTap: () {
                      controller.pickAndUploadImage();
                    },
                    child: Container(
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
                            text: 'Upload image',
                            color: Colors.white,
                            size: 11.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  height(size.height * .04),
                  EditTextField(
                    icon: SvgPicture.asset("assets/svg/face.svg"),
                    size: size,
                    controller: controller.nameController,
                    hintText: 'Jane Doe',
                  ),

                  /// height(size.height * .01),
                  PhoneNumberTextFieldSlim(
                      hintText: "Phone Number",
                      controller1: controller.phnNumberController),
                  //height(size.height * .01),
                  EditTextField(
                    enabled: true,
                    icon: Image.asset(
                      "assets/images/sms.png",
                      width: size.width * 0.06,
                      height: size.height * 0.028,
                    ),
                    // icon: SvgPicture.asset("assets/svg/sms.svg"),
                    size: size,

                    controller: controller.emailController,
                    hintText: 'janedoe@example.com',
                  ),

                  height(size.height * .2),
                  // CustomText(
                  //     text: "Invoice Details (Optional)", color: Colors.grey),
                  // // Spacer(),
                  // Container(
                  //   height: size.height * .08,
                  //   width: size.width * .83,
                  //   margin: EdgeInsets.only(top: size.height * .016),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(40),
                  //       border: Border.all(width: 0.5, color: Colors.grey),
                  //       color: Colors.transparent),
                  //   child: InkWell(
                  //     onTap: () {
                  //       Get.toNamed(Routes.addInvoicePageRoute);
                  //     },
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         CustomText(
                  //             text: "Add/Edit Invoice Details",
                  //             color: Colors.grey,
                  //             size: 15),
                  //         SizedBox(
                  //           width: size.width * 0.25,
                  //         ),
                  //         Icon(
                  //           Icons.arrow_forward_ios,
                  //           size: 12,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // height(size.height * .02),
                  // CustomText(
                  //     text:
                  //         "B2B Customers who requirea GST Invoice, Please Update",
                  //     color: Colors.grey,
                  //     size: 12),
                  // CustomText(
                  //     text: "Billing Details in Profile",
                  //     color: Colors.grey,
                  //     size: 12),
                  // height(size.height * .06),
                  SaveButton(
                    onTaop: controller.updateUserProfile,
                  ),

                  height(size.height * .04)
                ],
              ),
            ),
          )),
    );
  }
}

// //Add Invoice Details Page
// class AddInvoiceDetails extends GetView<EditProfileScreenController> {
//   const AddInvoiceDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: kscaffoldBackgroundColor2,
//         body: SingleChildScrollView(
//           child: Center(
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: size.width * .062,
//                           vertical: size.height * .03),
//                       child: Row(
//                         children: [
//                           InkWell(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Container(
//                                   padding: EdgeInsets.all(5),
//                                   child: SvgPicture.asset(
//                                       'assets/svg/arrow_back_ios.svg'))),
//                           Expanded(
//                               child: Container(
//                                   alignment: Alignment.center,
//                                   child: CustomText(
//                                       text: 'Edit Profile',
//                                       size: 15,
//                                       color: Color(0xff828282),
//                                       fontWeight: FontWeight.bold))),
//                           TextButton(
//                               onPressed: () {
//                                 controller.onClear();
//                               },
//                               child: CustomBigText(
//                                 text: "Clear",
//                                 size: 15,
//                                 color: kOnboardingColors,
//                               )),
//                           //width(24)
//                         ],
//                       )),
//                   height(size.height * 0.02),
//                   EditTextField(
//                     size: size,
//                     controller: controller.companyNameController,
//                     hintText: 'Company Name',
//                   ),
//                   //height(size.height * 0.01),
//                   PhoneNumberTextFieldSlim(
//                       hintText: "Phone Number",
//                       controller1: controller.phnNumberController),
//                   //height(size.height * 0.002),
//                   EditTextField(
//                     size: size,
//                     controller: controller.cityNameController,
//                     hintText: 'City',
//                   ),
//                   //height(size.height * 0.01),
//                   EditTextField(
//                     size: size,
//                     controller: controller.postalCodeController,
//                     hintText: 'Postal Code',
//                   ),
//                   //height(size.height * 0.01),
//                   EditTextField(
//                     size: size,
//                     controller: controller.stateNameController,
//                     hintText: 'State',
//                   ),
//                   //height(size.height * 0.01),
//                   EditTextField(
//                     size: size,
//                     controller: controller.countryNameController,
//                     hintText: 'Country',
//                   ),
//                   //height(size.height * 0.01),
//                   EditTextField(
//                     size: size,
//                     controller: controller.gstNoController,
//                     hintText: 'GST No',
//                   ),
//                 ]),
//           ),
//         ),
//         floatingActionButton: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Center(
//                 child: Padding(
//               padding: EdgeInsets.only(left: size.width * 0.1),
//               child: SaveButton(onTaop: () {}),
//             )),
//             height(size.height * 0.01)
//           ],
//         ),
//         resizeToAvoidBottomInset: false,
//       ),
//     );
//   }
// }

// Text Field
Widget EditTextField({
  required TextEditingController controller,
  required String hintText,
  required Size size,
  Widget? icon,
  bool enabled = true,
}) {
  Color borderColor = Color.fromARGB(255, 158, 158, 158);
  Color focusedBorderColor = Color.fromARGB(255, 62, 119, 216);
  RxString errorText = ''.obs;
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: size.width * .08, vertical: size.height * 0.008),
    child: Container(
      // height: size.height * .085,
      width: size.width,
      child: Obx(
        () => Column(
          children: [
            TextField(
              controller: controller,
              enabled: enabled,
              onTapOutside: (event) => {
                if (controller.value == "")
                  {
                    errorText.value = "Please Enter",
                    focusedBorderColor = Colors.red,
                    borderColor = Colors.red
                  },
              },
              onChanged: (value) => {
                if (value == "")
                  {
                    errorText.value = "Please Enter",
                    focusedBorderColor = Colors.red,
                    borderColor = Colors.red
                  }
                else
                  {
                    errorText.value = "",
                    focusedBorderColor = Color.fromARGB(255, 62, 119, 216),
                    borderColor = Color.fromARGB(255, 158, 158, 158)
                  }
              },
              style: TextStyle(
                color: Color(0xff828282),
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.only(left: 20, bottom: 17, top: 17),
                // isDense: true,
                // isCollapsed: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: borderColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: borderColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: focusedBorderColor, width: 2)),
                prefixIcon: icon == null
                    ? null
                    : Container(
                        width: 20,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        child: icon,
                      ),
              ),
            ),
            errorText.value != ""
                ? Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: CustomBigText(
                          text: "${errorText.value} $hintText",
                          size: 10,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                : Center(),
          ],
        ),
      ),
    ),
  );
}

//Save Button
class SaveButton extends StatelessWidget {
  final Function onTaop;
  const SaveButton({super.key, required this.onTaop});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTaop(),
      child: Container(
        height: size.height * .067,
        width: size.width * .65,
        //margin: EdgeInsets.only(top: size.height * .16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: kOnboardingColors),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.save_outlined, color: Color(0xffFFFFFF)),
          width(size.width * .02),
          CustomText(
              text: 'Save',
              color: Color(0xffFFFFFF),
              size: 14,
              fontWeight: FontWeight.bold)
        ]),
      ),
    );
  }
}
