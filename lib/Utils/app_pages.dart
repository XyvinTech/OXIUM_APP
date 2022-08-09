

import 'package:freelancer_app/Bindings/homepage_binding.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:get/get.dart';

import '../View/Homepage/homepage.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: homepageRoute,
      binding: HomePageBinding(),
      page: () => HomePageScreen(),
    ),
  ];
}
