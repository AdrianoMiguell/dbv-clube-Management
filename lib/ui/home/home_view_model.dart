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
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends GetxController {
  RxInt valuePages = 0.obs;
  final _service = Get.find<AuthService>();

  Rxn<User> get user => _service.user;
  UserFunction? get function {
    return user.value?.function;
  }

  bool get isAdmin => function == UserFunction.administrator;

  final RxMap<int, Widget> mapPages = {
    0: InitialPage(),
    1: ServicesPage(),
    2: SettingsPage(),
  }.obs;

  final RxMap<int, Widget> adminMapPages = {
    0: AdminInitialPage(),
    1: AdminServicesPage(),
    2: AdminSettingsPage(),
  }.obs;

  Widget get currentPage =>
      (isAdmin
          ? adminMapPages[valuePages.value]
          : mapPages[valuePages.value]) ??
      Container();

  @override
  void onInit() async {
    _init();
    super.onInit();
  }

  Future<void> _init() async {}
}
