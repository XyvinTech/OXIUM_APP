import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/View/Onboarding/enternumber_page.dart';
import 'package:freelancer_app/View/Onboarding/enterotp_page.dart';
import 'package:freelancer_app/View/Onboarding/login_page.dart';
import 'package:freelancer_app/View/Onboarding/welcometoev_page.dart';
import 'package:get/get.dart';
import '../Bindings/loginpage_binding.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: loginpageRoute,
      binding: LoginPageBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: enternumberpageRoute,
      binding: LoginPageBinding(),
      page: () => EnterNumberPage(),
    ),
    GetPage(
      name: enterotppageRoute,
      binding: LoginPageBinding(),
      page: () => EnterOtpPage(),
    ),
    GetPage(
      name: welcometoevRoute,
      binding: LoginPageBinding(),
      page: () => WelcomeToEvPage(),
    ),
  ];
}
