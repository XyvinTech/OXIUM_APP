import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/navigation_screen_controller.dart';
import '../../Singletones/map_functions.dart';
import '../../constants.dart';

class NavigationScreen extends GetView<NavigationScreenController> {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(MapFunctions().markers);
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Obx(
                () => Container(
                  padding: EdgeInsets.all(controller.reload.value * 0 +
                      MapFunctions().reload.value * 0),
                  child: GoogleMap(
                    initialCameraPosition: MapFunctions().initialPosition.value,
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
              yourDestinationCard(),

              // startYourTripCard(),
            ],
          ),
        ),
        stepWidget(),
        bottomWidget(),
      ],
    );
  }

  Widget yourDestinationCard() {
    return Positioned(
      top: size.height * 0.0,
      child: Obx(
        () => AnimatedContainer(
            width: size.width * .90,
            height: controller.chargingCardExpanded.value
                ? size.height * .7
                : size.height * .16,
            duration: Duration(milliseconds: 300),
            alignment: Alignment.center,
            // width: size.width * .90,
            // height: size.height * .30,
            margin: EdgeInsets.all(size.width * .1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .035,
                vertical: size.height * .025,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Next Charging Station',
                          size: 13,
                          color: Color(0xff828282)),
                      InkWell(
                        onTap: () {
                          controller.chargingCardExpanded.value =
                              !controller.chargingCardExpanded.value;
                        },
                        child: CustomText(
                            text: controller.chargingCardExpanded.value
                                ? 'View Less'
                                : 'View More',
                            size: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0047C3)),
                      ),
                    ],
                  ),
                  // (controller.chargingCardExpanded.value)
                  //     ? height(size.height * .03)
                  //     : Spacer(
                  //         flex: 1,
                  //       ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                        itemCount:
                            !controller.chargingCardExpanded.value ? 1 : 20,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return nearestCharginStationCard(index);
                        })),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget nearestCharginStationCard(int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * .03),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/coffee.png',
              height: size.width * .1,
              width: size.width * .1,
            ),
          ),
          width(size.width * .025),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: 'Calista cafe',
                    color: Color(0xff4f4f4f),
                    size: 14,
                    fontWeight: FontWeight.bold),
                CustomText(
                    text: 'DC 45 kWh',
                    color: Color(0xff828282),
                    size: 13,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    text: '245 Kms',
                    color: Color(0xff4f4f4f),
                    size: 14,
                    fontWeight: FontWeight.bold),
                CustomText(
                    text: 'Away',
                    color: Color(0xff828282),
                    size: 13,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget stepWidget() {
    return Container(
      height: size.height * .10,
      decoration: BoxDecoration(color: Color(0xff2B2B2B)),
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'After 300 m',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(.6),
              ),
            ),
            Text(
              'Take Right',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )
          ],
        ),
        Spacer(),
        SvgPicture.asset(
          'assets/svg/alt_route.svg',
          color: Colors.green,
        )
      ]),
    );
  }

  Widget bottomWidget() {
    return Container(
      height: size.height * .10,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booked : 4:30 pm',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xffAAAAAA),
              ),
            ),
            Text(
              '12 km Away',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff5c5c5c),
              ),
            )
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .007),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black)),
            child: Row(
              children: [
                Text(
                  'End',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
                Icon(Icons.close)
              ],
            ),
          ),
        )
      ]),
    );
  }
}
