import 'package:freelancer_app/Bindings/bottom_nav_screen_binding.dart';
import 'package:freelancer_app/Bindings/calista_cafePage_bindings.dart';
import 'package:freelancer_app/Bindings/charge_screen_binding.dart';
import 'package:freelancer_app/Bindings/homepage_binding.dart';
import 'package:freelancer_app/Bindings/otpNumber_screen_bindings.dart';
import 'package:freelancer_app/Bindings/popupPage_bindings.dart';
import 'package:freelancer_app/Bindings/reservation_screen_bindings.dart';
import 'package:freelancer_app/Bindings/smartcharge_binding.dart';
import 'package:freelancer_app/Bindings/vehicle_search_binding.dart';
import 'package:freelancer_app/Bindings/vehicles_screen_binding.dart';
import 'package:freelancer_app/Bindings/wallet_page_bindings.dart';

import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/View/Charge/charge_page.dart';
import 'package:freelancer_app/View/Charge/reservation_page.dart';
import 'package:freelancer_app/View/Homepage/calista_cafe_page.dart';

import 'package:freelancer_app/View/Onboarding/addvehicles_page.dart';

import 'package:freelancer_app/View/Homepage/homepage.dart';
import 'package:freelancer_app/View/Onboarding/bottom_nav_page.dart';

import 'package:freelancer_app/View/Onboarding/enternumber_page.dart';
import 'package:freelancer_app/View/Onboarding/enterotp_page.dart';
import 'package:freelancer_app/View/Onboarding/login_page.dart';
import 'package:freelancer_app/View/Onboarding/myvehicle_page.dart';
import 'package:freelancer_app/View/Onboarding/personal_vehicle_details_page.dart';
import 'package:freelancer_app/View/Onboarding/rfidnumber_page.dart';
import 'package:freelancer_app/View/Onboarding/smartchrage_page.dart';
import 'package:freelancer_app/View/Onboarding/vehiclesearch_page.dart';
import 'package:freelancer_app/View/Onboarding/welcometoev_page.dart';
import 'package:freelancer_app/View/WalletPage/popup_page.dart';
import 'package:freelancer_app/View/WalletPage/walletpage.dart';
import 'package:get/get.dart';
import '../Bindings/bookaslot_screen_binding.dart';
import '../Bindings/editprofile_screen_binding.dart';
import '../Bindings/filter_screen_binding.dart';
import '../Bindings/loginpage_binding.dart';
import '../Bindings/notification_screen_binding.dart';
import '../Bindings/profile_screen_binding.dart';
import '../Bindings/search_screen_binding.dart';
import '../View/Charge/bookaslot_page.dart';
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
      binding: OtpScreenBindings(),
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
    GetPage(
      name: Routes.bottomNavPageRoute,
      binding: BottomNavScreenBinding(),
      page: () => BottomNavScreen(),
    ),

    ///
    ///
    //Charge PAGE
    GetPage(
      name: Routes.chargePageRoute,
      binding: ChargeScreenBinding(),
      page: () => ChargeScreen(),
    ),
    GetPage(
      name: Routes.reservationPageRoute,
      binding: ReservationScreenBindigs(),
      page: () => ReservationScreen(),
    ),
    GetPage(
      name: Routes.bookASlotPageRoute,
      binding: BookASlotScreenBinding(),
      page: () => BookASlotScreen(),
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

    GetPage(
      name: Routes.calistaCafePageRoute,
      binding: CalistaCafePageBindings(),
      page: () => CalistaCafeScreen(),
    ),
<<<<<<< HEAD

    ///
    ///
    //Charge PAGE
    GetPage(
      name: Routes.chargePageRoute,
      binding: ChargeScreenBinding(),
      page: () => ChargeScreen(),
    ),

    //
    ///
    ///
    //Wallet PAGE

    GetPage(
      name: Routes.walletPageRoute,
      binding: WalletPageBindings(),
      page: () => WalletScreen(),
    ),
    GetPage(
      name: Routes.popupPageRoute,
      binding: PopupPageBindigs(),
      page: () => PopUpPage(),
    ),
=======
>>>>>>> d3f33405da054726db8c243362a8a3fcfb31980a
  ];
}
