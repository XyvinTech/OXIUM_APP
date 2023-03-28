import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/vehicles_screen_controller.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class AddVehiclesPage extends GetView<VehiclesScreenController> {
  const AddVehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.09),
          child: CustomAppBar(
            text: "Skip",
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            icononTap: () {
              Get.toNamed(Routes.vehicledetailspageRoute);
            },
            skiponTap: () {},
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, isScolled) {
            return [
              SliverAppBar(
                  backgroundColor: kwhite,
                  automaticallyImplyLeading: false,
                  expandedHeight: size.height * 0.265,
                  collapsedHeight: size.height * 0.265,
                  snap: true,
                  floating: true,
                  // pinned: true,
                  flexibleSpace: _allVehicles()),
            ];
          },
          body: _vehiclesModel(),
        ),
      ),
    );
  }

  Widget _allVehicles() {
    return Column(
      children: [
        LinearProgressBar(
          maxSteps: 5,
          progressType:
              LinearProgressBar.progressTypeLinear, // Use Linear progress
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00FFB3)),
          currentStep: 4,
          minHeight: 8.h,
          progressColor: Color(0xff00FFB3),
          backgroundColor: Colors.transparent,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.055,
            right: size.width * 0.055,
            top: size.height * 0.020,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBigText(text: "Add Your Vehicles"),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.vehiclesearchPageRoute);
                    },
                    child: Image.asset(
                      "assets/images/search.png",
                      height: size.height * 0.05,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //vehicles section
              _vehicles(),
              SizedBox(
                height: 30.h,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomBigText(
                    text: "Select Vehicle Model",
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _vehicles() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 00.h),
        child: Obx(
          () => Container(
            width: size.width * 1 + 0 * controller.reload.value,
            height: 65.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                border: Border.all(
                  width: 1,
                  color: Color(0xffE0E0E0),
                )),
            child: DropdownButton<String>(
              value: controller.selectedBrand.value,
              hint: Text(
                'Select Brand',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 155, 154, 154),
                ),
              ),
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff4F4F4F),
              ),
              dropdownColor: kwhite,
              isExpanded: true,
              elevation: 1,
              underline: SizedBox(),
              items: controller.brands
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              icon: SvgPicture.asset("assets/svg/arrow_downward_ios.svg"),
              onChanged: (String? value) {
                controller.onDropdownValuChanged(value);
              },
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ));
    // Row(
    //   children: [

    // Padding(
    //   padding: const EdgeInsets.only(right: 5),
    //   child: InkWell(
    //     onTap: () {
    //       controller.isSelectedVehicleindex.value = -1;
    //       controller.isSelectedindex.value = -1;
    //     },
    //     child: Container(
    //       height: 89.h,
    //       width: 89.w,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(28),
    //         color: kwhite,
    //         border: Border.all(
    //           width: 1,
    //           color: Color(0xffE0E0E0),
    //         ),
    //       ),
    //       child: Center(
    //         child: CustomBigText(text: "All"),
    //       ),
    //     ),
    //   ),
    // ),
    // Container(
    //   height: 95.h,
    //   width: 272.w,
    //   child: ListView.builder(
    //     itemCount: controller.vehiclesdata.length,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (_, index) {
    //       return Padding(
    //         padding: EdgeInsets.only(left: 10.w),
    //         child: Obx(() => InkWell(
    //               onTap: () {
    //                 controller.isVisible.value = true;
    //                 controller.isSelectedindex.value = index;
    //               },
    //               child: Container(
    //                 height: 89.h,
    //                 width: 89.w,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(28),
    //                   color: controller.isSelectedindex == index
    //                       ? Color(0xff0047C3)
    //                       : kwhite,
    //                   border: Border.all(
    //                     width: 1,
    //                     color: Color(0xffE0E0E0),
    //                   ),
    //                 ),
    //                 child: Column(
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsets.only(top: 8.h),
    //                       child: Container(
    //                         height: 48.h,
    //                         width: 48.w,
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                             image: (controller.isSelectedindex == 0 &&
    //                                     controller.isVisible.value == true)
    //                                 ? AssetImage(controller
    //                                     .vehiclesdata2[index].image)
    //                                 : AssetImage(controller
    //                                     .vehiclesdata[index].image),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 8.h,
    //                     ),
    //                     CustomSmallText(
    //                       text: controller.vehiclesdata[index].vehiclesName,
    //                       color: controller.isSelectedindex == index
    //                           ? Color(0xffF2F2F2)
    //                           : Color(0xff828282),
    //                       size: 12.sp,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             )),
    //       );
    //     },
    //   ),
    // ),

    //   ],
    // );
  }

  Widget _vehiclesModel() {
    return Container(
      height: size.height * 0.55,
      color: kscaffoldBackgroundColor,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: kscaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: size.width * .05),
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.selectedVehicleList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Obx(() => InkWell(
                            onTap: (() {
                              if (controller.isSelectedVehicleindex.value !=
                                  index) {
                                controller.isVisible.value = true;
                                controller.isSelectedVehicleindex.value = index;
                                controller.selectedVehicle.value =
                                    controller.selectedVehicleList[index];
                              } else {
                                controller.isVisible.value = false;
                                controller.isSelectedVehicleindex.value = -1;
                                controller.selectedVehicle.value =
                                    kVehicleModel;
                              }
                            }),
                            child: Container(
                              height: size.height * 0.155,
                              width: size.width * 0.075,
                              decoration: BoxDecoration(
                                color:
                                    controller.isSelectedVehicleindex == index
                                        ? Color(0xffEFFFF6)
                                        : kwhite,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  width: 2,
                                  color:
                                      controller.isSelectedVehicleindex == index
                                          ? Color.fromRGBO(135, 221, 171, 0.6)
                                          : Color(0xffE0E0E0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "assets/images/jeep1.png",
                                    height: size.height * 0.12,
                                    width: size.width * 0.32,
                                  ),
                                  width(10.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomSmallText(
                                                text: controller
                                                    .selectedVehicleList[index]
                                                    .vehicleDetails,
                                                color: Color(0xff828282),
                                              ),
                                              CustomBigText(
                                                text: controller
                                                    .selectedVehicleList[index]
                                                    .modelName,
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
                                            itemCount: controller
                                                .selectedVehicleList[index]
                                                .evPort
                                                .length,
                                            itemBuilder: ((context, index1) =>
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: 22,
                                                    margin: EdgeInsets.only(
                                                        right: 5.w),
                                                    color: Color.fromRGBO(
                                                        184, 210, 255, 0.6),
                                                    child: Center(
                                                      child: CustomSmallText(
                                                        text: controller
                                                                .selectedVehicleList[
                                                                    index]
                                                                .evPort[index1]
                                                            ['connectorType'],
                                                        color:
                                                            Color(0xff0047C3),
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
                          )),
                    );
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              // maintainState: true,
              visible: controller.isVisible.value,
              child: InkWell(
                onTap: () {
                  if (controller.selectedVehicle.value != kVehicleModel)
                    Get.toNamed(Routes.vehicledetailspageRoute);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.055,
                      right: size.width * 0.055,
                      bottom: size.height * 0.03),
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(65),
                    color: Color(0xff0047C3),
                  ),
                  child: Center(
                    child: Text(
                      "Add Vehicles",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xffF2F2F2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
