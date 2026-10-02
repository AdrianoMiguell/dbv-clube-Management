import 'package:dbv_clube_management/ui/clubs/club_view_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ClubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClubViewModel());
  }
}
