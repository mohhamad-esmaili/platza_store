import 'package:get/get.dart';
import 'package:platza_store/core/widgets/root_navigationbar.dart';
import 'package:platza_store/feature/auth/presentation/screens/onboarding_view.dart';
import 'package:platza_store/feature/auth/presentation/screens/signin_view.dart';
import 'package:platza_store/feature/auth/presentation/screens/signup_view.dart';
import 'package:platza_store/feature/home/presentation/screen/home_view.dart';

class AppRouter {
  /// authentication routes
  static String onBoardingUrl = "/onboarding";
  static String signInUrl = "/signin";
  static String signUpUrl = "/signup";

  /// main routes
  static String homeUrl = "/root";
  static List<GetPage> appRoutes = [
    GetPage(
      name: onBoardingUrl,
      page: () => OnboardingView(),
    ),
    GetPage(
      name: signInUrl,
      page: () => SigninView(),
    ),
    GetPage(
      name: signUpUrl,
      page: () => SignUpView(),
    ),
    GetPage(
      name: homeUrl,
      page: () => RootNavigationbar(),
    ),
  ];
}
