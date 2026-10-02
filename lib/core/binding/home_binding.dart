import 'package:dbv_clube_management/ui/home/home_view_model.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  HomeBinding();

  @override
  void dependencies() {
    Get.put(HomeViewModel());
  }
}
