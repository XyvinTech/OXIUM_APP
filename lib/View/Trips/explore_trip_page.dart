import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/directions_screen_controller.dart';
import 'package:freelancer_app/Controller/explore_trip_screen_controller.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Singletones/map_functions.dart';
import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/apptext.dart';
import '../Widgets/rounded_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreTripScreen extends GetView<ExploreTripScreenController> {
  const ExploreTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Obx(
            () => Container(
              padding: EdgeInsets.all(controller.reload.value * 0),
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
                  MapFunctions().setMapFitToPolyline(MapFunctions().polylines,
                      MapFunctions().dirMapController!);
                  controller.reload++;
                },
              ),
            ),
          ),
          _tripStartCard(),
          _trip01Card()
        ],
      ),
    );
  }

  Widget _tripStartCard() {
    return Positioned(
        top: 10,
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.02),
              height: size.height * .12,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  width(2.w),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff828282),
                    ),
                  ),
                  width(5.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            Expanded(
                              child: CustomBigText(
                                text: 'Trip 01 For the best feelings',
                                textOverflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                size: 16.5,
                              ),
                            ),
                            width(size.width * 0.01),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.h, horizontal: 15.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff9B51E0).withOpacity(.1)),
                              child: CustomText(
                                  text: 'Finished',
                                  size: 14,
                                  color: Color(0xff9B51E0),
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xff828282),
                              size: 16,
                            ),
                            width(5.w),
                            CustomText(
                                text: '12 Jun 2022',
                                size: 15,
                                color: Color(0xff828282))
                          ],
                        ),
                      ],
                    ),
                  ),
                  width(10.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Color(0xff2F80ED)),
                    child: CustomText(
                        text: 'Start',
                        size: 15,
                        fontWeight: FontWeight.bold,
                        color: kwhite),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget _trip01Card() {
    return Positioned(
      bottom: 35.h,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06, vertical: size.height * 0.02),
          height: size.height * .28,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    text: '324 KMS',
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.02),
                        child: CustomBigText(
                          text: 'S4 Bt , Elam Street , Jarkhand',
                          size: 15.sp,
                          textOverflow: TextOverflow.ellipsis,
                          color: Color(0xff4F4F4F),
                          letterspacing: -0.408,
                        ),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: CustomBigText(
                    text: 'S4 Bt , Elam Street , Jarkhand',
                    textOverflow: TextOverflow.ellipsis,
                    size: 15.sp,
                    color: Color(0xff4F4F4F),
                    letterspacing: -0.408,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
