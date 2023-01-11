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

  static String searchPageRoute = '/search';
  static String notificationPageRoute = '/notification';
  static String filterPageRoute = '/filter';
}
