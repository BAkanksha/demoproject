import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_intern_app/app/routes/app_routes.dart';

class DashboardController extends GetxController {
  final currentIndex = 0.obs;
  
  User? get currentUser => FirebaseAuth.instance.currentUser;
  
  void changeTabIndex(int index) {
    currentIndex.value = index;
  }

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(AppRoutes.SIGN_IN);
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out');
    }
  }
}