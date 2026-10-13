import 'package:dbv_clube_management/data/services/auth/auth_service.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final AuthService _service = Get.find<AuthService>();

  void logout() {
    _service.logout();
    Get.offAndToNamed("/login");
  }
}
