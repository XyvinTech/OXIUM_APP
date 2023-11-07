import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/Utils/debouncer.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Injector {
  //make it singleTone class
  static final Injector _singleton = Injector._internal();
  factory Injector() {
    return _singleton;
  }
  Injector._internal();

  //THIS CLASS IS FOR STARTING ANY CONTROLLER THAT WILL BE USED ALL OVER THE APP
  late StreamSubscription<ConnectivityResult> subscription;
  Debouncer _debouncer = Debouncer(milliseconds: 500);
  bool isDeviceConnected = false;
  bool isInternetConnectionDisconnected = false;
  init() async {
    isDeviceConnected = false;
    isInternetConnectionDisconnected = false;
    ConnectivityResult conResult = await Connectivity().checkConnectivity();
    showSnackbarOnInternetConnectionChange(conResult);
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      showSnackbarOnInternetConnectionChange(result);
    });
  }

  dispose() async {
    subscription.cancel();
  }

  showSnackbarOnInternetConnectionChange(
    ConnectivityResult result,
  ) async {
    kLog(result);
    if (result != ConnectivityResult.none) {
      if (isDeviceConnected) return;
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (isDeviceConnected && isInternetConnectionDisconnected) {
        _debouncer.run(() {
          Get.closeCurrentSnackbar();
          kLog('connection restored');
          Get.snackbar('Connected to internet', 'Internet connection restored',
              backgroundColor: Colors.green.shade400,
              duration: Duration(seconds: 5));
          if (Get.currentRoute == Routes.loginpageRoute) {
            Get.offAllNamed(Routes.homePageRoute);
          }
        });
      } else if (!isDeviceConnected) {
        isDeviceConnected = false;
        isInternetConnectionDisconnected = true;
        _debouncer.run(() {
          kLog('internet connection lost');
          Get.closeCurrentSnackbar();
          Get.snackbar(
              'No Internet', 'You device is not connected to the internet',
              backgroundColor: Colors.red.shade500,
              isDismissible: false,
              duration: Duration(hours: 1));
        });
      }
    } else {
      isDeviceConnected = false;
      isInternetConnectionDisconnected = true;
      _debouncer.run(() {
        Get.closeCurrentSnackbar();
        Get.snackbar(
            'Connection turned off.', 'Please turn on internet connection.',
            backgroundColor: Colors.red.shade500,
            isDismissible: false,
            duration: Duration(hours: 1));
      });
    }
  }
}
