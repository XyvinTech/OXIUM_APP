import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/constants.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: 'Freelancer App',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(),
        ),
        fontFamily: 'Poppins',
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: kscaffoldBackgroundColor,
      ),
      initialRoute: Routes.bottomNavPageRoute
      ,
      getPages: AppPages.pages,
    );
  }
}
