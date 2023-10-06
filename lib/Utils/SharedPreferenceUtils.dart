import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

Future<String?> saveString(String key, String value) async {
  if (prefs == null) prefs = await SharedPreferences.getInstance();
  await prefs?.setString(key, value);
  return value;
}

 saveInt(String key, int value) async {
  if (prefs == null) prefs = await SharedPreferences.getInstance();
  prefs?.setInt(key, value);
}

 saveBool(String key, bool value) async {
  if (prefs == null) prefs = await SharedPreferences.getInstance();
  prefs?.setBool(key, value);
}

Future<String?> getString(String key) async {
  if (prefs == null) prefs = await SharedPreferences.getInstance();
  return prefs?.getString(key);
}

Future<int?> getInt(String key) async {
  if (prefs == null) prefs = await SharedPreferences.getInstance();
  return prefs?.getInt(key);
}

Future<bool> getBool(String key) async {
  if (prefs == null) prefs = await SharedPreferences.getInstance();
  if (prefs!.containsKey(key)) {
    return prefs?.getBool(key) ?? false;
  } else {
    return false;
  }
}

 Future<bool>clearData() async {
  if (prefs == null) prefs = await SharedPreferences.getInstance();
  
  return (await prefs?.clear())??false;
}
