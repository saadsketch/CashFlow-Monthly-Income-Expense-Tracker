import 'package:cash_flow/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  late PageController pageController;
  final currentPage = 0.obs;

  final List<Map<String, dynamic>> onboardingData = [
    {
      'lottie':
          'assets/lottie/Revenue.json', // Replace with your actual Lottie file path
      'title': 'Track Your Finances',
      'subtitle':
          'Keep track of your income, expenses, and savings in one secure place. Monitor your financial health with ease.',
    },
    {
      'lottie':
          'assets/lottie/Analysis.json', // Replace with your actual Lottie file path
      'title': 'Smart Analytics',
      'subtitle':
          'Get insights into your spending patterns with detailed charts and reports. Make informed financial decisions.',
    },
    {
      'lottie':
          'assets/lottie/Success.json', // Replace with your actual Lottie file path
      'title': 'Achieve Your Goals',
      'subtitle':
          'Set financial goals and track your progress. Save for what matters most to you with our goal tracking feature.',
    },
    {
      'lottie':
          'assets/lottie/Security.json', // Replace with your actual Lottie file path
      'title': 'Secure & Private',
      'subtitle':
          'Your financial data is protected with bank-level security. Your privacy is our top priority.',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to main app or login screen
      completeOnboarding();
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  void completeOnboarding() {
    // You can add logic here to save onboarding completion status
    // For example: Get.find<StorageService>().setOnboardingCompleted(true);

    // Navigate to the next screen (login/home/etc.)
    // Replace with your actual route
    Get.offAllNamed(
      AppRoutes.login,
    ); // or AppRoutes.login, AppRoutes.home, etc.
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
