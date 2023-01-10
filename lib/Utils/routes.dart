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
  static String searchPageRoute = '/search';
}
