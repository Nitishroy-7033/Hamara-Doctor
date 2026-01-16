import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'app/routes/app_pages.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    log("Firebase: Initializing...");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log("Firebase: Initialized successfully");
  } catch (e) {
    log("Firebase: Initialization failed: $e");
  }
  runApp(const HamaraDoctorApp());
}

class HamaraDoctorApp extends StatelessWidget {
  const HamaraDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Hamara Doctor",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
