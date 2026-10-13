import 'package:dbv_clube_management/core/widgets/pages/admin_initial_page.dart';
import 'package:dbv_clube_management/core/widgets/pages/admin_services_page.dart';
import 'package:dbv_clube_management/core/widgets/pages/admin_settings_page.dart';
import 'package:dbv_clube_management/core/widgets/pages/initial_page.dart';
import 'package:dbv_clube_management/core/widgets/pages/services_page.dart';
import 'package:dbv_clube_management/core/widgets/pages/settings_page.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/database/models/users.dart';
import 'package:dbv_clube_management/data/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxInt valuePages = 0.obs;
  final _service = Get.find<AuthService>();

  Rxn<User> get user => _service.user;
  UserFunction? get function => user.value?.function;

  bool get isAdmin => function == UserFunction.administrator;

  final Map<int, Widget Function()> mapPages = {
    0: () => const InitialPage(),
    1: () => const ServicesPage(),
    2: () => const SettingsPage(),
  };

  final Map<int, Widget Function()> adminMapPages = {
    0: () => const AdminInitialPage(),
    1: () => const AdminServicesPage(),
    2: () => const AdminSettingsPage(),
  };

  Widget get currentPage {
    final targetMap = isAdmin ? adminMapPages : mapPages;
    final pageBuilder = targetMap[valuePages.value];

    return pageBuilder != null ? pageBuilder() : const SizedBox.shrink();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  Future<void> _init() async {}

  void changePage(int index) {
    valuePages.value = index;
  }
}
