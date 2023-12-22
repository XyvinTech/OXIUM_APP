import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/qr_controller.dart';

class QrScreen extends GetView<QrController> {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var iskeybort = (MediaQuery.of(context).viewInsets.bottom != 0).obs;
    return Scaffold(
      backgroundColor: iskeybort.value == true
          ? Color.fromARGB(255, 110, 110, 110)
          : Colors.transparent,
      body: Obx(() {
        return SafeArea(
          child: Stack(children: [
            if (!iskeybort.value)
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
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    if (!iskeybort.value)
                      SizedBox(
                        width: 203.w,
                        child: CustomBigText(
                          text: "Align the QR Code within theFrame to Scan",
                          color: Colors.white,
                          size: 14.sp,
                          align: TextAlign.center,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                )),
            Positioned(
                bottom: iskeybort == true ? 60.h : 34.h,
                left: 22.w,
                right: 22.w,
                child: _otpContainer(context, controller))
          ]),
        );
      }),
    );
  }

  void onQRViewCreated(QRViewController qrViewController) {
    controller.qrViewController = qrViewController;
    controller.qrViewController!.scannedDataStream.listen((event) {
      controller.onQrCodeReceived(event);
    });
  }

  Widget _otpContainer(BuildContext context, QrController controller) {
    return Container(
      width: 347.sw,
      height: 150.h,
      padding:
          EdgeInsets.only(top: 16.h, left: 27.w, right: 27.w, bottom: 25.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.r)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomBigText(
          text: 'Scan Qr to Charge',
          color: Color(0xff828282),
          size: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomBigText(
          text: 'Scan QR on charging station to start charging',
          color: Color(0xff828282),
          size: 16.sp,
          align: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
        // PinCodeTextField(
        //     appContext: context,
        //     length: 5,
        //     pinTheme: PinTheme(
        //       fieldHeight: 64.h,
        //       fieldWidth: 47.w,
        //       shape: PinCodeFieldShape.box,
        //       borderRadius: BorderRadius.circular(38.r),
        //       borderWidth: .805,
        //       selectedFillColor: Color.fromARGB(255, 65, 65, 65),
        //       inactiveColor: Color(0xffBDBDBD),
        //     ),
        //     onChanged: (valu) {
        //      valu);
        //     }),
        // SizedBox(
        //   height: 15.h,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     CustomSmallText(
        //       text: "Time remining is ${controller.otpTimer.toString()}s",
        //       size: 12.sp,
        //       color: Color(0xff828282),
        //       ontap: () {},
        //     ),
        //     CustomSmallText(
        //       text: "Resend OTP",
        //       size: 14.sp,
        //       color: Color(0xff0047C3),
        //       ontap: () {},
        //     )
        //   ],
        // ),
        // SizedBox(
        //   height: 28.h,
        // ),
        // MainBtn(
        //   text: "Proceed",
        //   onPressed: () {
        //     /// whatever needed if code is entered.
        //     appData.qr = '444-t1-1-Q';
        //     CommonFunctions().createBookingAndCheck(appData.qr);
        //   },
        // )
      ]),
    );
  }

  QrScannerOverlayShape? _overlay() {
    return QrScannerOverlayShape(
      borderColor: Colors.white,
      borderLength: 80,
      borderRadius: 20,
      borderWidth: 10,
      cutOutBottomOffset: 127.h,
      cutOutSize: 247.w,
      overlayColor: Color.fromARGB(183, 0, 0, 0),
    );
  }
}
