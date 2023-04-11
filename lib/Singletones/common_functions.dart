import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Controller/rfid_page_controller.dart';
import 'package:freelancer_app/Model/RfidModel.dart';
import 'package:freelancer_app/Model/apiResponseModel.dart';
import 'package:freelancer_app/Model/chargeStationDetailsModel.dart.dart';
import 'package:freelancer_app/Model/stationMarkerModel.dart';
import 'package:freelancer_app/Model/userModel.dart';
import 'package:freelancer_app/Model/vehicleModel.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Utils/api.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/constants.dart';
import 'package:geolocator/geolocator.dart';
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
    kLog(response.paymentId.toString());
    kLog(response.orderId.toString());
    kLog(response.signature.toString());
    if (Get.currentRoute == Routes.rfidNumberRoute) {
      await savePaymentRazorpay(response);
      RfidPageController controller = Get.find();
      controller.getUserRFIDs();
    }

    closeRazorPay();
  }

  void handlePaymentError(PaymentFailureResponse response) {
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
      {required int amount,
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

  //////ADD VEHICLE APIS/////////////////////////////////////////////////////////////////
  ///
  Future<Map<String, dynamic>> getEvTemplates() async {
    ResponseModel res = await CallAPI().getData('evtemplates', {});
    if (res.statusCode == 200 && res.body['success']) {
      print(res.body);
      Map list = res.body['result']['vehicleDetails'] ?? {};
      Map<String, dynamic> response = {};
      List<VehicleModel> brandVehicles = [];
      List<String> brands = [kAll];
      VehicleModel ev;
      list.forEach((key, val) {
        brandVehicles = [];
        brands.add(key);
        val.forEach((element) {
          ev = VehicleModel.fromjson(element);
          ev.vehicleDetails = key;
          brandVehicles.add(ev);
        });
        response[key] = brandVehicles;
      });
      response['brands'] = brands;
      return response;
    } else {
      return {
        'brands': [kAll],
      };
    }
  }

  Future<bool> addEvToUser(
      {required String userName,
      required VehicleModel ev,
      required String regNumber}) async {
    ResponseModel res = await CallAPI().postData({
      "username": userName,
      "make": ev.vehicleDetails,
      "model": ev.modelName,
      "evRegNumber": regNumber,
    }, 'ev');
    kLog(res.statusCode.toString());
    kLog(res.body.toString());
    return (res.statusCode == 200 && res.body['success']);
  }

  Future<bool> deleteEvOfUser() async {
    ResponseModel res = await CallAPI().deleteData({"userEVId": 60}, 'ev');
    return (res.statusCode == 200 && res.body['success']);
  }

  Future<List<VehicleModel>> getUserEvs() async {
    var res = await CallAPI().getData('userevs', {
      "username": "9782199455",
    });

    if (res.statusCode == 200 && res.body['success']) {
      List<VehicleModel> list = [];
      res.body['result'].forEach((element) {
        list.add(VehicleModel.fromjson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  Future<UserModel> getUserProfile() async {
    var res = await CallAPI().getData('appuser', {
      "username": "9782199455",
    });
    if (res.statusCode == 200) {
      return appData.userModel.value = UserModel.fromJson(res.body['result']);
    } else {
      return kUserModel;
    }
  }

  Future<bool> putUserNameEmail(String name, String email) async {
    var res = await CallAPI().putData({
      "username": "9782199455",
      "name": name,
      "email": email,
    }, 'appuser');
    if (res.statusCode == 200 && res.body['success']) {
      return true;
    } else {
      showError('Failed to save name and email.');
      return false;
    }
  }

  Future<bool> putUserProfile(String name, String email, String phone) async {
    var res = await CallAPI().putData({
      "username": "9782199455",
      "name": name,
      "email": email,
      "phone": phone,
    }, 'appuser');
    if (res.statusCode == 200 && res.body['success']) {
      return true;
    } else {
      showError('Failed to save name and email.');
      return false;
    }
  }

  Future<int> getRFIDPrice() async {
    var res = await CallAPI().getData('rfidprice', {
      "username": "9782199455",
    });

    if (res.statusCode == 200) {
      return res.body['result']['rfid_price'].toInt();
    } else {
      return 0;
    }
  }

  Future<List<RFIDModel>> getUserRFIDs() async {
    var res = await CallAPI().getData('rfidbyusername', {
      "user": "9782199455",
    });

    if (res.statusCode == 200 && res.body['success']) {
      List<RFIDModel> list = [];
      res.body['result'].forEach((element) {
        list.add(RFIDModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  Future<List<VehicleModel>> getSearchedVehicles(String make) async {
    var res = await CallAPI().getData('evtemplate', {
      "vehiclemake": make,
    });

    if (res.statusCode == 200 && res.body['success']) {
      List<VehicleModel> list = [];
      res.body['result'].forEach((element) {
        list.add(VehicleModel.fromjson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  Future<List<StationMarkerModel>> getNearestChargstations(Position pos) async {
    var res = await CallAPI().getData('nearbystations', {
      "lattitude": "${pos.latitude}",
      "longitude": "${pos.longitude}",
    });
    kLog(res.statusCode.toString());
    if (res.statusCode == 200 && res.body['success']) {
      List<StationMarkerModel> list = [];
      res.body['result'].forEach((element) {
        list.add(StationMarkerModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  Future<ChargeStationDetailsModel> getChargeStationDetails(String id) async {
    kLog(id);
    var res = await CallAPI().getData('chargersbystation', {
      "stationId": "$id",
    });
    kLog(res.statusCode.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return ChargeStationDetailsModel.fromJson(res.body['result']);
    } else {
      return kChargeStationDetailsModel;
    }
  }

  showBottomSheetWhenClickedOnMarker(
      param0, HomePageController homePageController) {}
}
