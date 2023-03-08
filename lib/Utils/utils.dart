import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:validators/validators.dart';

import '../Singletones/app_data.dart';
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
