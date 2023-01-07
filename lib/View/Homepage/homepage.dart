import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/constants.dart';
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
              child: Container(
                // margin: EdgeInsets.only(top: size.height * .02),
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: size.height * .24,
                width: size.width * .95,
                // color: Colors.amber,
                child: Obx(
                  () => GoogleMap(
                    initialCameraPosition: MapFunctions().initialPosition.value,
                    trafficEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    onMapCreated: (controller) {
                      MapFunctions().controller = controller;
                      // map.setMapStyle(controller);
                      MapFunctions().getCurrentPosition();
                    },
                  ),
                ),
              ),
            )));
  }
}
