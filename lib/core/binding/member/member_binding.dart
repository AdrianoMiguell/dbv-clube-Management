import 'package:dbv_clube_management/data/services/member/member_service.dart';
import 'package:dbv_clube_management/ui/member/health_form_view_model.dart';
import 'package:dbv_clube_management/ui/member/member_form_view_model.dart';
import 'package:dbv_clube_management/ui/member/member_view_model.dart';
import 'package:get/get.dart';

class MemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberService());
    Get.lazyPut(() => MemberViewModel());
    Get.lazyPut(() => MemberFormViewModel());
    Get.lazyPut(() => HealthFormViewModel());
  }
}
