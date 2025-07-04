import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_intern_app/app/routes/app_routes.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();
  final isLoading = false.obs;
  final countdown = 120.obs; // 2 minutes
  Timer? _timer;
  
  String email = '';
  bool isSignUp = false;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    email = args['email'] ?? '';
    isSignUp = args['isSignUp'] ?? false;
    startCountdown();
  }

  void startCountdown() {
    countdown.value = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resendOtp() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        startCountdown();
        Get.snackbar(
          'Success',
          'Verification email sent successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to resend verification email.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void verifyOtp() async {
    if (otpController.text.length != 6) {
      Get.snackbar(
        'Error',
        'Please enter a valid 6-digit OTP',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;
      
      // For demo purposes, we'll simulate OTP verification
      // In a real app, you would verify the OTP with Firebase
      await Future.delayed(const Duration(seconds: 2));
      
      // Simulate successful verification
      if (otpController.text == '123456') {
        Get.snackbar(
          'Success',
          'OTP verified successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        
        Get.offAllNamed(AppRoutes.DASHBOARD);
      } else {
        Get.snackbar(
          'Error',
          'Invalid OTP. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Verification failed. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  String get formattedTime {
    int minutes = countdown.value ~/ 60;
    int seconds = countdown.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}