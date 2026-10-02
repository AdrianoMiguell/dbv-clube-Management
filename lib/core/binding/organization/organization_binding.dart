import 'package:dbv_clube_management/data/repositories/member/member_role_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/function_member_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/member_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/association_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/church_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/district_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/division_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/region_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/union_repository.dart';
import 'package:dbv_clube_management/ui/organization/church_view_model.dart';
import 'package:dbv_clube_management/ui/organization/coordinator_view_model.dart';
import 'package:dbv_clube_management/ui/organization/organization_area_view_model.dart';
import 'package:get/get.dart';

class OrganizationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrganizationAreaViewModel());
    Get.lazyPut(() => CoordinatorViewModel());
    Get.lazyPut(() => ChurchViewModel());

    Get.lazyPut(() => DivisionRepository());
    Get.lazyPut(() => UnionRepository());
    Get.lazyPut(() => AssociationRepository());
    Get.lazyPut(() => RegionRepository());
    Get.lazyPut(() => DistrictRepository());
    Get.lazyPut(() => MemberRepository());
    Get.lazyPut(() => MemberRoleRepository());
    Get.lazyPut(() => ChurchRepository());

    Get.lazyPut(() => FunctionMemberRepository());
  }
}
