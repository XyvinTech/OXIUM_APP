import 'package:freelancer_app/Utils/api.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';

import '../Utils/toastUtils.dart';

class CommonFunctions {
  //make it singleTone class
  static final CommonFunctions _singleton = CommonFunctions._internal();
  factory CommonFunctions() {
    return _singleton;
  }
  CommonFunctions._internal();
  //code starts from here

  final _razorpay = Razorpay();
  var _getOrderResponse;

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    //TODO: call api here when it is success payment
    print("////////////////////");
    print(response);
    print(response.paymentId);
    print(response.orderId);
    print(response.signature);
    savePaymentRazorpay(response);
    closeRazorPay();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Get.back();
    // Do something when payment fails
    print("////////////////////");
    showError(response.message!);

    print(response.error);
    closeRazorPay();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("////////////////////");
    print(response);
  }

  void openRazorPay(
      {required double amount,
      required String order_id,
      required String descirption}) {
    if (order_id.isEmpty) return;
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    var options = {
      'key': 'rzp_test_dUTjpvCb45rzpc',
      'amount': amount * 100, //in the smallest currency sub-unit.
      'name': 'GOEC',
      'order_id': order_id, // Generate order_id using Orders API
      'description': descirption,
      'timeout': 300, // in seconds
      'prefill': {'contact': '9123456789', 'email': 'goev@gmail.com'}
    };

    _razorpay.open(options);
  }

  void closeRazorPay() {
    _razorpay.clear();
  }

  Future<String> getOrderIdRazorpay(int amount) async {
    String payment_id = Uuid().v4().substring(0, 20);
    var res = await CallAPI().postData(
        {"amount": amount * 100, "paymentId": payment_id}, 'payment/getorder');
    kLog(res.statusCode.toString());
    _getOrderResponse = res.body;
    if (res.statusCode == 200)
      return res.body['result']['pgOrderId'];
    else {
      showError('Failed to place order. Try again later!');
      return '';
    }
  }

  Future<void> savePaymentRazorpay(PaymentSuccessResponse payResponse) async {
    if (_getOrderResponse == null) return;
    _getOrderResponse['result']['pgPaymentId'] = payResponse.paymentId;
    _getOrderResponse['result']['pgSIgnature'] = payResponse.signature;
    _getOrderResponse['result']['status'] = "P";
    print(_getOrderResponse);
    var res = await CallAPI()
        .postData(_getOrderResponse['result'], 'payment/savePayment');
    kLog(res.statusCode.toString());
    _getOrderResponse = null;
    if (res.statusCode == 200) {
      //TODO: what to do if RFID purchase successful
      showSuccess('Purchased successfully!');
    } else {
      showError('Purchase Failed error code ${res.statusCode}!');
    }
  }
}
