import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/qr_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Widgets/button.dart';

class QrScreen extends GetView<QrController> {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          QRView(
            key: controller.qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: _overlay(),
          ),
          Positioned(
              right: 22.w,
              left: 22.w,
              top: 15.h,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 22,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 203.w,
                    child: CustomBigText(
                      text: "Aling the QR Code within theFrame to Scan",
                      color: Colors.white,
                      size: 14.sp,
                      align: TextAlign.center,
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 34.h,
              left: 22.w,
              right: 22.w,
              child: _otpContainer(context, controller))
        ]),
      ),
    );
  }

  void onQRViewCreated(QRViewController qrViewController) {
    controller.qrViewController = qrViewController;
  }

  Widget _otpContainer(BuildContext context, QrController controller) {
    return Container(
      width: 347.sw,
      height: 285,
      padding:
          EdgeInsets.only(top: 16.h, left: 27.w, right: 27.w, bottom: 25.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.r)),
      child: Column(children: [
        CustomBigText(
          text: 'Scan Or Enter Code Below',
          color: Color(0xff828282),
          size: 16.sp,
        ),
        SizedBox(
          height: 23.h,
        ),
        PinCodeTextField(
            appContext: context,
            length: 5,
            pinTheme: PinTheme(
              fieldHeight: 64.h,
              fieldWidth: 47.w,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(38.r),
              borderWidth: .805,
              selectedFillColor: Color.fromARGB(255, 65, 65, 65),
              inactiveColor: Color(0xffBDBDBD),
            ),
            onChanged: (valu) {
              print(valu);
            }),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSmallText(
              text: "Time remining is ${controller.otpTimer.toString()}s",
              size: 12.sp,
              color: Color(0xff828282),
              ontap: () {},
            ),
            CustomSmallText(
              text: "Resend OTP",
              size: 14.sp,
              color: Color(0xff0047C3),
              ontap: () {},
            )
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        MainBtn(
          text: "Proceed",
          onPressed: () {},
        )
      ]),
    );
  }

  QrScannerOverlayShape? _overlay() {
    return QrScannerOverlayShape(
      borderColor: Colors.white,
      borderLength: 90,
      borderRadius: 20,
      borderWidth: 8,
      cutOutBottomOffset: 127.h,
      cutOutSize: 247.w,
      overlayColor: Color.fromARGB(133, 0, 0, 0),
    );
  }
}
