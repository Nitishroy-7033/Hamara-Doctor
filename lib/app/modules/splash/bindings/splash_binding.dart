import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Changed to put instead of lazyPut to ensure initialization on navigation
    Get.put<SplashController>(SplashController());
  }
}
