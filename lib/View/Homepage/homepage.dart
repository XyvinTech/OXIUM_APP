import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/Utils/my_flutter_app_icons.dart';
import 'package:freelancer_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageScreen extends GetView<HomePageController> {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Container(
                  child: Obx(
                    () => GoogleMap(
                      initialCameraPosition:
                          MapFunctions().initialPosition.value,
                      trafficEnabled: false,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      onMapCreated: (controller) {
                        MapFunctions().controller = controller;
                        // map.setMapStyle(controller);
                        kLog('loading map');
                        MapFunctions().getCurrentPosition();
                      },
                    ),
                  ),
                ),
                Positioned(
                    bottom: size.height * .19,
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
                        child:
                            SvgPicture.asset('assets/svg/notifications.svg'))),
                Positioned(
                    bottom: size.height * .11,
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
                        child: SvgPicture.asset('assets/svg/tune.svg'))),
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
              borderRadius: BorderRadius.circular(50)),
          child: SvgPicture.asset(
            'assets/svg/qr_scan.svg',
            width: 20,
            height: 20,
          ),
        ),
        onPressed: () {},
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
