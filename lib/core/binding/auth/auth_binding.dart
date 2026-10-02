import 'package:dbv_clube_management/data/repositories/auth/user_repository.dart';
import 'package:dbv_clube_management/ui/auth/auth_view_model.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<UserRepository>();
    Get.put(AuthViewModel());
  }
}
