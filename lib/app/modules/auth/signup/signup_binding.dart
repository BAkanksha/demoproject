import 'package:get/get.dart';
import 'package:flutter_intern_app/app/modules/auth/signup/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}