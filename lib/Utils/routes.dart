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
  static String loginpageRoute = '/';
  static String enternumberpageRoute = '/enternumber';
  static String enterotppageRoute = '/enterotp';
  static String welcometoevRoute = '/welcometoev';
  static String homePageRoute = '/homepage';
  static String addvehiclesRoute = '/addvehicles';
  static String vehicledetailspageRoute = '/personalvehicledetails';
  static String myvehicleRoute = '/myvehicleRoute';
  static String smartchargeRoute = '/smartcharge';
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

//TRIPS
  static String tripsPageRoute = '/trips';
  static String searchPlacesPageRoute = '/searchplaces';
  static String directionsPageRoute = '/directions';
  static String navigationPageRoute = '/navigation';
  //
  //
  //
  // Wallet
  static String walletPageRoute = '/wallet';
  static String popupPageRoute = '/popup';
}
