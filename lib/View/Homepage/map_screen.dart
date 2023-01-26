import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Singletones/map_functions.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/customText.dart';

class MapScreen extends GetView<HomePageController> {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
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
                        markers: MapFunctions().markers_homepage,
                        onMapCreated: (controller) {
                          MapFunctions().controller = controller;
                          MapFunctions().setMapStyle(controller);
                          kLog('loading map');
                          MapFunctions().getCurrentPosition();
                        },
                        onTap: (value) {
                          print(value);
                          MapFunctions().addMarkerHomePage(
                              name: value.latitude.toString(),
                              latLng: value,
                              isGreen: false);
                          controller.reload++;
                          print(MapFunctions().markers_homepage);
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: size.height * .07,
                    left: 0,
                    right: 0,
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.drawerKey.currentState!.openDrawer();
                            },
                            child: Container(
                              padding: EdgeInsets.all(size.height * .024),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400, blurRadius: 8)
                              ], shape: BoxShape.circle, color: Colors.white),
                              child: SvgPicture.asset('assets/svg/list.svg'),
                            ),
                          ),
                          width(size.width * .02),
                          Container(
                            height: size.height * .057,
                            width: size.width * .75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 8)
                                ],
                                color: Colors.white),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.searchPageRoute);
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: CustomText(
                                          text: 'Search',
                                          color: Color(0xffBDBDBD),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 16.0),
                                      child: SvgPicture.asset(
                                          'assets/svg/search-zoom-in.svg'),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: size.height * .19,
                    right: size.width * .03,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.notificationPageRoute);
                      },
                      child: Container(
                          padding: EdgeInsets.all(size.width * .037),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10, color: Colors.grey.shade400)
                              ]),
                          child:
                              SvgPicture.asset('assets/svg/notifications.svg')),
                    )),
                Positioned(
                    bottom: size.height * .11,
                    right: size.width * .03,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.filterPageRoute);
                      },
                      child: Container(
                          padding: EdgeInsets.all(size.width * .037),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10, color: Colors.grey.shade400)
                              ]),
                          child: SvgPicture.asset('assets/svg/tune.svg')),
                    )),
                Positioned(
                    bottom: size.height * .03,
                    right: size.width * .03,
                    child: Container(
                        padding: EdgeInsets.all(size.width * .037),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10, color: Colors.grey.shade400)
                            ]),
                        child: InkWell(
                          onTap: () async {
                            MapFunctions().animateToNewPosition(LatLng(
                                MapFunctions().curPos!.latitude,
                                MapFunctions().curPos!.longitude));
                          },
                          child: SvgPicture.asset(
                              'assets/svg/location_searching.svg'),
                        ))),
              ],
            ),
          ))
      
      ;
  }
}