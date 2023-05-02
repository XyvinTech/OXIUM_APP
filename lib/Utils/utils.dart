import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freelancer_app/Model/evPortsModel.dart';
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

List<dynamic> calculateAvailabiliy(List<EvPortModel> evPorts) {
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
  return [trailing, available];
}
