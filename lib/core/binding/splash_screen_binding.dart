import 'package:dbv_clube_management/ui/home/splash_screen_view_model.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  SplashScreenBinding();

  @override
  void dependencies() {
    Get.put(SplashScreenViewModel());
  }
}
