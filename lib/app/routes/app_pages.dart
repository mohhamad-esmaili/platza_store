import 'package:get/get.dart';
import 'package:platza_store/app/modules/auth/screens/onboarding_view.dart';
import 'package:platza_store/app/modules/auth/screens/signin_view.dart';
import 'package:platza_store/app/modules/auth/screens/signup_view.dart';
import 'package:platza_store/app/modules/cart/screen/checkout_view.dart';
import 'package:platza_store/app/modules/cart/screen/product_view.dart';
import 'package:platza_store/app/modules/home/screen/splash_view.dart';
import 'package:platza_store/app/widgets/main_wrapper.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splashUrl,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.onBoardingUrl,
      page: () => OnboardingView(),
    ),
    GetPage(
      name: AppRoutes.signInUrl,
      page: () => SigninView(),
    ),
    GetPage(
      name: AppRoutes.signUpUrl,
      page: () => SignUpView(),
    ),
    GetPage(
      name: AppRoutes.homeUrl,
      page: () => MainWrapper(),
    ),
    GetPage(
        name: AppRoutes.productUrl, page: () => ProductView(), arguments: int),
    GetPage(
        name: AppRoutes.checkoutUrl,
        page: () => CheckoutView(),
        arguments: int),
  ];
}
