import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/directions_screen_controller.dart';
import 'package:get/get.dart';
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
                      myLocationEnabled: true,
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
              startYourTripCard(),
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
                // Padding(
                //     padding: EdgeInsets.only(
                //       left: size.width * 0.055,
                //       right: size.width * 0.055,
                //     ),
                //     child: InkWell(
                //       onTap: () async {
                //         await controller
                //             .getDirectionsPolyline();
                //         Get.toNamed(
                //             Routes.directionsPageRoute,arguments: controller.directionsResult);
                //       },
                //       child: Container(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: size.width * 0.065),
                //         height: size.height * 0.064,
                //         width: size.width * .45,
                //         decoration: BoxDecoration(
                //           borderRadius:
                //               BorderRadius.circular(65),
                //           color: Color(0xff0047C3),
                //         ),
                //         child: Center(
                //           child: Row(
                //             mainAxisAlignment:
                //                 MainAxisAlignment.spaceEvenly,
                //             children: [
                //               SvgPicture.asset(
                //                   'assets/svg/route.svg'),
                //               Text(
                //                 'Find route',
                //                 style: TextStyle(
                //                   fontFamily: "Poppins",
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 15,
                //                   color: Color(0xffF2F2F2),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     )),
                // Visibility(
                //   visible: false,
                //   child: Padding(
                //     padding: EdgeInsets.only(top: 8.0),
                //     child: CustomText(
                //       text: 'Empty Fields',
                //       size: 14,
                //       color: Color(0xffEB5757),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }

  Widget startYourTripCard() {
    return Positioned(
        bottom: size.height * 0.04,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .045),
                          child: Row(children: []))
                    ]))));
  }
}
