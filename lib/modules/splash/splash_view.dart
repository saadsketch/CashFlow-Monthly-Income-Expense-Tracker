import 'package:cash_flow/core/theme/colors.dart';
import 'package:cash_flow/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Column(
            children: [
              Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / controller.fontSize.value,
                ),
              ),
              Obx(
                () => AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: controller.textOpacity.value,
                  child: Text(
                    'Cashflow',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: controller.animation1.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Obx(
              () => AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                opacity: controller.containerOpacity.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: width / controller.containerSize.value,
                  width: width / controller.containerSize.value,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text('💰', style: TextStyle(fontSize: 40)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
