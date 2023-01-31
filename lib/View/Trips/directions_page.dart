import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/directions_screen_controller.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Singletones/map_functions.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/customText.dart';

class DirectionsScreen extends GetView<DirectionsScreenController> {
  const DirectionsScreen({super.key});

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
                        // MapFunctions().addMarkerHomePage(
                        //     name: value.latitude.toString(),
                        //     latLng: value,
                        //     isGreen: false,
                        //     controller: controller);
                        controller.reload++;
                        print(MapFunctions().markers_homepage);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
