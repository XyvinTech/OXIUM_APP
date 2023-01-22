import 'package:freelancer_app/Bindings/homepage_binding.dart';
import 'package:freelancer_app/Bindings/smartcharge_binding.dart';
import 'package:freelancer_app/Bindings/vehicle_search_binding.dart';
import 'package:freelancer_app/Bindings/vehicles_screen_binding.dart';

import 'package:freelancer_app/Utils/routes.dart';

import 'package:freelancer_app/View/Onboarding/addvehicles_page.dart';

import 'package:freelancer_app/View/Homepage/homepage.dart';

import 'package:freelancer_app/View/Onboarding/enternumber_page.dart';
import 'package:freelancer_app/View/Onboarding/enterotp_page.dart';
import 'package:freelancer_app/View/Onboarding/login_page.dart';
import 'package:freelancer_app/View/Onboarding/myvehicle_page.dart';
import 'package:freelancer_app/View/Onboarding/personal_vehicle_details_page.dart';
import 'package:freelancer_app/View/Onboarding/rfidnumber_page.dart';
import 'package:freelancer_app/View/Onboarding/smartchrage_page.dart';
import 'package:freelancer_app/View/Onboarding/vehiclesearch_page.dart';
import 'package:freelancer_app/View/Onboarding/welcometoev_page.dart';
import 'package:get/get.dart';
import '../Bindings/editprofile_screen_binding.dart';
import '../Bindings/filter_screen_binding.dart';
import '../Bindings/loginpage_binding.dart';
import '../Bindings/notification_screen_binding.dart';
import '../Bindings/profile_screen_binding.dart';
import '../Bindings/search_screen_binding.dart';
import '../View/Homepage/editprofile_screen.dart';
import '../View/Homepage/filter_screen.dart';
import '../View/Homepage/notification_screen.dart';
import '../View/Homepage/profile_screen.dart';
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
      binding: VehicleScreenBinding(),
      page: () => AddVehiclesPage(),
    ),
    GetPage(
      name: Routes.vehicledetailspageRoute,
      binding: VehicleScreenBinding(),
      page: () => PersonalVechileDetailsPage(),
    ),
    GetPage(
      name: Routes.myvehicleRoute,
      binding: VehicleScreenBinding(),
      page: () => MyVehiclePage(),
    ),
    GetPage(
      name: Routes.smartchargeRoute,
      binding: SmartChargeBinding(),
      page: () => SmartChargeScreen(),
    ),
    GetPage(
      name: Routes.rfidNumberRoute,
      binding: SmartChargeBinding(),
      page: () => RFIDnumberScreen(),
    ),
    GetPage(
      name: Routes.vehiclesearchPageRoute,
      binding: VehicleSearchBinding(),
      page: () => VehicleSearchScreen(),
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
    GetPage(
      name: Routes.profilePageRoute,
      binding: ProfileScreenBinding(),
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routes.editProfilePageRoute,
      binding: EditProfileScreenBinding(),
      page: () => EditProfileScreen(),
    ),
  ];
}
