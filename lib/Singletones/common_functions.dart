import 'dialogs.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../Utils/toastUtils.dart';
import '../Model/favoriteModel.dart';
import '../Model/notificationModel.dart';
import 'package:geolocator/geolocator.dart';
import '../Model/chargeTransactionModel.dart';
import 'package:freelancer_app/Utils/api.dart';
import 'package:freelancer_app/constants.dart';
import 'package:freelancer_app/Utils/routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelancer_app/Model/userModel.dart';
import 'package:freelancer_app/Model/orderModel.dart';
import 'package:freelancer_app/Model/reviewMode.dart';
import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/vehicleModel.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Model/apiResponseModel.dart';
import 'package:freelancer_app/Singletones/socketRepo.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freelancer_app/Model/searchStationModel.dart';
import 'package:freelancer_app/Model/stationMarkerModel.dart';
import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Utils/SharedPreferenceUtils.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Model/chargeStationDetailsModel.dart';
import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:freelancer_app/Controller/notification_screen_controller.dart';

class CommonFunctions {
  //make it singleTone class
  static final CommonFunctions _singleton = CommonFunctions._internal();
  factory CommonFunctions() {
    return _singleton;
  }
  CommonFunctions._internal();
  //code starts from here

  String base_Url =
      'https://dlupfxb3p6.execute-api.ap-south-1.amazonaws.com/api/v1/';
  String user_Url =
      'http://alb-762634556.ap-south-1.elb.amazonaws.com:5688/api/v1/users/';
  String station_url =
      'http://alb-762634556.ap-south-1.elb.amazonaws.com:5100/api/v1/chargingStations/';
  String review_url =
      'http://alb-762634556.ap-south-1.elb.amazonaws.com:5685/api/v1/review/';

  final _razorpay = Razorpay();
  var _getOrderResponse;

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    /// call api here when it is success payment

    kLog(response.paymentId.toString());
    kLog(response.orderId.toString());
    kLog(response.signature.toString());
    //SAVE THE PAYEMENT TO CMS
    await savePaymentRazorpay(response);
    // if (Get.currentRoute == Routes.rfidNumberRoute) {
    //   RfidPageController controller = Get.find();
    //   controller.getUserRFIDs();
    // }
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
      // 'key': 'rzp_test_dUTjpvCb45rzpc',
      'key': 'rzp_live_zXZzgqRAKu6Hvd',
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

//TODO
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

  Future<OrderModel> savePaymentRazorpay(PaymentSuccessResponse payResponse,
      {int transactionId = -1, String orderId = ''}) async {
    var payload;
    if (_getOrderResponse != null) {
      _getOrderResponse['result']['pgPaymentId'] = payResponse.paymentId;
      _getOrderResponse['result']['pgOrderId'] = payResponse.orderId;
      _getOrderResponse['result']['pgSIgnature'] = payResponse.signature;
      _getOrderResponse['result']['status'] = "P";
      if (transactionId != -1)
        _getOrderResponse['result']['transactionId'] = transactionId;
      if (Get.currentRoute == Routes.rfidNumberRoute)
        _getOrderResponse['result']['rfidAmountPaid'] = "Y";
      payload = _getOrderResponse['result'];
    } else if (transactionId != -1) {
      payload = {
        'transactionId': transactionId,
        'pgPaymentId': '',
        'pgOrderId': orderId
      };
    } else {
      showError('Failed to update. Response is Empty');
      return kOrderModel;
    }
    kLog(payload);
    var res = await CallAPI().postData(payload, 'payment/savePayment');
    kLog(res.statusCode.toString());
    kLog(res.body.toString());
    _getOrderResponse = null;
    if (res.statusCode == 200 && res.body['success']) {
      /// what to do if RFID purchase successful
      if (Get.currentRoute == Routes.rfidNumberRoute) {
        showSuccess('Payment successful!');
      } else if (transactionId == -1 &&
          Get.currentRoute == Routes.popupPageRoute &&
          appData.qr.isNotEmpty) {
        Dialogs().rechargePopUp(isSuccess: true);
      }
      return OrderModel.fromJson(res.body['result']);
    } else {
      if (Get.currentRoute == Routes.rfidNumberRoute)
        showError('Payment failed with error code ${res.statusCode}!');
      else if (transactionId == -1) Dialogs().rechargePopUp(isSuccess: false);
      return kOrderModel;
    }
  }

  //////ADD VEHICLE APIS/////////////////////////////////////////////////////////////////
///////////////////////////////DONE////////////////////////////////
  Future<Map<String, dynamic>> getEvTemplates() async {
    ResponseModel res = await CallAPI().newGetData(base_Url + 'vehicle/list');
    if (res.statusCode == 200 && res.body['status']) {
      List list = res.body['result'] ?? [];
      Map<String, dynamic> response = {};
      List<VehicleModel> brandVehicles = [];
      List<String> brands = [kAll];
      VehicleModel ev;
      list.forEach((element) {
        brandVehicles = [];
        brands.add(element['brand']);
        element['vehicles'].forEach((vehicleElement) {
          ev = VehicleModel.fromjson(vehicleElement);
          ev.brand = element['brand'];
          brandVehicles.add(ev);
        });
        response[element['brand']] = brandVehicles;
      });
      response['brands'] = brands;
      return response;
    } else {
      return {
        'brands': [kAll],
      };
    }
  }

///////////////////////////////DONE////////////////////////////////
  Future<bool> addEvToUser({
    required String vehicleId,
    required String regNumber,
  }) async {
    ResponseModel res = await CallAPI().newPutData({
      "evRegNumber": regNumber,
      "vehicleId": vehicleId,
    }, user_Url + 'addVehicle/' + appData.userModel.value.id);
    kLog(res.body.toString());
    return (res.statusCode == 200 && res.body['status']);
  }

///////////////////////////////DONE////////////////////////////////
  Future<bool> setDefaultVehicle({required String regNumber}) async {
    ResponseModel res = await CallAPI().newPutData({
      "vehicleId": regNumber,
    }, user_Url + 'updateDefaultVehicle/' + appData.userModel.value.id);
    kLog(res.body.toString());
    return (res.statusCode == 200 && res.body['status']);
  }

//? ///////////////////not implemented
  Future<bool> deleteEvOfUser(String regNumber) async {
    ResponseModel res = await CallAPI().newPutData(
      {"evRegNumber": regNumber},
      user_Url + 'removeVehicle/' + appData.userModel.value.id,
    );
    return (res.statusCode == 200 && res.body['status']);
  }

///////////////////////////////DONE////////////////////////////////
  Future<List<VehicleModel>> getUserEvs() async {
    var res = await CallAPI()
        .newGetData(user_Url + 'vehicleList/' + appData.userModel.value.id);
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['status']) {
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

///////////////////////////////DONE////////////////////////////////
  Future<UserModel> getUserProfile() async {
    var res = await CallAPI().newGetData(
        user_Url + 'user/byMobileNo/' + appData.userModel.value.username);
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

  // Future<UserModel> getUserProfile() async {
  //   var res = await CallAPI().getData('appuser', {
  //     "username": appData.userModel.value.username,
  //   });
  //   // //kLog(res.statusCode.toString())usCode.toString());
  //   if (res.statusCode == 200 && res.body['result'] != null) {
  //     kLog(res.body.toString());
  //     return appData.userModel.value = UserModel.fromJson(res.body['result']);
  //   } else {
  //     kUserModel.username = '';
  //     if (res.statusCode == 500) {
  //       clearData();
  //       appData.token = '';
  //     }
  //     return kUserModel;
  //   }
  // }

  ///////////////////////////////DONE////////////////////////////////
  Future<bool> putUserNameEmail(String name, String email) async {
    kLog('username' + appData.userModel.value.username);
    var res = await CallAPI().newPutData({
      "username": name,
      "email": email,
    }, user_Url + 'update/byMobileNo/' + appData.userModel.value.username);
    // //kLog(res.statusCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body['status']) {
      return true;
    } else {
      showError('Failed to save name and email.');
      return false;
    }
  }

  ///////////////////////////////DONE////////////////////////////////
  Future<bool> putUserProfile(String name, String email, String phone) async {
    var res = await CallAPI().newPutData({
      "username": name,
      "email": email,
      "mobile": phone,
    }, user_Url + 'update/byMobileNo/' + appData.userModel.value.username);
    if (res.statusCode == 200 && res.body['status']) {
      return true;
    } else {
      showError('Failed to save name and email.');
      return false;
    }
  }

//TODO
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

//TODO
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

//TODO
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

  // Future<List<RFIDModel>> getUserRFIDs() async {
  //   var res = await CallAPI().getData('rfidbyusername', {
  //     "user": appData.userModel.value.username,
  //   });
  //   // //kLog(res.statusCode.toString())usCode.toString());
  //   kLog(res.body.toString());
  //   if (res.statusCode == 200 &&
  //       res.body['success'] &&
  //       res.body['result'] != null) {
  //     List<RFIDModel> list = [];
  //     res.body['result'].forEach((element) {
  //       list.add(RFIDModel.fromJson(element));
  //     });
  //     return list;
  //   } else {
  //     return [];
  //   }
  // }

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

  ///////////////////////////////DONE////////////////////////////////
  Future<List<StationMarkerModel>> getNearestChargstations(Position pos) async {
    var res = await CallAPI().newPostData({
      "lattitude": "${pos.latitude}",
      "longitude": "${pos.longitude}",
    }, station_url + 'nearBy/list');
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['status']) {
      List<StationMarkerModel> list = [];
      res.body['result'].forEach((element) {
        list.add(StationMarkerModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }

  ///////////////////////////////DONE////////////////////////////////
  Future<ChargeStationDetailsModel> getChargeStationDetails(String id) async {
    kLog(id);
    var res = await CallAPI().newPostData({
      "mobileNo": appData.userModel.value.username,
    }, station_url + id);
    // //kLog(res.statusCode.toString())usCode.toString());
    if (res.statusCode == 200 && res.body['status']) {
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

///////////////////////////////DONE////////////////////////////////
  Future<bool> postReviewForChargeStation(String id, int rating, String review,
      {String? chargerName}) async {
    var res = await CallAPI().newPostData(
      {
        "user": appData.userModel.value.id,
        "chargingStation": id,
        "rating": "$rating",
        "comment": review.trim(),
        if (chargerName != null) 'evMachine': chargerName,
      },
      review_url + 'create',
    );
    if ((res.statusCode == 200 || res.statusCode == 201) &&
        res.body['status']) {
      return true;
    } else {
      return false;
    }
  }

  ///////////////////////////////DONE////////////////////////////////
  Future<List<ReviewModel>> getReviewOfStation(String stationId) async {
    logger.d(stationId);
    var res = await CallAPI().newPostData({
      'chargingStation': stationId,
    }, review_url + 'getReviews');
    if (res.statusCode == 200 && res.body['status']) {
      List<ReviewModel> list = [];
      res.body['result'].forEach((element) {
        list.add(ReviewModel.fromJson(element));
      });
      return list;
    } else {
      return [];
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
///////////////////////////////DONE////////////////////////////////
  Future<bool> login(String username) async {
    var res = await CallAPI().newGetData(
      user_Url + 'sendOtp/' + username.trim(),
    );
    // //kLog(res.statusCode.toString())usCode.toString());
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['status']) {
      logger.d(res.body['otp']);
      return true;
    } else {
      return false;
    }
  }

///////////////////////////////DONE////////////////////////////////
  Future<ResponseModel> verifyOTP(String username, String otp) async {
    var res = await CallAPI().newPutData(
      {"otp": otp},
      user_Url + 'login/' + username.replaceAll(' ', ''),
    );
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['status']) {
      return res;
    } else if (res.statusCode == 200 && !res.body['status']) {
      showError(res.body['message'] + '!');
      return ResponseModel(statusCode: 500, body: '');
    } else {
      return ResponseModel(statusCode: 500, body: '');
    }
  }

  // Future<ResponseModel> getToken(String username, String password) async {
  //   var res = await CallAPI().postData(
  //     {
  //       "username": username.replaceAll(' ', ''),
  //       "password": password,
  //       "deviceToken": appData.notification_token,
  //     },
  //     'appuserauth',
  //   );
  //   ////kLog(res.statusCode.toString())usCode.toString())usCode.toString());
  //   kLog(res.body.toString());
  //   if (res.statusCode == 200 && res.body['success']) {
  //     return res;
  //   } else {
  //     return ResponseModel(statusCode: 500, body: '');
  //   }
  // }

  ////////////! HACK CHARGING API's //////////////////////
  ///ontap
  Future createBookingAndCheck(String qr) async {
    HomePageController _controller = Get.find();
    showLoading('Checking existing active session...');
    await _controller.getActiveBooking(false, refresh: true);
    if (SocketRepo().isCharging.value) {
      showError('Active session is going on');
      return;
    }
    showLoading('Creating booking...');
    BookingModel res = await CommonFunctions().createBooking(qr: qr);
    hideLoading();
    if (res.status == 'S') {
      Dialogs().tariffPopUp(res);
    } else if (res.status == 'X') {
      Dialogs().notEnoughCreditPopUp();
    }
  }

  ///ontap
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
      if (res.body['message'].trim() == 'Undefined session found') {
        bool isCancelled = await cancelBooking(res.body['result']['bookingId']);
        if (isCancelled) {
          return await createBooking(qr: qr);
        }
      }
      return BookingModel.fromJson(res.body['result']);
    } else {
      if (res.body['message'] == "Booking not allowed") {
        showError('Failed to connect with charger. Please try again later!');
        kBookingModel.status = 'F';
      } else if (!res.body['success']) {
        kBookingModel.status = 'X';
      }
      return kBookingModel;
    }
  }

  ///ontap
  Future<bool> cancelBooking(int bookingId) async {
    var res = await CallAPI()
        .getData('changebookingstatus', {"bookingId": "$bookingId"});
    kLog(res.body.toString());
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
    kLog("active booking: " + res.body.toString());
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
    logger.t({
      "chargingpoint": int.parse(chargingPoint),
      "deviceId": chargerName,
      "requestStatus": isStart ? "StartTransaction" : "StopTransaction",
      "bookingId": bookingId
    });
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
    EasyLoading.showToast(res.body['message']);
    kLog("changeStatus: ${res.statusCode} " + res.body.toString());
    // showError("status: ${res.statusCode} \n" + res.body.toString());
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

  ////////////! HACK CHARGING API's //////////////////////

//TODO
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

  //TODO
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

//TODO
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

///////////////////////////////DONE////////////////////////////////
  Future<List<FavoriteModel>> getFavorites() async {
    var res = await CallAPI().newPostData({
      'mobileNo': appData.userModel.value.username,
    }, station_url + 'favorite/list');
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body.isNotEmpty && res.body['status']) {
      List<FavoriteModel> list = [];
      res.body['result'].forEach((element) {
        list.add(FavoriteModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }

///////////////////////////////DONE////////////////////////////////
  Future<bool> changeFavorite({
    required String stationId,
    required bool makeFavorite,
  }) async {
    logger.f(appData.userModel.value.id);
    var res;
    if (makeFavorite) {
      res = await CallAPI().newPutData(
        {
          "favoriteStation": stationId,
        },
        user_Url + 'addFavoriteStation/' + appData.userModel.value.id,
      );
    } else {
      res = await CallAPI().newPutData(
        {
          "favoriteStation": stationId,
        },
        user_Url + 'removeFavoriteStation/' + appData.userModel.value.id,
      );
    }
    kLog(res.body.toString());
    if (res.statusCode == 200 && res.body['status']) {
      return true;
    } else {
      return false;
    }
  }
}
