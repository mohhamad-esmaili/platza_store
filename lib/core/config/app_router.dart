import 'package:get/get.dart';
import 'package:platza_store/feature/auth/presentation/screens/onboarding_view.dart';
import 'package:platza_store/feature/auth/presentation/screens/signin_view.dart';
import 'package:platza_store/feature/auth/presentation/screens/signup_view.dart';

class AppRouter {
  static String onBoardingUrl = "/onboarding";
  static String signInUrl = "/signin";
  static String signUpUrl = "/signup";
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
      page: () => SignupView(),
    ),
  ];
}
