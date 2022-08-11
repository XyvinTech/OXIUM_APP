

import 'package:freelancer_app/Bindings/homepage_binding.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:get/get.dart';

import '../Bindings/loginpage_binding.dart';
import '../View/Homepage/homepage.dart';
import '../View/Login/loginpage.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: homepageRoute,
      binding: HomePageBinding(),
      page: () => HomePageScreen(),
    ),
     GetPage(
      name: loginpageRoute,
      binding: LoginPageBinding(),
      page: () => LoginScreen(),
    ),
  ];
}
