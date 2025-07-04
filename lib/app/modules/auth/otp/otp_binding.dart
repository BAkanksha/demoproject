import 'package:get/get.dart';
import 'package:flutter_intern_app/app/modules/auth/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}