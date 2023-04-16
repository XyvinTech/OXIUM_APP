import 'package:flutter/material.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/constants.dart';
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

  onQrCodeReceived(Barcode format) async {
    qrViewController?.pauseCamera();
    kLog(format.code.toString());
    String qr = (format.code ?? '') + '-Q';
    appData.qr = qr;
    CommonFunctions().createBookingAndCheck(qr);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    qrViewController?.dispose();
  }
}
