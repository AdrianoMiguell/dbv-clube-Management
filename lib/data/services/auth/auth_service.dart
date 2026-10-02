import 'dart:math';

import 'package:bcrypt/bcrypt.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/database/models/users.dart';
import 'package:dbv_clube_management/data/repositories/auth/user_repository.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  late SharedPreferences prefs;

  final _repository = Get.find<UserRepository>();

  final Rxn<User> user = Rxn(null);
  String token = '';

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    await _tryRestoreSession();
    super.onInit();
  }

  Future<void> _tryRestoreSession() async {
    final tokenSaved = prefs.getString('user_token');
    if (tokenSaved != null && tokenSaved.isNotEmpty) {
      try {
        final dbUser = await _repository.getByToken(tokenSaved);
        if (dbUser != null) {
          user.value = dbUser;
          token = tokenSaved;
        } else {
          await prefs.remove('user_token');
          user.value = null;
          token = '';
        }
      } catch (_) {
        user.value = null;
      }
    }
  }

  Future<List<dynamic>> register(
    String name,
    String email,
    UserFunction function,
    String password,
  ) async {
    prefs = await SharedPreferences.getInstance();

    try {
      final user = await _repository.getByEmailPassword(email, password);
      if (user != null) {
        debugPrint("Credenciais já usadas");
        return [false, "Credenciais já estão em uso"];
      }

      final genToken = _generateToken();
      final passwordHash = hashPassword(password);

      final userData = {
        "name": name,
        "email": email,
        "function": function,
        "passwordHash": passwordHash,
        'token': genToken,
      };

      final userModel = _repository.prepareData(userData);
      await _repository.save(userModel);

      return [true, "Registro criado com sucesso!"];
    } catch (e) {
      debugPrint("Erro no processo de save Register : $e");
      return [false, "Erro ao criar usuário : $e"];
    }
  }

  Future<List<dynamic>> login(String email, String password) async {
    prefs = await SharedPreferences.getInstance();

    try {
      User? userLocal = await _repository.getByEmailPassword(email, password);
      User? userFinal;

      if (userLocal == null) {
        return [false, "O email ou a senha estão incorretos"];
      }

      if (userLocal.token.isEmpty) {
        final genToken = _generateToken();
        final dataJson = userLocal.copyWith(token: genToken).toJson();
        final userModel = _repository.prepareData(dataJson);
        final id = await _repository.save(userModel);
        userFinal = await _repository.get(id);

        debugPrint("userLocal.toJson | ${userLocal.toJson()}");
      } else {
        userFinal = userLocal;
      }

      if (userFinal == null || userFinal.token.isEmpty) {
        return [false, "Erro ao salvar token de segurança. Tente novamente"];
      }

      await prefs.setString('user_token', userLocal.token);
      user.value = userFinal;
      token = userFinal.token;
      user.value = userLocal;

      return [true, "Login realizado com sucesso"];
    } catch (e) {
      debugPrint("Erro no processo de save Login : $e");
      return [false, "Erro ao realizar login: $e"];
    }
  }

  Future<bool> isLoggedIn() async {
    await _tryRestoreSession();
    final hasToken = prefs.getString('user_token') != null;
    return hasToken && user.value != null;
  }

  void logout() async {
    prefs.remove('user_token');
  }

  Future<List<dynamic>> delete() async {
    try {
      prefs.remove('user_token');
      await _repository.deleteByToken(token);
      return [true, "Dados do usuário excluídos com sucesso"];
    } catch (e) {
      debugPrint("Erro ao excluir os dados do usuário : $e");
      return [false, "Erro ao excluir os dados do usuário : $e"];
    }
  }

  static String _generateToken() {
    final random = Random();
    final values = List<int>.generate(16, (i) => random.nextInt(256));
    final genToken = values
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join();

    return genToken;
  }

  static Map<String, dynamic> adminDataLogin() {
    final passwordHash = hashPassword("12345678");
    final genToken = AuthService._generateToken();

    return {
      'id': 1,
      'name': "admin",
      'email': "admin@gmail.com",
      'passwordHash': passwordHash,
      'function': UserFunction.administrator.index,
      'token': genToken,
    };
  }

  static String hashPassword(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }

  static bool verifyPassword(String password, String hashed) {
    bool verify = BCrypt.checkpw(password, hashed);
    debugPrint(
      "As senhas são diferentes na verificação? $verify : $password |||| $hashed",
    );
    return verify;
  }
}
