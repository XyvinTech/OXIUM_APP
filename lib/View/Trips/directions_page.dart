import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/directions_screen_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Singletones/map_functions.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/apptext.dart';
import '../Widgets/rounded_container.dart';

class DirectionsScreen extends GetView<DirectionsScreenController> {
  const DirectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.all(controller.reload.value * 0),
                    child: GoogleMap(
                      initialCameraPosition:
                          MapFunctions().initialPosition.value,
                      trafficEnabled: false,
                      myLocationEnabled: false,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      markers: MapFunctions().markers,
                      polylines: MapFunctions().polylines,
                      onMapCreated: (controller) {
                        MapFunctions().dirMapController = controller;
                        MapFunctions().setMapStyle(controller);
                        kLog('loading map');
                        MapFunctions().getCurrentPosition();
                      },
                      onTap: (value) {
                        print(value);
                        MapFunctions().setMapFitToPolyline(
                            MapFunctions().polylines,
                            MapFunctions().dirMapController);
                        // MapFunctions().addMarkerHomePage(
                        //     name: value.latitude.toString(),
                        //     latLng: value,
                        //     isGreen: false,
                        //     controller: controller);
                        controller.reload++;
                      },
                    ),
                  ),
                ),
              ),
              yourDestinationCard(),
              // startYourTripCard(),

              Obx(
                () => Visibility(
                  visible: controller.saveCount.value == 0,
                  child: _tripCard(),
                ),
              ),
              Obx(
                () => Visibility(
                    visible: controller.saveCount.value == 1,
                    child: _tripNameCard(context)),
              ),
              Obx(
                () => Visibility(
                    visible: controller.saveCount.value == 2,
                    child: _trip01Card()),
              ),
            ],
          ),
        ));
  }

  Widget yourDestinationCard() {
    return Positioned(
        top: size.height * 0.04,
        width: size.width * .90,
        child: Container(
          child: Container(
            padding: EdgeInsets.only(
                // top: size.height * 0.07,
                // bottom: size.height * 0.02,
                ),
            height: size.height * 0.22,
            width: size.width,
            decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                  blurRadius: 32,
                  color: Color(0xff000000).withOpacity(0.06),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .045),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              padding: EdgeInsets.all(3),
                              child: Icon(Icons.arrow_back_ios))),
                      width(size.width * .02),
                      CustomBigText(
                        text: 'Choose destinations',
                        size: 14,
                        color: Color(0xff4f4f4f),
                      ),
                    ],
                  ),
                ),
                height(size.height * .015),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * .05,
                        right: size.width * .015,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/svg/adjust.svg'),
                          Column(
                            children: List.generate(
                                4,
                                (index) => Container(
                                      height: 4,
                                      width: 1,
                                      margin: EdgeInsets.symmetric(
                                          vertical: size.height * .0038),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey),
                                    )),
                          ),
                          SvgPicture.asset('assets/svg/location_on_red.svg')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Obx(
                            () => rounded_container(
                                hintText: 'Starting point',
                                text: controller.source.value.placeId == null
                                    ? null
                                    : controller.source.value.description!
                                        .split(', ')
                                        .first,
                                onTap: () {
                                  Get.toNamed(Routes.searchPlacesPageRoute)!
                                      .then((value) {
                                    if (value == null || value.isEmpty) return;
                                    controller.source.value = value[0];
                                  });
                                }),
                          ),
                          height(size.height * .01),
                          Obx(
                            () => rounded_container(
                                hintText: 'Destination',
                                text: controller.destination.value.placeId ==
                                        null
                                    ? null
                                    : controller.destination.value.description!
                                        .split(', ')
                                        .first,
                                onTap: () {
                                  Get.toNamed(Routes.searchPlacesPageRoute)!
                                      .then((value) {
                                    if (value == null || value.isEmpty) return;
                                    controller.destination.value = value[0];
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                    width(size.width * .051)
                  ],
                ),
                height(size.height * .01),
              ],
            ),
          ),
        ));
  }

  Widget _tripCard() {
    return Positioned(
      bottom: size.height * .04,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.height * 0.02),
        height: size.height * 0.215,
        width: size.width * .90,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xff000000).withOpacity(.12)),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/ev_charger.svg"),
                    width(size.width * 0.02),
                    CustomBigText(
                      text: "4 Reservations",
                      size: 12,
                      color: Color(
                        0xff0047C3,
                      ),
                      letterspacing: -0.408,
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/conversation_path.svg"),
                    width(size.width * 0.02),
                    CustomSmallText(
                      text: "Route via ${controller.route_via}",
                      size: 12,
                      letterspacing: -0.408,
                    )
                  ],
                )
              ],
            ),
            height(size.height * 0.02),
            Row(
              children: [
                CustomBigText(
                  // text: "2 hr 17 min",
                  text: controller.duration,
                  size: 20,
                  color: Color(0xff27AE60),
                ),
                width(size.width * 0.015),
                CustomSmallText(
                  text: controller.distance,
                  size: 14,
                ),
              ],
            ),
            height(size.height * 0.025),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.navigationPageRoute, arguments: [
                      controller.directionsResult,
                      controller.source,
                      controller.destination
                    ]);
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * .45,
                    decoration: BoxDecoration(
                      color: Color(0xff0047C3),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 11),
                          blurRadius: 22,
                          color: Color(0xff000000).withOpacity(0.21),
                        )
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/route.svg"),
                        width(size.width * 0.04),
                        CustomBigText(
                          text: "Start your Trip",
                          size: 14,
                          color: Color(0xffDEEAFF),
                        ),
                      ],
                    ),
                  ),
                ),
                width(size.width * 0.13),
                Obx(
                  () => controller.isSaved.value
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/check.svg",
                            ),
                            width(size.width * 0.015),
                            CustomBigText(
                              text: "Saved",
                              size: 16,
                              color: Color(0xff219653),
                            )
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            controller.saveCount.value = 1;
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/bookmark.svg"),
                              width(size.width * 0.015),
                              CustomBigText(
                                text: "Save",
                                size: 16,
                                color: Color(0xff0047C3),
                              )
                            ],
                          ),
                        ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _tripNameCard(context) {
    return AnimatedPositioned(
      bottom: MediaQuery.of(context).viewInsets.bottom + size.height * .04,
      duration: Duration(milliseconds: 50),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.02),
        height: size.height * .45,
        width: size.width * .90,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xff000000).withOpacity(.12)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSmallText(
              text: "Name Your Trip",
              size: 11,
              letterspacing: -0.32,
            ),
            height(size.height * 0.007),
            Container(
              height: size.height * 0.06,
              width: size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffF2F2F2),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.04),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Trip Name",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffBDBDBD),
                    ),
                  ),
                ),
              ),
            ),
            height(size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/ev_charger.svg"),
                    width(size.width * 0.015),
                    CustomBigText(
                      text: "Reservation",
                      size: 12,
                      color: Color(
                        0xff0047C3,
                      ),
                      letterspacing: -0.408,
                    )
                  ],
                ),
                CustomSmallText(
                  text: controller.distance,
                  size: 11,
                )
              ],
            ),
            height(size.height * 0.025),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.008),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/adjust1.svg"),
                  width(size.width * 0.015),
                  CustomSmallText(
                    text: "Starting Point",
                    size: 12,
                    letterspacing: -0.408,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.017),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/line.svg"),
                  width(size.width * 0.03),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: CustomBigText(
                      text: controller.source.value.description ?? '',
                      size: 14,
                      color: Color(0xff4F4F4F),
                      letterspacing: -0.408,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.008),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.001),
                    child: SvgPicture.asset(
                      "assets/svg/location_on1.svg",
                    ),
                  ),
                  width(size.width * 0.015),
                  CustomSmallText(
                    text: "Ending Point",
                    size: 12,
                    letterspacing: -0.408,
                  )
                ],
              ),
            ),
            height(size.height * 0.004),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomBigText(
                text: controller.destination.value.description ?? '',
                size: 14,
                color: Color(0xff4F4F4F),
                letterspacing: -0.408,
              ),
            ),
            height(size.height * 0.04),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * .4,
                    decoration: BoxDecoration(
                      color: Color(0xff0047C3),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 11),
                          blurRadius: 22,
                          color: Color(0xff000000).withOpacity(0.21),
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.saveCount.value = 2;
                        controller.isSaved.value = true;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/bookmark.svg",
                            color: Color(0xffF2F2F2),
                          ),
                          width(size.width * 0.015),
                          CustomBigText(
                            text: "Save",
                            size: 16,
                            color: Color(0xffF2F2F2),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                width(size.width * 0.13),
                InkWell(
                  onTap: () {
                    controller.saveCount.value = 0;
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/delete.svg"),
                      width(size.width * 0.015),
                      CustomBigText(
                        text: "Discard",
                        size: 16,
                        color: Color(0xffEB5757),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _trip01Card() {
    return Positioned(
      bottom: size.height * .04,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.02),
        height: size.height * .38,
        width: size.width * .90,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xff000000).withOpacity(.12)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/conversation_path.svg",
                  color: Color(0xffF2994A),
                  height: size.height * 0.02,
                  width: size.width * 0.04,
                ),
                width(size.width * 0.01),
                CustomBigText(
                  text: "Trip 01",
                  size: 16,
                )
              ],
            ),
            height(size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/ev_charger.svg"),
                    width(size.width * 0.015),
                    CustomBigText(
                      text: "Reservation",
                      size: 12,
                      color: Color(
                        0xff0047C3,
                      ),
                      letterspacing: -0.408,
                    )
                  ],
                ),
                CustomSmallText(
                  text: controller.distance,
                  size: 11,
                )
              ],
            ),
            height(size.height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.008),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/adjust1.svg"),
                  width(size.width * 0.015),
                  CustomSmallText(
                    text: "Starting Point",
                    size: 12,
                    letterspacing: -0.408,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.017),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/line.svg"),
                  width(size.width * 0.03),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: CustomBigText(
                      text: controller.source.value.description ?? '',
                      size: 14,
                      color: Color(0xff4F4F4F),
                      letterspacing: -0.408,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.008),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.001),
                    child: SvgPicture.asset(
                      "assets/svg/location_on1.svg",
                    ),
                  ),
                  width(size.width * 0.015),
                  CustomSmallText(
                    text: "Ending Point",
                    size: 12,
                    letterspacing: -0.408,
                  )
                ],
              ),
            ),
            height(size.height * 0.004),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomBigText(
                text: controller.destination.value.description ?? '',
                size: 14,
                color: Color(0xff4F4F4F),
                letterspacing: -0.408,
              ),
            ),
            height(size.height * 0.04),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.025),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * .4,
                      decoration: BoxDecoration(
                        color: Color(0xff39FF8E).withOpacity(.23),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: size.width * 0.015),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/check.svg",
                            ),
                            width(size.width * 0.015),
                            CustomBigText(
                              text: "Saved",
                              size: 16,
                              color: Color(0xff219653),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                width(size.width * 0.07),
                CustomBigText(
                  ontap: () {
                    controller.saveCount.value = 0;
                  },
                  text: "Back to Trips",
                  size: 16,
                  color: Color(0xff0047C3),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
