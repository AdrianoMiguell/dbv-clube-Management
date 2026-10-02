import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/database/models/users.dart';
import 'package:dbv_clube_management/data/services/auth/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:drift/drift.dart';

class UserRepository {
  final AppDatabase _db = Get.find<AppDatabase>();
  $$UsersTableTableManager get _manager => _db.managers.users;

  UsersCompanion prepareData(Map<String, dynamic> data) {
    final functionValue = data['function'];
    UserFunction? functionEnum;

    if (functionValue is int) {
      functionEnum = UserFunction.values[functionValue];
    } else if (functionValue is UserFunction) {
      functionEnum = functionValue;
    }

    return UsersCompanion(
      id: (data['id'] as int?).toValue(),
      name: (data['name'] as String?).toValue(),
      email: (data['email'] as String?).toValue(),
      passwordHash: (data['passwordHash'] as String?).toValue(),
      function: functionEnum.toValue(),
      token: (data['token'] as String?).toValue(),
    );
  }

  Future<int> save(UsersCompanion user, {int? id}) async {
    return await _manager.create(
      (item) => user,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<UsersCompanion> users) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.users, users);
    });
  }

  Future<User?> get(int id) async {
    return _manager.filter((user) => user.id.equals(id)).getSingleOrNull();
  }

  Future<User?> getByEmailPassword(String email, String password) async {
    User? user = await _manager
        .filter((item) => item.email.equals(email))
        .getSingleOrNull();

    if (user == null) {
      debugPrint("nenhum usuário");
      return null;
    }

    String passwordHash = user.passwordHash;
    bool verifyAccount = AuthService.verifyPassword(password, passwordHash);

    debugPrint(
      "As senhas são diferentes na verificação? $verifyAccount : $password |||| $passwordHash",
    );

    return user;
  }

  Future<User?> getByToken(String token) async {
    return _manager.filter((u) => u.token.contains(token)).getSingleOrNull();
  }

  Future<List<User>> getAll() async {
    return _db.select(_db.users).get();
  }

  Future<int> delete(int id) async {
    return (_db.delete(_db.users)..where((u) => u.id.equals(id))).go();
  }

  Future<int> deleteByToken(String token) async {
    return await _manager.filter((u) => u.token.equals(token)).delete();
  }

  Future<int> deleteAll() async {
    return _db.delete(_db.users).go();
  }
}
