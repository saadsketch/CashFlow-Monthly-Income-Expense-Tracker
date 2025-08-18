import 'package:cash_flow/core/theme/colors.dart';
import 'package:cash_flow/modules/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Skip Button
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: controller.skipOnboarding,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.lightTextSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // Page View
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingData.length,
                itemBuilder: (context, index) {
                  final data = controller.onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      children: [
                        const SizedBox(height: 70),

                        // Lottie Animation Container
                        Obx(
                          () => AnimatedOpacity(
                            duration: const Duration(milliseconds: 600),
                            opacity: controller.currentPage.value == index
                                ? 1.0
                                : 0.0,
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 600),
                              scale: controller.currentPage.value == index
                                  ? 1.0
                                  : 0.8,
                              child: Center(
                                child: Lottie.asset(
                                  data['lottie'],
                                  width: width * 0.6,
                                  height: height * 0.25,
                                  fit: BoxFit.contain,
                                  repeat: true,
                                  animate:
                                      controller.currentPage.value == index,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 50),

                        // Title
                        Obx(
                          () => AnimatedOpacity(
                            duration: const Duration(milliseconds: 800),
                            opacity: controller.currentPage.value == index
                                ? 1.0
                                : 0.0,
                            child: AnimatedSlide(
                              duration: const Duration(milliseconds: 800),
                              offset: controller.currentPage.value == index
                                  ? Offset.zero
                                  : const Offset(0, 0.3),
                              child: Text(
                                data['title'],
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lightTextPrimary,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Subtitle
                        Obx(
                          () => AnimatedOpacity(
                            duration: const Duration(milliseconds: 1000),
                            opacity: controller.currentPage.value == index
                                ? 1.0
                                : 0.0,
                            child: AnimatedSlide(
                              duration: const Duration(milliseconds: 1000),
                              offset: controller.currentPage.value == index
                                  ? Offset.zero
                                  : const Offset(0, 0.5),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  data['subtitle'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.lightTextSecondary,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 60),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Page Indicators
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.onboardingData.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: controller.currentPage.value == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == index
                                ? AppColors.primary
                                : AppColors.primary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Next/Get Started Button
                  Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: controller.nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.currentPage.value ==
                                      controller.onboardingData.length - 1
                                  ? 'Get Started'
                                  : 'Next',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              controller.currentPage.value ==
                                      controller.onboardingData.length - 1
                                  ? Icons.check
                                  : Icons.arrow_forward,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
