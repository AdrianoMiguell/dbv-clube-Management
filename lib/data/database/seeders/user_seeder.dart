import 'package:dbv_clube_management/data/repositories/auth/user_repository.dart';
import 'package:dbv_clube_management/data/services/auth/auth_service.dart';

class UserSeeder {
  static Future<void> run() async {
    final adminData = AuthService.adminDataLogin();
    final adminCompanion = UserRepository().prepareData(adminData);
    await UserRepository().save(adminCompanion);
  }
}
