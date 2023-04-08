// const String loginpageRoute = '/';
// const String enternumberpageRoute = '/enternumber';
// const String enterotppageRoute = '/enterotp';
// const String welcometoevRoute = '/welcometoev';
// const String addvehiclesRoute = '/addvehicles';

class Routes {
  static final Routes _singleton = Routes._internal();
  factory Routes() {
    return _singleton;
  }
  Routes._internal();
  static String splashpageRoute = '/';
  static String loginpageRoute = '/login';
  static String enternumberpageRoute = '/enternumber';
  static String enterotppageRoute = '/enterotp';
  static String addNameEmailPageRoute = '/addnameemail';
  static String homePageRoute = '/homepage';
  static String addvehiclesRoute = '/addvehicles';
  static String vehicledetailspageRoute = '/personalvehicledetails';
  static String myvehicleRoute = '/myvehicles';
  static String orderRfidPageRoute = '/orderrfid';
  static String rfidNumberRoute = '/rfidNumber';
  static String vehiclesearchPageRoute = '/vehiclesearch';
  static String bottomNavPageRoute = '/bottomNav';

//
  //charge
  static String chargePageRoute = '/charge';
  static String reservationPageRoute = '/reservation';
  static String bookASlotPageRoute = '/bookaslot';
//
//
//HOMEPAGE
  static String searchPageRoute = '/search';
  static String notificationPageRoute = '/notification';
  static String filterPageRoute = '/filter';
  static String profilePageRoute = '/profile';
  static String editProfilePageRoute = '/editprofile';
  static String calistaCafePageRoute = '/calistacafe';
  static String chargingPageRoute = '/charging';
  static String qrScanPageRoute = '/qrscan';

  static String shareExperiencePageRoute = '/shareExperience';
  static String paymentfeedbackPageRoute = '/paymentfeedback';
  static String thankfeedbackPageRoute = '/thankfeedback';

//TRIPS
  static String tripsPageRoute = '/trips';
  static String searchPlacesPageRoute = '/searchplaces';
  static String directionsPageRoute = '/directions';
  static String navigationPageRoute = '/navigation';
  static String exploreTripPageRoute = '/exploretrip';
  //
  //
  //
  // Wallet
  static String walletPageRoute = '/wallet';
  static String popupPageRoute = '/popup';

  //
  //
  // drawer

  static String helpPageRoute = '/help';
  static String partnerPageRoute = '/partner';
  static String aboutPageRoute = '/about';
  static String drawerrfidNumberRoute = '/drawerrfidNumber';
  static String favouritePageRoute = '/favourite';
}
