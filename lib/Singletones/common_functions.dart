// import 'package:firebase_auth/firebase_auth.dart';

import 'dart:developer';

import 'package:freelancer_app/Controller/notification_screen_controller.dart';
import 'package:freelancer_app/Controller/rfid_page_controller.dart';
import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:freelancer_app/Model/apiResponseModel.dart';
import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/chargeStationDetailsModel.dart';
import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Model/orderModel.dart';
import 'package:freelancer_app/Model/reviewMode.dart';
import 'package:freelancer_app/Model/searchStationModel.dart';
import 'package:freelancer_app/Model/stationMarkerModel.dart';
import 'package:freelancer_app/Model/userModel.dart';
import 'package:freelancer_app/Model/vehicleModel.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Utils/SharedPreferenceUtils.dart';
import 'package:freelancer_app/Utils/api.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';

import '../Model/RFIDModel.dart';
import '../Model/chargeTransactionModel.dart';
import '../Model/favoriteModel.dart';
import '../Model/notificationModel.dart';
import '../Utils/toastUtils.dart';
import 'dialogs.dart';

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

    kLog(response.paymentId.toString());
    kLog(response.orderId.toString());
    kLog(response.signature.toString());
    //SAVE THE PAYEMENT TO CMS
    await savePaymentRazorpay(response);
    if (Get.currentRoute == Routes.rfidNumberRoute) {
      RfidPageController controller = Get.find();
      controller.getUserRFIDs();
    }
    await CommonFunctions().getUserProfile();
    WalletPageController _walletPageController = Get.find();
    await _walletPageController.getWalletTransactions();
    // kLog('recharge');
    closeRazorPay();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails

    if (Get.currentRoute == Routes.rfidNumberRoute)
      showError(response.message!);
    else
      Dialogs().rechargePopUp(isSuccess: false);

    closeRazorPay();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected

    kLog(response);
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
      // 'key': 'rzp_live_zXZzgqRAKu6Hvd',
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
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
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
    if (Get.currentRoute == Routes.rfidNumberRoute)
      _getOrderResponse['result']['rfidAmountPaid'] = "Y";

    var res = await CallAPI()
        .postData(_getOrderResponse['result'], 'payment/savePayment');
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    _getOrderResponse = null;
    if (res.statusCode == 200 && res.body['success']) {
      //TODO: what to do if RFID purchase successful

      if (Get.currentRoute == Routes.rfidNumberRoute) {
        showSuccess('Payment successful!');
      } else if (Get.currentRoute == Routes.popupPageRoute &&
          appData.qr.isNotEmpty) {
        Dialogs().rechargePopUp(isSuccess: true);
      }
    } else {
      if (Get.currentRoute == Routes.rfidNumberRoute)
        showError('Payment failed with error code ${res.statusCode}!');
      else
        Dialogs().rechargePopUp(isSuccess: false);
    }
  }

  //////ADD VEHICLE APIS/////////////////////////////////////////////////////////////////
  ///
  Future<Map<String, dynamic>> getEvTemplates() async {
    ResponseModel res = await CallAPI().getData('evtemplates', {});
    if (res.statusCode == 200 && res.body['success']) {
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

  Future<bool> addEvToUser({
    required String userName,
    required VehicleModel ev,
    required String regNumber,
    bool isDefault = false,
  }) async {
    ResponseModel res = await CallAPI().postData({
      "username": userName,
      "make": ev.vehicleDetails,
      "model": ev.modelName,
      "year": ev.year,
      "evRegNumber": regNumber,
      if (isDefault) "userEVId": ev.id,
      if (isDefault) "defaultVehicle": 'Y',
    }, 'ev');
    kLog(ev.id.toString());
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    kLog(res.body.toString());
    return (res.statusCode == 200 && res.body['success']);
  }

  // Future<bool> setDefaultVehicle({
  //   required String userName,
  //   required String regNumber,
  //   bool isDefault = false,
  // }) async {
  //   ResponseModel res = await CallAPI().putData({
  //     "username": userName,
  //     "evRegNumber": regNumber,
  //     "defaultVehicle": isDefault ? 'Y' : 'N',
  //   }, 'ev');
  //   //kLog(res.statusCode.toString())usCode.toString());
  //   kLog(res.body.toString());
  //   return (res.statusCode == 200 && res.body['success']);
  // }

  Future<bool> deleteEvOfUser(VehicleModel ev) async {
    ResponseModel res = await CallAPI().deleteData({"userEVId": ev.id}, 'ev');
    return (res.statusCode == 200 && res.body['success']);
  }

  Future<List<VehicleModel>> getUserEvs() async {
    var res = await CallAPI().getData('userevs', {
      "username": appData.userModel.value.username,
    });
    kLog(res.body.toString());
    if (res.statusCode == 200 &&
        res.body['success'] != null &&
        res.body['success']) {
      List<VehicleModel> list = [];
      res.body['result'].forEach((element) {
        list.add(VehicleModel.fromjson(element));
      });
      kLog(list.length.toString());
      return list;
    } else {
      return [];
    }
  }

  Future<UserModel> getUserProfile() async {
    var res = await CallAPI().getData('appuser', {
      "username": appData.userModel.value.username,
    });
    // //kLog(res.statusCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body['result'] != null) {
      kLog(res.body.toString());
      return appData.userModel.value = UserModel.fromJson(res.body['result']);
    } else {
      kUserModel.username = '';
      if (res.statusCode == 500) {
        clearData();
        appData.token = '';
      }
      return kUserModel;
    }
  }

  Future<bool> putUserNameEmail(String name, String email) async {
    kLog('username' + appData.userModel.value.username);
    var res = await CallAPI().putData({
      "username": appData.userModel.value.username,
      "name": name,
      "email": email,
    }, 'appuser');
    // //kLog(res.statusCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return true;
    } else {
      showError('Failed to save name and email.');
      return false;
    }
  }

  Future<bool> putProfileImage(String fileData) async {
    kLog('put profile image');
    var res = await CallAPI().putData({
      "username": appData.userModel.value.username,
      "fileData": fileData,
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
      "username": appData.userModel.value.username,
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

  Future<bool> deleteUser() async {
    var res = await CallAPI()
        .deleteData({}, 'appuser/id=${appData.userModel.value.id}');
    if (res.statusCode == 200 &&
        res.body != null &&
        res.body['status'] != null &&
        res.body['success']) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> getRFIDPrice() async {
    var res = await CallAPI().getData('rfidprice', {
      "username": appData.userModel.value.username,
    });

    if (res.statusCode == 200) {
      return res.body['result']['rfid_price'].toInt();
    } else {
      return 0;
    }
  }

  Future<List<RFIDModel>> getUserRFIDs() async {
    var res = await CallAPI().getData('rfidbyusername', {
      "user": appData.userModel.value.username,
    });
    // //kLog(res.statusCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 &&
        res.body['success'] &&
        res.body['result'] != null) {
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
    // //kLog(res.statusCode.toString())usCode.toString());
    kLog(res.body.toString());
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
      "username": appData.userModel.value.username,
    });
    // //kLog(res.statusCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return ChargeStationDetailsModel.fromJson(res.body['result']);
    } else {
      return kChargeStationDetailsModel;
    }
  }

  Future<List<SearchStationrModel>> getSearchedChargeStations(
      String name) async {
    var res = await CallAPI().getData('stationsbyname', {
      'name': name,
    });
    // //kLog(res.statusCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      List<SearchStationrModel> list = [];
      res.body['result'].forEach((element) {
        list.add(SearchStationrModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  Future<bool> postReviewForChargeStation(int id, int rating, String review,
      {String? chargerName}) async {
    kLog(chargerName ?? 'null');
    var res = await CallAPI().postData(
      {
        "stationId": id,
        if (chargerName != null) 'chargerName': chargerName,
        "rating": rating,
        "review": review.trim(),
        'name': appData.userModel.value.username,
      },
      'review',
    );
    // //kLog(res.statusCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return true;
    } else {
      return false;
    }
  }

  // Future googleLogin() async {
  //   try {
  //     final GoogleSignIn _googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;

  //     OAuthCredential credential = await GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     kLog(userCredential.user.toString());
  //     kLog('google login ended');
  //   } on FirebaseAuthException catch (e) {
  //     kLog(e.code);
  //   }
  // }

  Future<bool> login(String username) async {
    var res = await CallAPI().postData(
      {
        "username": username.trim(),
      },
      'appuser',
    );
    // //kLog(res.statusCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return true;
    } else {
      return false;
    }
  }

  Future<ResponseModel> verifyOTP(String username, String otp) async {
    var res = await CallAPI().getData(
      'verifyOTP',
      {
        "username": username.replaceAll(' ', ''),
        "otp": otp,
      },
    );
    // //kLog(res.statusCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return await getToken(username, res.body['result'] ?? '');
    } else if (res.statusCode == 200 && !res.body['success']) {
      showError(res.body['message'] + '!');
      return ResponseModel(statusCode: 500, body: '');
    } else {
      return ResponseModel(statusCode: 500, body: '');
    }
  }

  Future<ResponseModel> getToken(String username, String password) async {
    var res = await CallAPI().postData(
      {
        "username": username.replaceAll(' ', ''),
        "password": password,
        "deviceToken": appData.notification_token,
      },
      'appuserauth',
    );
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return res;
    } else {
      return ResponseModel(statusCode: 500, body: '');
    }
  }

  //CHARGING API's
  Future createBookingAndCheck(String qr) async {
    showLoading(kLoading);
    BookingModel res = await CommonFunctions().createBooking(qr: qr);
    hideLoading();
    if (res.status == 'S') {
      Dialogs().tariffPopUp(res);
    } else if (res.status == 'X') {
      Dialogs().notEnoughCreditPopUp();
    }
  }

  Future<BookingModel> createBooking({required String qr}) async {
    List<String> seperator = qr.split('-');
    var res = await CallAPI().postData(
      {
        "username": appData.userModel.value.username,
        "chargerName": seperator[1],
        "chargingpoint": int.parse(seperator[2]),
        "userEVId": appData.userModel.value.defaultVehicle.id,
        "bookedvia": seperator[3]
      },
      'booking',
    );
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      //cancel booking if booking already exist issue arises and status == 'S'
      if (res.body['result']['status'] == 'S' &&
          res.body['message'].trim() == 'Booking Already Exist') {
        bool isCancelled =
            await cancelBooking(res.body['result']['bookingId'], qr: qr);
        if (isCancelled) {
          return await createBooking(qr: qr);
        }
      }
      return BookingModel.fromJson(res.body['result']);
    } else {
      if (res.body['message'] == "Booking not allowed") {
        showError('Failed to connect with charger. Please try again later!');
        kBookingModel.status = 'F';
      } else if (!res.body['success']) kBookingModel.status = 'X';
      return kBookingModel;
    }
  }

  Future<bool> cancelBooking(int bookingId, {required String qr}) async {
    var res = await CallAPI()
        .getData('changebookingstatus', {"bookingId": "$bookingId"});
    if (res.statusCode == 200 && res.body['success']) {
      kLog('booking cancelled successfully');
      return true;
    } else
      return false;
  }

  Future<BookingModel> getActiveBooking() async {
    var res = await CallAPI().getData(
      'activebooking',
      {
        "username": appData.userModel.value.username,
      },
    );
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return BookingModel.fromJson(res.body['result']);
    } else {
      // if (!res.body['success']) kBookingModel.status = 'X';
      return kBookingModel;
    }
  }

  Future<BookingModel> getBooking({required String bookingId}) async {
    var res = await CallAPI().getData(
      'getbooking',
      {
        "bookingId": bookingId,
      },
    );
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return BookingModel.fromJson(res.body['result']);
    } else {
      return kBookingModel;
    }
  }

  Future<bool> changeChargingStatus({
    required String chargerName,
    required String chargingPoint,
    required String bookingId,
    required bool isStart,
  }) async {
    kLog({
      "chargingpoint": int.parse(chargingPoint),
      "deviceId": chargerName,
      "requestStatus": isStart ? "StartTransaction" : "StopTransaction",
      "bookingId": bookingId
    }.toString());
    var res = await CallAPI().postData(
      {
        "chargingpoint": int.parse(chargingPoint),
        "deviceId": chargerName,
        "requestStatus": isStart ? "StartTransaction" : "StopTransaction",
        "bookingId": bookingId
      },
      'changestatus',
    );
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return true;
    } else {
      return false;
    }
  }

  Future<ChargingStatusModel> getChargingStatus(String bookingId) async {
    var res = await CallAPI().getData('bookingstatus', {
      'bookingId': bookingId,
    });
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode != 200) {
      ChargingStatusModel model = kChargingStatusModel;
      model.status = 'E';
      return kChargingStatusModel;
    } else if (res.statusCode == 200 && res.body['success']) {
      return ChargingStatusModel.fromJson(res.body['result']);
    } else {
      return kChargingStatusModel;
    }
  }

  Future<bool> changeFavorite({
    required int stationId,
    required bool makeFavorite,
  }) async {
    var res;
    if (makeFavorite) {
      res = await CallAPI().postData(
        {},
        'favorites/$stationId',
      );
    } else {
      res = await CallAPI().deleteData(
        {},
        'favorites/$stationId',
      );
    }

    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['success']) {
      return true;
    } else {
      return false;
    }
  }

  Future<List> getReviewOfStation(String stationId) async {
    var res = await CallAPI().getData('review-data', {
      'stationId': stationId,
      'page': '0',
      'size': '10',
      'minRating': '1',
      'maxRating': '5',
    });
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body['success']) {
      List<ReviewModel> list = [];
      res.body['result']['content'].forEach((element) {
        list.add(ReviewModel.fromJson(element));
      });
      return [res.body['result']['totalElements'], list];
    } else {
      return [0, []];
    }
  }

  Future<List<OrderModel>> getWalletTransactions(String page, String size,
      String startdate, String enddate, String mode, String status) async {
    var res = await CallAPI().getData('paymentDetails', {
      'page': page,
      'size': size,
      if (startdate.isNotEmpty) 'startdate': startdate,
      if (enddate.isNotEmpty) 'enddate': enddate,
      if (mode.isNotEmpty) 'paymentModes': mode,
      if (status.isNotEmpty) 'statuses': status,
    });
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body['success']) {
      List<OrderModel> list = [];
      WalletPageController _walletPageController = Get.find();
      _walletPageController.totalElements = res.body['result']['totalElements'];
      res.body['result']['content'].forEach((element) {
        list.add(OrderModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  Future<List<NotificationModel>> getNotifications(
      String page, String size) async {
    var res = await CallAPI().getData('notifications', {
      'page': page,
      'size': size,
      'username': appData.userModel.value.username
    });
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body['success']) {
      List<NotificationModel> list = [];
      NotificationScreenController _walletPageController = Get.find();
      _walletPageController.totalElements = res.body['result']['totalElements'];
      res.body['result']['content'].forEach((element) {
        list.add(NotificationModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  Future<List<ChargeTransactionModel>> getChargeTransactions(
      String page, String size, String startdate, String enddate) async {
    var res = await CallAPI().getData('bookinglist', {
      'username': appData.userModel.value.username,
      'page': page,
      'size': size,
      if (startdate.isNotEmpty) 'startdate': startdate,
      if (enddate.isNotEmpty) 'enddate': enddate,
    });
    if (res.statusCode == 200 && res.body['success']) {
      List<ChargeTransactionModel> list = [];
      appData.totalElements = res.body['result']['totalElements'];
      res.body['result']['content'].forEach((element) {
        list.add(ChargeTransactionModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  downloadBookingInvoice(int bookingId) async {
    kLog(bookingId.toString());
    await CallAPI().download('downloadpdfinvoice?bookingId=$bookingId',
        'booking_invoice_$bookingId');
  }

  downloadWalletInvoice(int tranId) async {
    kLog(tranId.toString());
    await CallAPI()
        .download('walletinvoice?tranId=$tranId', 'wallet_invoice_$tranId');
  }

  Future<List<FavoriteModel>> getFavorites() async {
    var res = await CallAPI().getData('favoritestations', {
      'username': appData.userModel.value.username,
    });
    ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body.isNotEmpty && res.body['success']) {
      List<FavoriteModel> list = [];
      res.body['result'].forEach((element) {
        list.add(FavoriteModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }
}
