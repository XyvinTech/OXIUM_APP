import 'package:freelancer_app/Bindings/homepage_binding.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Utils/routes.dart';

import 'package:freelancer_app/View/Onboarding/addvehicles_page.dart';

import 'package:freelancer_app/View/Homepage/homepage.dart';

import 'package:freelancer_app/View/Onboarding/enternumber_page.dart';
import 'package:freelancer_app/View/Onboarding/enterotp_page.dart';
import 'package:freelancer_app/View/Onboarding/login_page.dart';
import 'package:freelancer_app/View/Onboarding/welcometoev_page.dart';
import 'package:get/get.dart';
import '../Bindings/filter_screen_binding.dart';
import '../Bindings/loginpage_binding.dart';
import '../Bindings/notification_screen_binding.dart';
import '../Bindings/search_screen_binding.dart';
import '../View/Homepage/filter_screen.dart';
import '../View/Homepage/notification_screen.dart';
import '../View/Homepage/search_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    ///
    ///
    //ON BOARDING
    GetPage(
      name: Routes.loginpageRoute,
      binding: LoginPageBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.enternumberpageRoute,
      binding: LoginPageBinding(),
      page: () => EnterNumberPage(),
    ),
    GetPage(
      name: Routes.enterotppageRoute,
      binding: LoginPageBinding(),
      page: () => EnterOtpPage(),
    ),
    GetPage(
      name: Routes.welcometoevRoute,
      binding: LoginPageBinding(),
      page: () => WelcomeToEvPage(),
    ),

    GetPage(
      name: Routes.addvehiclesRoute,
      binding: LoginPageBinding(),
      page: () => AddVehiclesPage(),
    ),

    ///
    ///
    //HOME PAGE
    GetPage(
      name: Routes.homePageRoute,
      binding: HomePageBinding(),
      page: () => HomePageScreen(),
    ),
    GetPage(
      name: Routes.searchPageRoute,
      binding: SearchScreenBinding(),
      page: () => SearchScreen(),
    ),
    GetPage(
      name: Routes.notificationPageRoute,
      binding: NotificationScreenBinding(),
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: Routes.filterPageRoute,
      binding: FilterScreenBinding(),
      page: () => FilterScreen(),
    ),
  ];
}
