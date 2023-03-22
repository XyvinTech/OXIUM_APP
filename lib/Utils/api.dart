import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../Model/apiResponseModel.dart';
import '../Singletones/app_data.dart';
import '../utils/toastUtils.dart';

class CallAPI {
  //make it singleTone class
  static final CallAPI _singleton = CallAPI._internal();
  factory CallAPI() {
    return _singleton;
  }
  CallAPI._internal();
  String _url = 'https://app.bigboystoy.in/Chargetron/api/app/';

/////////POST DATA/////////////////
  Future<ResponseModel> postData(
      Map<String, String> data, String endPoint) async {
    try {
      log('POST $endPoint');
      http.Response res = await http.post(
        Uri.parse(_url + endPoint),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',

        },
      );
      log('post request end');
      var body;
      // if (res.statusCode == 200) {

      // }
      body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on SocketException catch (e) {
      log(e.message);
      // TODO
    }
    return ResponseModel(statusCode: 404, body: null);
  }

////////GET DATA/////////////////
  Future<ResponseModel> getData(
      String endPoint, Map<String, dynamic>? params,
      {String? url}) async {
    var body;
    log('GET + $endPoint');
    try {
      http.Response res = await http.get(
        Uri.https(
            // '35.154.49.246',
            url != null ? url.split('/')[2] : 'app.bigboystoy.in',
            url != null ? url.split('/')[3] : '/api/v1/' + endPoint,
            params),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      );
      // if (res.statusCode == 200) {

      // } else {}
      body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on SocketException catch (e) {
      log(e.message);
      // TODO
    }

    return ResponseModel(statusCode: 404, body: null);
  }

///////DELETE API///////////////
  Future<ResponseModel> deleteData(
      Map<String, String> data, String endPoint) async {
    try {
      log('POST $endPoint');
      http.Response res = await http.delete(
        Uri.parse(_url + endPoint),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
           'Authorization': 'JWT-${appData.token}',
        },
      );
      log('post request end');
      var body;
      // if (res.statusCode == 200) {

      // }
      body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on SocketException catch (e) {
      log(e.message);
      // TODO
    }
    return ResponseModel(statusCode: 404, body: null);
  }

/////////PATCH DATA////////////////
  Future<ResponseModel> patchData(
      String endPoint, Map<String, dynamic>? params) async {
    http.Response res = await http.patch(
      Uri.http(
          // '35.154.49.246',
          'https://app.bigboystoy.in/',
          'Chargetron/api/app/' + endPoint,
          params),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'JWT-${appData.token}',
      },
    );
    var body;
    // if (res.statusCode == 200) {

    // } else {}

    body = json.decode(res.body);
    // log(body.toString());
    return ResponseModel(statusCode: res.statusCode, body: body);
  }

//////IMAGE UPLOAD//////
  asyncProfileImageUpload(String text, File file) async {
    //create multipart request for POST or PATCH method
    showLoading('uploading...');
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://voxryde.com/api/v1/customer/update/image"));
    //add text fields
    request.fields["text_image"] = text;
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath('image', file.path);
    //add multipart to request
    request.files.add(pic);
    request.headers.addAll({
      'Authorization': 'JWT-${appData.token}',
    });
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    hideLoading();
    var res = jsonDecode(responseString);
    log(res['image']);
    // appData.userModel.image = res['image'] ?? '';
    return res['image'];
  }
}
