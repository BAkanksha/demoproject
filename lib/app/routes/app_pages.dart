import 'package:get/get.dart';
import 'package:flutter_intern_app/app/routes/app_routes.dart';
import 'package:flutter_intern_app/app/modules/splash/splash_binding.dart';
import 'package:flutter_intern_app/app/modules/splash/splash_view.dart';
import 'package:flutter_intern_app/app/modules/auth/signup/signup_binding.dart';
import 'package:flutter_intern_app/app/modules/auth/signup/signup_view.dart';
import 'package:flutter_intern_app/app/modules/auth/signin/signin_binding.dart';
import 'package:flutter_intern_app/app/modules/auth/signin/signin_view.dart';
import 'package:flutter_intern_app/app/modules/auth/otp/otp_binding.dart';
import 'package:flutter_intern_app/app/modules/auth/otp/otp_view.dart';
import 'package:flutter_intern_app/app/modules/dashboard/dashboard_binding.dart';
import 'package:flutter_intern_app/app/modules/dashboard/dashboard_view.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.OTP_VERIFICATION,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}