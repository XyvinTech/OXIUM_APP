// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/charging_screen_controller.dart';
import 'package:freelancer_app/Controller/filter_screen_controller.dart';
import 'package:freelancer_app/Controller/trips_screen_controller.dart';
import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:freelancer_app/Model/stationMarkerModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Singletones/injector.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/Singletones/socketRepo.dart';
import 'package:freelancer_app/Utils/debouncer.dart';
import 'package:freelancer_app/Utils/image_byte_converter.dart';
import 'package:freelancer_app/Utils/local_notifications.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/bookingModel.dart';
import '../Singletones/app_data.dart';
import '../Utils/routes.dart';
import '../View/Homepage/homepage.dart';
import 'chargePage_controller.dart';
import 'notification_screen_controller.dart';

class HomePageController extends GetxController {
  // RxDouble height = 80.0.obs;
  RxString name = ''.obs;
  RxString done = 'do'.obs;
  RxInt activeIndex = 0.obs;
  RxInt reload = 0.obs;
  // RxBool isCharging = false.obs;

  //NEW HELP PAGE STARTS
  Rx<CarouselController> carouselController = CarouselController().obs;
  RxDouble currentIndex = 0.0.obs;
  String phnNumber = "+919778687615";
  RxList carouselText = [
    "GOEC super charging station Provides High ROI",
    "operate your charging station from anywhere in the world without human intervention.",
    "For a future-focused business, capitalize on the growing EV market."
  ].obs;
  RxList carouselImage = [
    "assets/images/carouselOne.png",
    "assets/images/carouselTwo.png",
    "assets/images/carouselThree.png",
  ].obs;
  //NEW HELP PAGE ENDS

  //NEW NOTIFICATION PAGE STARTS
  // RxList<NotificationModel> modelList = RxList([]);
  // ENDS

  //Mapscreen Starts
  PageController cardController = PageController();
  //Ends

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  PageController pageController = PageController();
  PanelController panelController = PanelController();
  final ChargeScreenController chargeScreenController =
      Get.put(ChargeScreenController());
  final tripsScreenController = Get.put(TripsScreenController());
  final WalletPageController walletPageController =
      Get.put(WalletPageController());
  final NotificationScreenController notificationController =
      Get.put(NotificationScreenController());
  List<StationMarkerModel> station_marker_list = [];
  Debouncer debouncer = Debouncer(milliseconds: 3000);
  RxList<Widget> cards = RxList();

  @override
  void onInit() async {
    super.onInit();
    await _initImages();
    Position? pos = await MapFunctions().getCurrentPosition();
    if (pos != null) {
      getNearestChargestations(pos);
      MapFunctions().addMyPositionMarker(pos, MapFunctions().markers_homepage);
    }
    Future.delayed(Duration(milliseconds: 1000), () {
      MapFunctions().myPositionListener();
    });
  }

  onClose() {
    MapFunctions().dispose();
    NotificationService().cancelLocalNotification(1);
    super.onClose();
    SocketRepo().closeSocket();
    Injector().dispose();
  }

  _initImages() async {
    MapFunctions().bytesBlue = await ImageByteConverter.getBytesFromAsset(
        "assets/svg/blue_marker.png", 70);
    MapFunctions().bytesGreen = await ImageByteConverter.getBytesFromAsset(
        "assets/svg/green_marker.png", 70);
    MapFunctions().bytesGray = await ImageByteConverter.getBytesFromAsset(
        "assets/svg/gray_marker.png", 70);
    MapFunctions().navigationMarker =
        await ImageByteConverter.getBytesFromAsset(
            "assets/images/pointer.png", 70);
    MapFunctions().carMarker = await ImageByteConverter.getBytesFromAsset(
        "assets/images/CSAR.png", 70);
    MapFunctions().myMarker = await ImageByteConverter.getBytesFromAsset(
        "assets/images/myMarker.png", 60);
  }

  getNearestChargestations(Position pos) async {
    showLoading('Fetching nearby charge stations.\nPlease wait...');
    await getActiveBooking(false, refresh: true);
    station_marker_list = await CommonFunctions().getNearestChargstations(pos);
    hideLoading();
    /*Apply filter if applicable and use filterpage station_marker_list*/
    var _filterController = await Get.put(FilterScreenController());
    _filterController.station_marker_List = station_marker_list.toList();
    _filterController.applyFilter();
    _filterController.onClose();

    // assignCardsToMapScreen(_filterController.station_marker_List);
    // MapFunctions().markers_homepage.clear();
    // int index = 0;
    // _filterController.station_marker_List.forEach((element) {
    //   MapFunctions().addMarkerHomePage(
    //     id: element.id.toString(),
    //     latLng: LatLng(element.lattitude, element.longitude),
    //     isBusy: element.isBusy,
    //     status: element.charger_status.trim(),
    //     // element.charger_status.trim() != 'Connected' || element.isBusy,
    //     controller: this,
    //     carouselIndex: index,
    //   );
    //   index++;
    // });
  }

  assignCardsToMapScreen(List<StationMarkerModel> list) {
    cards.value = list.map((e) {
      double distance = 0;
      distance = (MapFunctions.distanceBetweenCoordinates(
                  MapFunctions().curPos.latitude,
                  MapFunctions().curPos.longitude,
                  e.lattitude,
                  e.longitude) /
              1000.0)
          .toPrecision(2);
      List<String> amenities = e.amenities.split(',');
      String available = e.charger_status.contains(',Connected') && e.isBusy
          ? kBusy
          : e.charger_status.contains(',Connected')
              ? kAvailable
              : kUnavailable;
      List<String> connector = e.charger_type.split(',');
      int connectorCount = 0;
      if (connector.length > 2) {
        connectorCount = connector.length - 2;
        connector = connector.getRange(0, 2).toList();
      }
      return GestureDetector(
        onTap: () {
          getChargeStationDetails(e.id.toString(), isCardTap: true);
        },
        child: Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            // height: size.height * 0.2,
            // width: size.width * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .00),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                          text: e.locationName,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color(0xff4F4F4F),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    width(size.width * .017),
                                  ],
                                ),
                                CustomText(
                                    text: '${distance} km away',
                                    color: Color(0xff828282),
                                    fontWeight: FontWeight.normal,
                                    size: 12),
                                if (amenities.isNotEmpty &&
                                    amenities[0].isNotEmpty) ...[
                                  height(8.h),
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Row(
                                            children: amenities
                                                .map(
                                                  (e) => Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10.w),
                                                    child: SvgPicture.asset(
                                                        'assets/svg/${e}.svg'),
                                                  ),
                                                )
                                                .toList()),
                                        // width(10.w),
                                        Container(
                                          height: size.height * .023,
                                          width: size.width * .14,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xffFFE1C7)),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xffF2994A),
                                                  size: 15,
                                                ),
                                                CustomText(
                                                    text: e.rating
                                                        .toStringAsFixed(2),
                                                    size: 12,
                                                    color: Color(0xffF2994A)),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  height(8.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                            text: e.address,
                                            overflow: TextOverflow.ellipsis,
                                            color: Color(0xff4f4f4f),
                                            fontWeight: FontWeight.normal,
                                            size: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // height(size.height * .05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: connector
                                  .map((e) => e.isEmpty
                                      ? SizedBox()
                                      : Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            // height: 12,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 2.w),
                                            margin: EdgeInsets.only(right: 5.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  184, 210, 255, 0.6),
                                            ),
                                            child: Center(
                                              child: CustomText(
                                                text: e,
                                                size: 10.sp,
                                                color: Color(0xff0047C3),
                                              ),
                                            ),
                                          ),
                                        ))
                                  .toList(),
                            ),
                            if (connectorCount > 0)
                              CustomText(
                                text: "+$connectorCount",
                                size: 10.sp,
                                color: Color(0xff0047C3),
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            available == kAvailable
                                ? SvgPicture.asset('assets/svg/tick.svg',
                                    colorFilter: ColorFilter.mode(
                                        Colors.green, BlendMode.srcIn))
                                : Icon(
                                    Icons.info_outline,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                            width(size.width * .01),
                            CustomText(
                                text: '$available',
                                overflow: TextOverflow.ellipsis,
                                size: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: available == kAvailable
                                    ? Color(0xff219653)
                                    : available == kBusy
                                        ? Color.fromARGB(255, 221, 90, 90)
                                        : Colors.grey.shade400),
                          ],
                        ),
                      ],
                    )
                  ]),
            )),
      );
    }).toList();
  }

  getActiveBooking(bool isClickOnCard, {bool refresh = false}) async {
    BookingModel _bookingModel = await CommonFunctions().getActiveBooking();
    if (_bookingModel.bookingId != -1) {
      // ChargingStatusModel _status = await CommonFunctions()
      //     .getChargingStatus("${_bookingModel.bookingId}");

      // isCharging.value = true;
      if (refresh && !SocketRepo().isCharging.value) {
        appData.tempBookingModel = _bookingModel;
        ChargingScreenController _chargingController =
            await Get.put(ChargingScreenController());
        await _chargingController.getChargingStatus(_bookingModel.bookingId);
        _chargingController.onClose();
        appData.tempBookingModel = kBookingModel;
        return;
      } else if (!isClickOnCard) {
        ChargingScreenController _chargingController =
            await Get.put(ChargingScreenController());
        await _chargingController.getChargingStatus(_bookingModel.bookingId);
        _chargingController.onClose();
        return;
      }
      kLog(_bookingModel.toJson());
      appData.qr =
          '${0}-${_bookingModel.chargerName}-${_bookingModel.chargingpoint}-${_bookingModel.bookedvia}';
      Get.toNamed(Routes.chargingPageRoute,
          arguments: [appData.qr, _bookingModel]);
    } else {
      SocketRepo().isCharging.value = false;
      // Get.offAllNamed(Routes.homePageRoute);
    }
  }

  getChargeStationDetails(String stationId, {bool isCardTap = false}) async {
    showLoading(kLoading);
    var res = await CommonFunctions().getChargeStationDetails(stationId);
    hideLoading();
    if (isCardTap) {
      Get.toNamed(Routes.calistaCafePageRoute, arguments: res);
    } else {
      showBottomSheetWhenClickedOnMarker(res, this);
    }
  }

  //NEW HELP PAGE STARTS
  Future<void> openWhatsApp() async {
    var url = "https://wa.me/${phnNumber}";
    if (await canLaunchUrl(Uri.parse(url))) {
      if (Platform.isAndroid) {
        await launch(url);
      } else if (Platform.isIOS) {
        await launch(url);
      }
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> openPhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (Platform.isAndroid) {
      await launchUrl(launchUri);
    } else if (Platform.isIOS) {
      await launchUrl(launchUri);
    }
  }

  Future<void> openMail(String mail) async {
    var email = 'mailto:${mail}?subject=Subject&body=Body';
    if (await launch(email)) {
      if (Platform.isAndroid) {
        await launch(email);
      } else if (Platform.isIOS) {
        await launch(email);
      }
    } else {
      throw 'Could not launch $email';
    }
  }
  //NEW HELP PAGE ENDS

  //MapScreeen Functions Starts
  onFilterTap() {
    Get.toNamed(Routes.filterPageRoute, arguments: station_marker_list);
  }

  onLocationTap() async {
    var res = await MapFunctions().getCurrentPosition();
    if (res != null) MapFunctions().curPos = res;

    MapFunctions().animateToNewPosition(
        LatLng(
          MapFunctions().curPos.latitude,
          MapFunctions().curPos.longitude,
        ),
        bearing: 0);
  }

  onQrScan() {
    Get.toNamed(Routes.qrScanPageRoute);
  }
}
