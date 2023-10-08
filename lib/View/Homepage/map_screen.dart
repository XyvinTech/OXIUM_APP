import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Singletones/map_functions.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/appbutton.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  HomePageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.all(controller.reload.value * 0 +
                        MapFunctions().reload.value * 0),
                    child: GoogleMap(
                      // liteModeEnabled: true,
                      compassEnabled: false,
                      mapToolbarEnabled: false,
                      onCameraMoveStarted: () {
                        if (MapFunctions().isIdle)
                          MapFunctions().isFocused = false;
                      },
                      onCameraIdle: () {
                        if (!MapFunctions().isIdle) {
                          controller.debouncer.run(() {
                            kLog('camera idle');
                            MapFunctions().isIdle = true;
                          });
                        }
                      },
                      initialCameraPosition:
                          MapFunctions().initialPosition.value,
                      trafficEnabled: false,
                      myLocationEnabled: false,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      markers: MapFunctions().markers_homepage,
                      onMapCreated: (controller) {
                        MapFunctions().controller = controller;
                        // MapFunctions().setMapStyle(controller);
                        kLog('loading map');
                        // MapFunctions().getCurrentPosition();
                      },
                      onTap: (value) {
                        controller.getNearestChargestations(Position(
                            longitude: value.longitude,
                            latitude: value.latitude,
                            timestamp: DateTime.now(),
                            accuracy: 0,
                            altitude: 0,
                            heading: 0,
                            speed: 0,
                            speedAccuracy: 0));
                        // MapFunctions().addMyPositionMarker(MapFunctions().curPos,
                        //     MapFunctions().markers_homepage);
                        // MapFunctions().addMarkerHomePage(
                        //     id: value.latitude.toString(),
                        //     latLng: value,
                        //     isBusy: false,
                        //     controller: controller);
                        controller.reload++;
                        
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.drawerKey.currentState!.openDrawer();
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: size.height * .024,
                                top: size.height * .024,
                              ),
                              // decoration: BoxDecoration(boxShadow: [
                              //   BoxShadow(
                              //       color: Colors.grey.shade400, blurRadius: 8)
                              // ], shape: BoxShape.circle, color: Colors.white),
                              child: SvgPicture.asset(
                                  'assets/svg/drawer_icon.svg'),
                            ),
                          ),
                          width(size.width * .035),
                          Container(
                            height: size.height * .057,
                            width: size.width * .75,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     boxShadow: [
                            //       BoxShadow(
                            //           color: Colors.grey.shade400,
                            //           blurRadius: 8)
                            //     ],
                            //     color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.searchPageRoute);
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: CustomBigText(
                                              text: 'Stations',
                                              color: Color.fromARGB(
                                                  255, 133, 133, 133),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        width(size.width * 0.35),
                                        Padding(
                                          padding: EdgeInsets.only(right: 16.0),
                                          child: SvgPicture.asset(
                                              'assets/svg/search-zoom-in.svg'),
                                        ),
                                      ]),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.favouritePageRoute);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: SvgPicture.asset(
                                        'assets/svg/favourite_icon.svg'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              // Positioned(
              //     bottom: size.height * .19,
              //     right: size.width * .03,
              //     child: InkWell(
              //       onTap: () {
              //         Get.toNamed(Routes.filterPageRoute,
              //             arguments: controller.station_marker_list);
              //       },
              //       child: Container(
              //           padding: EdgeInsets.all(size.width * .037),
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.white,
              //               boxShadow: [
              //                 BoxShadow(
              //                     blurRadius: 10, color: Colors.grey.shade400)
              //               ]),
              //           child: Stack(
              //             alignment: Alignment.topRight,
              //             children: [
              //               SvgPicture.asset('assets/svg/tune.svg'),
              //               Obx(
              //                 () => !appData.notificationAvailable.value
              //                     ? Container()
              //                     : Container(
              //                         height: 10.h,
              //                         width: 10.h,
              //                         decoration: BoxDecoration(
              //                             shape: BoxShape.circle,
              //                             color: Colors.red),
              //                       ),
              //               )
              //             ],
              //           )),
              //     )),
              // Positioned(
              //     bottom: size.height * .11,
              //     right: size.width * .03,
              //     child: InkWell(
              //       onTap: () async {
              //         var res = await MapFunctions().getCurrentPosition();
              //         if (res != null) MapFunctions().curPos = res;

              //         MapFunctions().animateToNewPosition(
              //             LatLng(
              //               MapFunctions().curPos.latitude,
              //               MapFunctions().curPos.longitude,
              //             ),
              //             bearing: 0);
              //       },
              //       child: Container(
              //           padding: EdgeInsets.all(size.width * .037),
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.white,
              //               boxShadow: [
              //                 BoxShadow(
              //                     blurRadius: 10, color: Colors.grey.shade400)
              //               ]),
              //           child: SvgPicture.asset(
              //               'assets/svg/location_searching.svg')),
              //     )),
              Obx(
                () => Visibility(
                  visible: controller.isCharging.value,
                  child: Positioned(
                      top: 80.h,
                      left: 10.w,
                      right: 10.w,
                      child: InkWell(
                        onTap: () {
                          controller.getActiveBooking(true);
                        },
                        child: Container(
                          // width: MediaQuery.of(context).size.width * .9,
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: Color(0xff2D9CDB),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(children: [
                              SvgPicture.asset('assets/svg/bolt_small.svg'),
                              width(20.w),
                              Text(
                                'Charging in Progress',
                                style: GoogleFonts.montserrat().copyWith(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(
                                (Icons.arrow_forward_ios),
                                color: Colors.white,
                              )
                            ]),
                          ),
                        ),
                      )),
                ),
              ),
              Positioned(
                bottom: size.height * .01,
                right: size.width * .00,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Column(
                        children: [
                          PositionedButton(
                            svgUrl: 'assets/svg/tune.svg',
                            svgColor: Colors.grey.shade700,
                            bgColor: Colors.white,
                            onTap: controller.onFilterTap,
                          ),
                          PositionedButton(
                              svgUrl: 'assets/svg/location_searching.svg',
                              svgColor: Colors.grey.shade700,
                              bgColor: Colors.white,
                              onTap: controller.onLocationTap),
                          PositionedButton(
                            svgUrl: 'assets/svg/qr_scan.svg',
                            svgColor: Colors.white,
                            bgColor: kOnboardingColors,
                            onTap: controller.onQrScan,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // height: size.height * 0.3,
                      width: size.width,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      // color: Colors.amber,
                      child: Obx(
                        () => CarouselSlider(
                          carouselController: controller.carouselController ,
                          items: controller.cards,
                          options: CarouselOptions(
                            height: 150.h,
                            enlargeFactor: 0.2,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            padEnds: true,
                            onPageChanged: (index, reason) {
                              MapFunctions().animateToNewPosition(LatLng(
                                  controller
                                      .station_marker_list[index].lattitude,
                                  controller
                                      .station_marker_list[index].longitude));
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Positioned(
              //     bottom: size.height * .03,
              //     right: size.width * .03,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: PageView(
              //           controller: controller.pageController,
              //           children: [
              //             Container(
              //               height: size.height * 0.2,
              //               width: size.width * 0.85,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(20),
              //                 color: Colors.white,
              //               ),
              //             ),
              //             Container(
              //               height: size.height * 0.2,
              //               width: size.width * 0.85,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(20),
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ]),
              //     ))
              // Positioned(
              //     bottom: size.height * .03,
              //     right: size.width * .03,
              //     child: Container(
              //         padding: EdgeInsets.all(size.width * .037),
              //         decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: kOnboardingColors,
              //             boxShadow: [
              //               BoxShadow(
              //                   blurRadius: 10, color: Colors.grey.shade400)
              //             ]),
              //         child: InkWell(
              //           onTap: () {
              //             Get.toNamed(Routes.qrScanPageRoute);
              //           },
              //           child: SvgPicture.asset(
              //             'assets/svg/qr_scan.svg',
              //             height: 22,
              //             width: 22,
              //             color: Colors.white,
              //           ),
              //         ))),
            ],
          )),
    );
  }
}
