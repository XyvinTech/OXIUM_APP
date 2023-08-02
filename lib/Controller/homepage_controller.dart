import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/trips_screen_controller.dart';
import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:freelancer_app/Model/stationMarkerModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/Utils/debouncer.dart';
import 'package:freelancer_app/Utils/image_byte_converter.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../View/Homepage/homepage.dart';
import 'chargePage_controller.dart';

class HomePageController extends GetxController {
  RxDouble height = 80.0.obs;
  RxString name = ''.obs;
  RxString done = 'do'.obs;
  RxInt activeIndex = 0.obs;
  RxInt reload = 0.obs;

  //NEW HELP PAGE STARTS
  CarouselController? carouselController;
  RxDouble currentIndex = 0.0.obs;
  String phnNumber = "+8801751051339";
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


  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  PageController pageController = PageController();
  PanelController panelController = PanelController();
  final ChargeScreenController chargeScreenController =
      Get.put(ChargeScreenController());
  final tripsScreenController = Get.put(TripsScreenController());
  final WalletPageController walletPageController =
      Get.put(WalletPageController());
  List<StationMarkerModel> station_marker_list = [];
  Debouncer debouncer = Debouncer(milliseconds: 3000);

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
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

    // Position? pos = await MapFunctions().getCurrentPosition();
    Position? pos = await MapFunctions().getCurrentPosition();
    // if (pos == null) pos = await MapFunctions().getCurrentPosition();

    // MapFunctions().animateToNewPosition(LatLng(pos!.latitude, pos.longitude));
    // MapFunctions().animateToNewPosition(LatLng(28.670988, 77.2794488));
    if (pos != null) {
      await getNearestChargestations(pos);
      MapFunctions().addMyPositionMarker(pos, MapFunctions().markers_homepage);
    }
    Future.delayed(Duration(milliseconds: 1000), () {
      MapFunctions().myPositionListener();
    });
  }

  onClose() {
    super.onClose();
    // MapFunctions().controller.dispose();
    // MapFunctions().dirMapController.dispose();
    MapFunctions().dispose();
  }

  getNearestChargestations(Position pos) async {
    showLoading(kLoading);
    station_marker_list = await CommonFunctions().getNearestChargstations(pos);
    hideLoading();

    station_marker_list.forEach((element) {
      MapFunctions().addMarkerHomePage(
          id: element.id.toString(),
          latLng: LatLng(element.lattitude, element.longitude),
          isBusy: element.isBusy,
          status: element.charger_status.trim(),
          // element.charger_status.trim() != 'Connected' || element.isBusy,
          controller: this);
    });
  }

  getChargeStationDetails(String stationId) async {
    showLoading(kLoading);
    var res = await CommonFunctions().getChargeStationDetails(stationId);
    hideLoading();

    showBottomSheetWhenClickedOnMarker(res, this);
  }

  //NEW HELP PAGE STARTS
  Future<void> openWhatsApp() async {
    var url = "https://wa.me/${phnNumber}";
    if (await launch(url)) {
      print("launching $url");
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
}
