import 'package:dbv_clube_management/data/repositories/auth/user_repository.dart';
import 'package:dbv_clube_management/data/services/auth/auth_service.dart';
import 'package:get/instance_manager.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.putAsync<AuthService>(() async => AuthService()..onInit(), permanent: true);
  }
}
