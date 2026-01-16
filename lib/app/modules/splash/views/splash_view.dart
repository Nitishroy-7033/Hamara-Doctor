import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'dart:developer';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Accessing controller to ensure it's initialized if not already
    log("SplashView: Building...");
    Get.find<SplashController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_hospital, size: 100, color: Colors.blue),
            const SizedBox(height: 24),
            Text(
              "Hamara Doctor",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Your Health, Our Priority",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 60),
            SpinKitPulse(color: Colors.blue, size: 50.0),
          ],
        ),
      ),
    );
  }
}
