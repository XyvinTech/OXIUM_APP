

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: splashScreenRoute,
      binding: SplashScreenBinding(),
      page: () => SplashScreen(),
    ),
  ];
}
