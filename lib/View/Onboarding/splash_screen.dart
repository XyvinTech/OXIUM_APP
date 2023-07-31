import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/splash_screen_controller.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (size.height == 0) {
      size = MediaQuery.of(context).size;
      // Injector().injectImages(context);
    }
    return Scaffold(
      backgroundColor: Color(0xff0047C3),
      body: Padding(
        padding: EdgeInsets.only(bottom: 45.h + controller.reload.value * 0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Image.asset(
              "assets/images/goeclogo.png",
              height: 125.h,
              width: 185.w,
            ),
          ),
        ),
      ),
    );
  }
}
