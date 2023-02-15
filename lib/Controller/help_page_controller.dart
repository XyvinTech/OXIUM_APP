import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPageController extends GetxController {
  List<dynamic> carouselText = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
  ];
  CarouselController? carouselController;
  RxDouble currentIndex = 0.0.obs;
  String phnNumber = "+8801751051339";

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
