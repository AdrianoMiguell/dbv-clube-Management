import 'package:dbv_clube_management/core/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SettingController>();

    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Configurações"),
          SizedBox(height: 12),
          ElevatedButton(onPressed: () => c.logout(), child: Text("Sair")),
        ],
      ),
    );
  }
}
