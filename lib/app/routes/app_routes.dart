part of './app_pages.dart';

abstract class AppRoutes {
  static const String splashUrl = "/splash";

  /// authentication routes
  static const String onBoardingUrl = "/onboarding";
  static const String signInUrl = "/signin";
  static const String signUpUrl = "/signup";

  /// main routes
  static const String homeUrl = "/root";
  static const String productUrl = "/product";
  static const String checkoutUrl = "/checkout";
}
