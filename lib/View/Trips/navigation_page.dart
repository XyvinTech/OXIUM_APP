import 'package:flutter/material.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/navigation_screen_controller.dart';
import '../../Singletones/map_functions.dart';
import '../../constants.dart';

class NavigationScreen extends GetView<NavigationScreenController> {
  const NavigationScreen({super.key});

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
            ],
          ),
        ));
  }

  Widget yourDestinationCard() {
    return Positioned(
        top: size.height * 0.04,
        width: size.width * .90,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: size.height * 0.07,
            bottom: size.height * 0.02,
          ),
          height: size.height * 0.22,
          width: size.width * .90,
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
            children: [CustomText(text: 'text')],
          ),
        ));
  }
}
