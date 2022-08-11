import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import 'Utils/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.grey,
      ),
      initialRoute: homepageRoute,
      getPages: AppPages.pages,
    );
  }
}
