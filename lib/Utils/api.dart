import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import '../Model/apiResponseModel.dart';
import '../Singletones/app_data.dart';
import 'utils.dart';

class CallAPI {
  //make it singleTone class
  static final CallAPI _singleton = CallAPI._internal();
  factory CallAPI() {
    return _singleton;
  }
  CallAPI._internal();

  int timeOutSec = 15;
  String _url = 'https://app.bigboystoy.in/Chargetron/api/app/';

/////////POST DATA/////////////////
  Future<ResponseModel> postData(
      Map<String, dynamic> data, String endPoint) async {
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
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        return http.Response('Error', 408);
      });
      log('post request end');
      var body;
      if (res.statusCode == 200) body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      log(e.toString());
      hideLoading();
      // TODO
    }
    return ResponseModel(statusCode: 404, body: null);
  }

////////GET DATA/////////////////
  Future<ResponseModel> getData(String endPoint, Map<String, dynamic>? params,
      {String? url}) async {
    var body;
    log('GET + $endPoint');
    try {
      http.Response res = await http.get(
        Uri.https(
            // '35.154.49.246',
            url != null ? url.split('/')[2] : 'app.bigboystoy.in',
            url != null ? url.split('/')[3] : '/Chargetron/api/app/' + endPoint,
            params),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        return http.Response('Error', 408);
      });
      if (res.statusCode == 200) {
        body = json.decode(res.body);
      }

      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      log(e.toString());
      hideLoading();
      showError('Failed to get data');
      // TODO
    }

    return ResponseModel(statusCode: 404, body: null);
  }

////////////////PUT//////////////////////
  Future<ResponseModel> putData(
      Map<String, dynamic> data, String endPoint) async {
    try {
      log('PUT $endPoint');
      http.Response res = await http.put(
        Uri.parse(_url + endPoint),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        return http.Response('Error', 408);
      });
      log('PUT request end');
      var body;
      kLog(res.statusCode.toString());
      kLog(res.body.toString());
      if (res.statusCode == 200) body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      log(e.toString());
      hideLoading();
      showError('Failed to put data');
      // TODO
    }
    return ResponseModel(statusCode: 404, body: null);
  }

///////DELETE API///////////////
  Future<ResponseModel> deleteData(
      Map<String, dynamic> data, String endPoint) async {
    try {
      log('DELETE $endPoint');
      http.Response res = await http.delete(
        Uri.parse(_url + endPoint),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        return http.Response('Error', 408);
      });
      log('post request end');
      var body;
      // if (res.statusCode == 200) {

      // }
      body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      log(e.toString());
      hideLoading();
      showError('Failed to get data');
      // TODO:
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
    ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
      return http.Response('Error', 408);
    });
    var body;
    // if (res.statusCode == 200) {

    // } else {}

    body = json.decode(res.body);
    // log(body.toString());
    return ResponseModel(statusCode: res.statusCode, body: body);
  }

//////IMAGE UPLOAD//////
  uploadFile(String text, File file) async {
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

  Future<void> download(String endpoint, String fileName) async {
    PermissionStatus status = await Permission.storage.request();
    kLog(status.isGranted.toString());
    if (!status.isGranted) {
      showError('Storage permission Denied');
      return;
    }
    final request = http.Request('GET', Uri.parse(_url + endpoint));
    request.headers['Authorization'] = 'JWT-${appData.token}';
    var _response = await http.Client().send(request);
    kLog(_response.statusCode.toString());
    if (_response.statusCode != 200) {
      showError('Unable to download!');
      return;
    }

    var _total = _response.contentLength ?? 1;
    kLog(_total.toString());
    var _received = 0;
    double percentage = 0;
    final List<int> _bytes = [];
    _response.stream.listen((value) {
      _bytes.addAll(value);
      _received += value.length;
      percentage = (_received / _total);
      EasyLoading.showProgress(percentage > 1 ? 0 : percentage,
          status: '${(percentage * 100.0).toStringAsFixed(0)} %');
    }).onDone(() async {
      hideLoading();
      final file =
          File('${(await getDownloadFolderpath())}/invoice_$fileName.pdf');
      await file.writeAsBytes(_bytes);
      showSuccess('Downloaded successfully');
    });
  }
}
