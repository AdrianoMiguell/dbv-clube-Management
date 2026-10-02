import 'package:dbv_clube_management/data/services/auth/auth_service.dart';
import 'package:dbv_clube_management/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController {
  var isLoading = false.obs;
  bool isLoggedin = false;

  @override
  void onInit() {
    checkLoggedIn();
    // Future.wait([DatabaseSeeder.runSeeders()]);
    super.onInit();
  }

  void checkLoggedIn() async {
    try {
      await Future.delayed(Duration(milliseconds: 200));
      final authService = Get.find<AuthService>();

      isLoggedin = await authService.isLoggedIn();

      if (!isLoggedin) {
        Get.offAllNamed(Routes.login);
        return;
      }

      Get.offAllNamed(Routes.home);
    } catch (e) {
      debugPrint("Erro ao checar login na Splash: $e");
      Get.offAllNamed(Routes.login);
    }
  }
}
