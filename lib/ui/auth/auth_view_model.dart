import 'package:dbv_clube_management/data/database/models/users.dart';
import 'package:dbv_clube_management/data/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final AuthService _service = AuthService();

  final nameController = TextEditingController(text: "Adriano Miguel");
  final emailController = TextEditingController(text: "adrianos@gmail.com");
  final passwordController = TextEditingController(text: "adrianos");

  final formKey = GlobalKey<FormState>();

  UserFunction function = UserFunction.user;

  RxInt authScreen = 0.obs;
  RxBool isObscured = true.obs;
  RxBool isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
    try {
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      final [success, message] = await _service.register(
        name,
        email,
        function,
        password,
      );
      debugPrint("🚩 Resultado de register: $success | $message");

      cleanFields();
      toggleScreen();
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 500));
    String email = emailController.text;
    String password = passwordController.text;

    final [success, message] = await _service.login(email, password);
    debugPrint("🚩 Resultado de login: $success | $message");

    if (!success) {
      debugPrint("⚠ Erro no login . Não foi possível prosseguir");
      isLoading.value = false;
      return;
    }

    await Future.delayed(Duration(milliseconds: 25));
    isLoading.value = false;
    Get.toNamed("/home");
  }

  void get logout => _service.logout();

  Future<void> delete() async {
    final [success, message] = await _service.delete();
    debugPrint("🚩 Resultado de login: $success | $message");
  }

  String? validatePassword(String v) {
    if (v.length < 8) return "A senha deve ter mais de 8 caracteres";

    return null;
  }

  void toggleScreen() {
    authScreen.value == 0 ? authScreen.value = 1 : authScreen.value = 0;
    cleanFields();
  }

  void cleanFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
