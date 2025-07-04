import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_intern_app/app/modules/auth/otp/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.mail_outline,
                  size: 40,
                  color: Color(0xFF2196F3),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Verify Your Email',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'We\'ve sent a verification code to\n${controller.email}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'For demo purposes, use: 123456',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: controller.otpController,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 56,
                  fieldWidth: 48,
                  activeFillColor: Colors.white,
                  inactiveFillColor: const Color(0xFFF5F5F5),
                  selectedFillColor: Colors.white,
                  activeColor: const Color(0xFF2196F3),
                  inactiveColor: Colors.grey.shade300,
                  selectedColor: const Color(0xFF2196F3),
                ),
                enableActiveFill: true,
                onCompleted: (value) {
                  controller.verifyOtp();
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 32),
              Obx(() => ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.verifyOtp,
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Verify OTP'),
              )),
              const SizedBox(height: 24),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive the code? "),
                  controller.countdown.value > 0
                      ? Text(
                          'Resend in ${controller.formattedTime}',
                          style: const TextStyle(color: Colors.grey),
                        )
                      : TextButton(
                          onPressed: controller.resendOtp,
                          child: const Text('Resend'),
                        ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}