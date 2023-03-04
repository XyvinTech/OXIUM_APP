import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrController extends GetxController {
  // RxBool iskeybort =(MediaQuery.of(context).viewInsets.bottom!=0).obs ;

  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? qrViewController;
  TextEditingController pinCodeController = TextEditingController();
  RxInt otpTimer = 30.obs;

  @override
  void dispose() {
    qrViewController?.dispose();
    pinCodeController.dispose();
    super.dispose();
  }
}
