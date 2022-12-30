import 'package:freelancer_app/Bindings/homepage_binding.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/View/Onboarding/login_page.dart';
import 'package:get/get.dart';

import '../Bindings/loginpage_binding.dart';
import '../View/Homepage/homepage.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: loginpageRoute,
      binding: LoginPageBinding(),
      page: () => LoginPage(),
    ),
  ];
}
