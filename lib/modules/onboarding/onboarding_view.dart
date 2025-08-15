import 'package:cash_flow/modules/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding')),
      body: Center(
        child: Text(
          'Welcome to the Onboarding Screen!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
