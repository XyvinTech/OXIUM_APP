import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/vehicles_screen_controller.dart';
import 'package:freelancer_app/Utils/debouncer.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/appbar.dart';

class VehicleSearchScreen extends GetView<VehiclesScreenController> {
  VehicleSearchScreen({super.key});
  final Debouncer _debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        controller.isVisible.value = false;
        controller.isSelectedVehicleindex.value = -1;
        return;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * 0.09),
            child: CustomAppBar(
              text: "Skip",
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              icononTap: () {},
              skiponTap: () {
                Get.back();
              },
            ),
          ),
          backgroundColor: kscaffoldBackgroundColor,
          body: Column(
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
                child: _searchVehicleSection(),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.055,
                  right: size.width * 0.055,
                ),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Obx(
                      () => CustomSmallText(
                        text: "Result ${controller.vehicle_list.length}",
                        size: 14,
                        color: Color(0xffBDBDBD),
                      ),
                    )),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _resultSearchVehicle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchVehicleSection() {
    return Row(
      children: [
        InkWell(
          onTap: (() {
            controller.isVisible.value = false;
            controller.isSelectedVehicleindex.value = -1;
            Get.back();
          }),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color(0xff828282),
          ),
        ),
        SizedBox(
          width: size.width * 0.01,
        ),
        Container(
          height: size.height * 0.06,
          width: size.width * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kwhite,
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.6,
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: TextFormField(
                    controller: controller.searchTextFieldcontroller,
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Search Vehicle",
                      hintStyle: kApphintTextStyle,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _debouncer.run(() {
                        controller.getSearchedVehicles();
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.02),
                child: Image.asset(
                  "assets/images/search.png",
                  height: size.height * 0.05,
                ),
              ),
            ],
          )),
        )
      ],
    );
  }

  Widget _resultSearchVehicle() {
    return Expanded(
        child: Container(
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
                  itemCount: controller.vehicle_list.length,
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
                                    controller.vehicle_list[index];
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
                                  cachedNetworkImage(
                                    controller.vehicle_list[index].icon,
                                    width: 120.w,
                                  ),
                                  width(20.w),
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
                                                    .vehicle_list[index]
                                                    .brand,
                                                color: Color(0xff828282),
                                              ),
                                              CustomBigText(
                                                text: controller
                                                    .vehicle_list[index]
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
                                                .vehicle_list[index]
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
                                                                .vehicle_list[index]
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
                      "Add Vehicle",
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
    ));
  }
}
