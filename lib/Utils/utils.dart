import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_app/Model/evPortsModel.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:validators/validators.dart';

import '../Singletones/app_data.dart';
import '../constants.dart';
import 'SharedPreferenceUtils.dart';

String? validateText(String value) {
  if (value.isEmpty) {
    return "Required field";
  }
  return null;
}

String? validatePassword(String value) {
  if (!(value.length > 5)) {
    return "Password should contain 6 characters";
  }
  return null;
}

String? validateEmail(String value) {
  if (!isEmail(value)) {
    return "Email address not valid";
  }
  return null;
}

String? validateNumber(String value) {
  if (!isNumeric(value) && value.length != 11) {
    return 'Phone number must be 11 digits with no country code';
  }
  return null;
}

Future<String> getToken() async {
  return appData.token = await getString('token') ?? '';
}

extension TitleCase on String {
  String toTitleCase() {
    if (this == '') {
      return '';
    }

    final List<String> words = this.trim().split(' ');
    final List<String> capitalizedWords = words
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .toList();

    return capitalizedWords.join(' ');
  }
}

Future<Map<String, dynamic>> loadJsonFromAsset(String path) async {
  String jsonString = await rootBundle.loadString(path);
  return json.decode(jsonString);
}

List<dynamic> calculateAvailabiliy(
    List<EvPortModel> evPorts, bool isConnected) {
  int available = 0,
      busy = 0,
      unAvailable = 0,
      faulty = 0,
      total = evPorts.length;
  String trailing = '';
  evPorts.forEach((element) {
    if (element.ocppStatus == kAvailable)
      available++;
    else if (element.ocppStatus == 'Charging')
      busy++;
    else if (element.ocppStatus == kFaulted)
      faulty++;
    else
      unAvailable++;
  });
  if (available > 0)
    trailing = '$kAvailable $available/$total';
  else if (busy > 0)
    trailing = kBusy;
  else if (faulty > 0)
    trailing = kFaulted;
  else
    trailing = kUnavailable;

  //if charger is disconnected then show unavailable
  if (!isConnected) {
    trailing = kUnavailable;
    available = 0;
  }
  return [trailing, available];
}

String getTimeFromTimeStamp(String timestamp, String format) {
  if (timestamp.isEmpty) return '00:00 AM';
  DateTime dateTime = DateTime.parse(timestamp);
  String formattedString = DateFormat(format).format(dateTime);
  // print(formattedString);
  return formattedString;
}

String convertToPmFormat(String time) {
  if (time.isEmpty) return '00:00 AM';
  DateTime dateTime = DateTime.parse('2000-01-01 $time');
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  return formattedTime;
}

bool isTimeInRange(String startTime, String endTime) {
  if (startTime.isEmpty || endTime.isEmpty) return false;
  DateTime now = DateTime.now();
  DateFormat dateFormat = DateFormat('HH:mm');

  DateTime start = dateFormat.parse(startTime);
  DateTime end = dateFormat.parse(endTime);

  if (start.isAfter(end)) {
    // Handle case where start time is after end time (e.g., spanning midnight)
    end = end.add(Duration(days: 1));
  }

  if (now.isAfter(start) && now.isBefore(end)) {
    return true;
  } else {
    return false;
  }
}

Future<String> getDownloadFolderpath() async {
  var directory;
  String path = '';
  if (Platform.isAndroid) {
    // directory = await getExternalStorageDirectory();
    kLog((await getExternalStorageDirectory()).toString());
    directory = Directory('/storage/emulated/0');
  } else if (Platform.isIOS) {
    directory = await getApplicationDocumentsDirectory();
  }
  path = '${directory.path}/Download';
  return path;
}

getTimeDifference({required String startTime, required String endtime}) {
  if (startTime.isEmpty || endtime.isEmpty) return [0, 0];
  DateTime apiTime = DateTime.parse(startTime);

// Get the current time
  DateTime now = DateTime.now();
  if (endtime.isNotEmpty) now = DateTime.parse(endtime);

// Calculate the time difference in milliseconds
  int difference = now.difference(apiTime).inMilliseconds;

// Calculate the hours and minutes difference
  int hours = (difference / (1000 * 60 * 60)).floor();
  int minutes = ((difference / (1000 * 60)) % 60).floor();
  return [hours, minutes];
}

String extractPhoneNumber(String phoneNumber) {
  String result = phoneNumber.replaceAll(new RegExp(r'[^0-9]'), '');
  return "+$result";
}

Future<bool> getStoragePermission() async {
  DeviceInfoPlugin plugin = DeviceInfoPlugin();
  AndroidDeviceInfo android = await plugin.androidInfo;
  if (android.version.sdkInt < 33) {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
      return false;
    } else if (await Permission.audio.request().isDenied) {
      return false;
    }
  } else {
    if (await Permission.photos.request().isGranted) {
      return true;
    } else if (await Permission.photos.request().isPermanentlyDenied) {
      await openAppSettings();
      return false;
    } else if (await Permission.photos.request().isDenied) {
      return false;
    }
  }
  return false;
}

