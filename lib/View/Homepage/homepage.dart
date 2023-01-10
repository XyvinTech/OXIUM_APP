import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Model/chargingCafeModel.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/Utils/my_flutter_app_icons.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Utils/routes.dart';

class HomePageScreen extends GetView<HomePageController> {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF0F1F6),
      body: Container(
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
                          Container(
                            padding: EdgeInsets.all(size.height * .024),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400, blurRadius: 8)
                            ], shape: BoxShape.circle, color: Colors.white),
                            child: InkWell(
                                onTap: () {
                                  //TODO: open menu
                                },
                                child: SvgPicture.asset('assets/svg/list.svg')),
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
          )),
      floatingActionButton: FloatingActionButton(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xff00FFB3),
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(
            'assets/svg/qr_scan.svg',
            width: 20,
            height: 20,
          ),
        ),
        onPressed: () {
          showBottomSheetWhenClickedOnMarker(null);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: [
            CustomIcon.map,
            CustomIcon.bolt,
            CustomIcon.mode_of_travel,
            CustomIcon.account_balance_wallet,
          ],
          activeIndex: controller.activeIndex.value,
          height: size.height * .085,
          activeColor: Color(0xff0047C3),
          inactiveColor: Color(0xffBDBDBD),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) => controller.activeIndex.value = index,
          //other params
        ),
      ),
    );
  }
}

showBottomSheetWhenClickedOnMarker(ChargingCafeModel? model) {
  Get.bottomSheet(
    Container(
      height: size.height * .32,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(children: [
        height(size.height * .01),
        Container(
          height: size.height * .006,
          width: size.width * .25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffD9D9D9)),
        ),
        height(size.height * .05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Row(
            children: [
              //TODO: Replace the CachedNetworkImage with Image.asset() below
              // CachedNetworkImage(imageUrl: imageUrl)
              Expanded(
                  flex: 3, child: Image.asset('assets/svg/cafe_image.png')),

              width(size.width * .035),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * .023,
                      width: size.width * .12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFE1C7)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffF2994A),
                              size: 15,
                            ),
                            CustomText(
                                text: '5.6',
                                size: 12,
                                color: Color(0xffF2994A)),
                          ]),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'Calista Cafe',
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.bold),
                        width(size.width * .017),
                        CustomText(
                            text: '13 km Away',
                            color: Color(0xff828282),
                            fontWeight: FontWeight.normal,
                            size: 12),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/wc.svg'),
                            width(size.width * .01),
                            CustomText(
                                text: 'Rest Room',
                                color: Color(0xff828282),
                                fontWeight: FontWeight.normal,
                                size: 12),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/hotel.svg'),
                            width(size.width * .01),
                            CustomText(
                                text: 'Hotel',
                                color: Color(0xff828282),
                                fontWeight: FontWeight.normal,
                                size: 12),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/local_cafe.svg'),
                            width(size.width * .01),
                            CustomText(
                                text: 'Cafe',
                                color: Color(0xff828282),
                                fontWeight: FontWeight.normal,
                                size: 12),
                          ],
                        ),
                      ],
                    ),
                    height(size.height * .01),
                    CustomText(
                        text: 'Mannampatta . Near Govt. College , Kearal ',
                        size: 12,
                        color: Color(0xff4F4F4F))
                  ],
                ),
              )
            ],
          ),
        ),
        height(size.height * .05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * .04,
                padding: EdgeInsets.symmetric(horizontal: size.width * .035),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff219653)),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/tick.svg'),
                    width(size.width * .01),
                    CustomText(
                        text: 'Charges Available',
                        size: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF2F2F2)),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(size.width * .02),
                    margin: EdgeInsets.symmetric(horizontal: size.width * .01),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffBDBDBD))),
                    child: SvgPicture.asset('assets/svg/share.svg'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: size.width * .01),
                    padding: EdgeInsets.all(size.width * .02),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffBDBDBD))),
                    child: SvgPicture.asset('assets/svg/telegram.svg'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: size.width * .01),
                    padding: EdgeInsets.all(size.width * .02),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffBDBDBD))),
                    child: SvgPicture.asset('assets/svg/favorite.svg'),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    ),
  );
}
