import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:freelancer_app/Controller/vehicles_screen_controller.dart';
import 'package:freelancer_app/Utils/routes.dart';

import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

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
            text: "skip",
            icon: Icon(Icons.arrow_forward),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, isScolled) {
            return [
              SliverAppBar(
                backgroundColor: kwhite,
                automaticallyImplyLeading: false,
                expandedHeight: size.height * 0.25,
                collapsedHeight: size.height * 0.25,
                snap: true,
                floating: true,
                // pinned: true,
                flexibleSpace: _allVehicles(),
              ),
            ];
          },
          body: _vehiclesModel(),
        ),
      ),
    );
  }

  Widget _allVehicles() {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.055,
        top: size.height * 0.020,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBigText(text: "Add Your Vehicles"),
              Container(
                margin: EdgeInsets.only(
                  right: size.width * 0.055,
                ),
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
            height: 10,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: CustomSmallText(text: "Vehicle Models")),
        ],
      ),
    );
  }

  Widget _vehicles() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: InkWell(
            onTap: () {
              controller.isSelectedVehicleindex.value = -1;
              controller.isSelectedindex.value = -1;
            },
            child: Container(
              height: 89,
              width: 89,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: kwhite,
                border: Border.all(
                  width: 1,
                  color: Color(0xffE0E0E0),
                ),
              ),
              child: Center(
                child: CustomBigText(text: "All"),
              ),
            ),
          ),
        ),
        Container(
          height: 95,
          width: 275,
          child: ListView.builder(
            itemCount: controller.vehiclesdata.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Obx(() => InkWell(
                      onTap: () {
                        controller.isVisible.value = true;
                        controller.isSelectedindex!.value = index;
                      },
                      child: Container(
                        height: 89,
                        width: 89,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: controller.isSelectedindex == index
                              ? Color(0xff0047C3)
                              : kwhite,
                          border: Border.all(
                            width: 1,
                            color: Color(0xffE0E0E0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        controller.vehiclesdata[index].image),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomSmallText(
                              text: controller.vehiclesdata[index].vehiclesName,
                              color: controller.isSelectedindex == index
                                  ? Color(0xffF2F2F2)
                                  : Color(0xff828282),
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    );
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
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 100,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Obx(() => InkWell(
                          onTap: (() {
                            controller.isVisible.value = true;
                            controller.isSelectedVehicleindex!.value = index;
                          }),
                          child: Container(
                            height: size.height * 0.155,
                            width: size.width * 0.075,
                            decoration: BoxDecoration(
                              color: controller.isSelectedVehicleindex == index
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "assets/images/jeep1.png",
                                  height: size.height * 0.12,
                                  width: size.width * 0.32,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 22,
                                          color: Color.fromRGBO(
                                              184, 210, 255, 0.6),
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
                                          color: Color.fromRGBO(
                                              184, 210, 255, 0.6),
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
                        )),
                  );
                },
              ),
            ),
          ),
          Visibility(
            maintainState: true,
            visible: controller.isVisible.value,
            child: InkWell(
              onTap: () {
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
        ],
      ),
    );
  }
}
