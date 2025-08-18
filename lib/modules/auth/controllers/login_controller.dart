import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  final isPasswordHidden = true.obs;
  final rememberMe = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if user wants to be remembered (load from storage if needed)
    loadRememberedCredentials();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> login() async {
    // Validate inputs
    if (!_validateInputs()) return;

    isLoading.value = true;

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Here you would typically call your authentication service
      // Example:
      // final result = await AuthService.login(
      //   email: emailController.text.trim(),
      //   password: passwordController.text,
      // );

      // Save credentials if remember me is checked
      if (rememberMe.value) {
        await _saveCredentials();
      }

      // Navigate to home screen
      Get.offAllNamed('/home'); // Replace with your actual home route

      // Show success message
      Get.snackbar(
        'Success',
        'Welcome back!',
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        icon: const Icon(Icons.check_circle, color: Colors.green),
      );

    } catch (e) {
      // Handle login error
      Get.snackbar(
        'Login Failed',
        'Please check your credentials and try again',
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        icon: const Icon(Icons.error, color: Colors.red),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      // Implement Google Sign-In
      Get.snackbar(
        'Google Sign-In',
        'Google Sign-In will be implemented here',
        backgroundColor: Colors.blue.withOpacity(0.1),
        colorText: Colors.blue,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    } catch (e) {
      _showErrorSnackbar('Google Sign-In failed');
    }
  }

  Future<void> loginWithApple() async {
    try {
      // Implement Apple Sign-In
      Get.snackbar(
        'Apple Sign-In',
        'Apple Sign-In will be implemented here',
        backgroundColor: Colors.black.withOpacity(0.1),
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    } catch (e) {
      _showErrorSnackbar('Apple Sign-In failed');
    }
  }

  void forgotPassword() {
    // Navigate to forgot password screen
    Get.toNamed('/forgot-password'); // Replace with your actual route
  }

  void navigateToSignUp() {
    // Navigate to sign up screen
    Get.toNamed('/signup'); // Replace with your actual route
  }

  bool _validateInputs() {
    if (emailController.text.trim().isEmpty) {
      _showErrorSnackbar('Please enter your email address');
      return false;
    }

    if (!GetUtils.isEmail(emailController.text.trim())) {
      _showErrorSnackbar('Please enter a valid email address');
      return false;
    }

    if (passwordController.text.isEmpty) {
      _showErrorSnackbar('Please enter your password');
      return false;
    }

    if (passwordController.text.length < 6) {
      _showErrorSnackbar('Password must be at least 6 characters');
      return false;
    }

    return true;
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red.withOpacity(0.1),
      colorText: Colors.red,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.error, color: Colors.red),
    );
  }

  Future<void> loadRememberedCredentials() async {
    // Load saved credentials from storage if remember me was checked
    // Example using GetStorage:
    // final storage = GetStorage();
    // if (storage.read('remember_me') == true) {
    //   emailController.text = storage.read('saved_email') ?? '';
    //   rememberMe.value = true;
    // }
  }

  Future<void> _saveCredentials() async {
    // Save credentials to storage
    // Example using GetStorage:
    // final storage = GetStorage();
    // await storage.write('remember_me', true);
    // await storage.write('saved_email', emailController.text.trim());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}