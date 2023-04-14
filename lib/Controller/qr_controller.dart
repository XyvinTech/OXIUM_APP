import 'package:flutter/material.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Utils/routes.dart';

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

  onQrCodeReceived(Barcode format) {
    kLog(format.code.toString());
    String qr = (format.code ?? '') + '-Q';
    Get.toNamed(Routes.chargingPageRoute, arguments: qr);
  }
}
