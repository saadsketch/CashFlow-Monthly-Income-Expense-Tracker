// lib/routes/app_pages.dart
import 'package:cash_flow/modules/auth/auth_binding.dart';
import 'package:cash_flow/modules/auth/views/login_view.dart';
import 'package:cash_flow/modules/onboarding/onboarding_binding.dart';
import 'package:cash_flow/modules/onboarding/onboarding_view.dart';
import 'package:cash_flow/modules/splash/splash_binding.dart';
import 'package:cash_flow/modules/splash/splash_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.login;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.register,
    //   page: () => RegisterView(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.forgotPassword,
    //   page: () => ForgotPasswordView(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.dashboard,
    //   page: () => DashboardView(),
    //   binding: DashboardBinding(),
    //   children: [
    //     GetPage(name: AppRoutes.home, page: () => HomeView()),
    //     GetPage(name: AppRoutes.transactions, page: () => TransactionsView()),
    //     GetPage(name: AppRoutes.profile, page: () => ProfileView()),
    //     GetPage(name: AppRoutes.settings, page: () => SettingsView()),
    //   ],
    // ),
  ];
}
