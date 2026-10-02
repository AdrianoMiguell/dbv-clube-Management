import 'package:dbv_clube_management/ui/settings/setting_view_model.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingViewModel());
  }
}
