import 'package:dbv_clube_management/core/widgets/components/text_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/layouts/main_layout.dart';
import 'package:dbv_clube_management/ui/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthViewModel> {
  const AuthView({super.key});
  AuthViewModel get vm => super.controller;

  // TODO("Configurar as mensagens do app")

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MainLayout(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              Positioned(
                top: (screenWidth < 600 ? 0 : -(screenHeight * 0.28)),
                right: 0,
                left: 0,
                height: screenHeight * (screenWidth < 600 ? 0.75 : .9),
                child: Image.asset(
                  'assets/images/back_desbravadores_e_logo.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Colors.black12,
                        offset: Offset(1, 2),
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  height: screenHeight * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(
                      context,
                    ).copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Form(
                          key: vm.formKey,
                          child: Container(
                            constraints: BoxConstraints(
                              minWidth: 200,
                              maxWidth: 450,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 32),
                                Text(
                                  'DBV Management',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Obx(() {
                                  if (vm.authScreen.value == 0) {
                                    return SizedBox.shrink();
                                  }

                                  return Column(
                                    children: [
                                      TextFieldCustom(
                                        controller: vm.nameController,
                                        label: "Nome",
                                        hint: "Ex: James Nonato",
                                        validator: (v) {
                                          if (v == null || v.isEmpty) {
                                            return "Este campo é obrigatório";
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  );
                                }),
                                TextFieldCustom(
                                  controller: vm.emailController,
                                  hint: "name@email.com",
                                  type: TextInputType.emailAddress,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return "Este campo é obrigatório";
                                    }
                                    final emailRegex = RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                    );
                                    if (!emailRegex.hasMatch(v)) {
                                      return "Por favor, insira um e-mail válido";
                                    }

                                    return null;
                                  },
                                  label: "Email",
                                ),
                                SizedBox(height: 8),
                                Obx(
                                  () => TextFieldCustom(
                                    controller: vm.passwordController,
                                    isObscured: vm.isObscured.value,
                                    hint: "Minimo de 8 caracteres",
                                    validator: (v) {
                                      if (v == null || v.isEmpty) {
                                        return "Este campo é obrigatório";
                                      }

                                      return vm.validatePassword(v);
                                    },
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        vm.isObscured.value =
                                            !vm.isObscured.value;
                                      },
                                      icon: Icon(
                                        vm.isObscured.value
                                            ? Icons.visibility
                                            : Icons.visibility_off_rounded,
                                      ),
                                    ),
                                    label: "Senha",
                                  ),
                                ),
                                SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Obx(() {
                                          return SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                vm.toggleScreen();
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                      Colors.white,
                                                    ),
                                              ),
                                              icon: Icon(
                                                Icons.swap_horiz_rounded,
                                              ),
                                              label: Text(
                                                vm.authScreen.value == 0
                                                    ? "Cadastrar"
                                                    : "Voltar",
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      SizedBox(width: 12),
                                      Flexible(
                                        flex: 1,
                                        child: Obx(() {
                                          return SizedBox(
                                            width: double
                                                .infinity, // 👈 adicione isso
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                if (!vm.formKey.currentState!
                                                    .validate()) {
                                                  return;
                                                }

                                                if (vm.authScreen.value == 1) {
                                                  vm.register();
                                                } else {
                                                  vm.login();
                                                }
                                              },
                                              icon: Icon(Icons.login_rounded),
                                              label: Text(
                                                vm.authScreen.value == 0
                                                    ? "Login"
                                                    : "Registrar",
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (vm.isLoading.value)
                Positioned.fill(
                  child: Container(
                    color: Colors.blueGrey.shade100.withAlpha(80),
                    height: screenHeight,
                    width: screenWidth,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
