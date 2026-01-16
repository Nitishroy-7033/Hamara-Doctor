import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import 'dart:developer';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    log("SplashController: onInit called");
    _navigateToNext();
  }

  @override
  void onReady() {
    super.onReady();
    log("SplashController: onReady called");
  }

  void _navigateToNext() async {
    log("SplashController: Starting navigation timer...");
    await Future.delayed(const Duration(seconds: 3));

    try {
      log("SplashController: Checking Firebase Auth...");
      final user = FirebaseAuth.instance.currentUser;
      log(
        "SplashController: User is ${user == null ? "Logged Out" : "Logged In (${user.uid})"}",
      );

      if (user != null) {
        log("SplashController: Off to Home");
        Get.offAllNamed(Routes.HOME);
      } else {
        log("SplashController: Off to Login");
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {
      log("SplashController: ERROR: $e");
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
