import 'package:dbv_clube_management/core/binding/global_binding.dart';
import 'package:dbv_clube_management/core/widgets/themes/app_theme.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/database/seeders/database_seeder.dart';
import 'package:dbv_clube_management/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late final AppDatabase db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<AppDatabase>(AppDatabase(), permanent: true);
  Future.wait([DatabaseSeeder.runSeeders()]);

  runApp(
    GetMaterialApp(
      initialBinding: GlobalBinding(),
      initialRoute: Routes.splashScreen,
      getPages: AppPages.routes,
      theme: AppTheme.temaPadrao(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
