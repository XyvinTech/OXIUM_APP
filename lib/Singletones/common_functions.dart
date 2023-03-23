import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../Utils/toastUtils.dart';

class CommonFunctions {
  //make it singleTone class
  static final CommonFunctions _singleton = CommonFunctions._internal();
  factory CommonFunctions() {
    return _singleton;
  }
  CommonFunctions._internal();
  //code starts from here

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    Get.back();
    // await FirebaseRepo().updateUserPaymentStatus().then((value) {
    //   showSuccess("Payment Success");
    //   return;
    // });
    //TODO: call api here when it is success payment
    print("////////////////////");
    print(response.paymentId);
    print(response..orderId);
    print(response.signature);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Get.back();
    // Do something when payment fails
    print("////////////////////");
    showError(response.message!);

    print(response.error);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("////////////////////");
    print(response);
  }
}
