import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation1;

  final fontSize = 2.0.obs;
  final containerSize = 1.5.obs;
  final textOpacity = 0.0.obs;
  final containerOpacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation1 =
        Tween<double>(begin: 40, end: 20).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
        )..addListener(() {
          textOpacity.value = 1.0;
        });

    animationController.forward();

    Timer(const Duration(seconds: 2), () {
      fontSize.value = 1.06;
    });

    Timer(const Duration(seconds: 2), () {
      containerSize.value = 2;
      containerOpacity.value = 1;
    });

    Timer(const Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.onboarding);
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
