import 'package:get/get.dart';
import 'package:flutter_intern_app/app/modules/auth/signin/signin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}