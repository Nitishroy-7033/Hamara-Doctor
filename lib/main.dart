import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
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
