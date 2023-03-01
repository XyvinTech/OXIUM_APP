import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrController extends GetxController {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? qrViewController;
  TextEditingController pinCodeController = TextEditingController();
  RxInt otpTimer = 30.obs;

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }
}
