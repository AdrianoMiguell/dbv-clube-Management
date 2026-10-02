import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/auth/user_repository.dart';
import 'package:dbv_clube_management/data/repositories/club/club_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/function_member_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/health_form_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/member_repository.dart';
import 'package:get/get.dart';

class MemberViewModel extends GetxController {
  final _userRepository = Get.find<UserRepository>();
  final _memberRepository = MemberRepository();
  final _functionMemberRepository = FunctionMemberRepository();
  final _clubRepository = ClubRepository();
  final _healthFormRepository = HealthFormRepository();

  List<User> listUsers = [];
  List<Member> listMembers = [];
  List<FunctionMember> listFunctionMembers = [];
  List<Club> listClubs = [];
  List<HealthForm> listHealthForms = [];

  HealthForm? healthFormSel;
  User? userSel;
  FunctionMember? functionMemberSel;
  Club? clubSel;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    await getAllUsers();
    await getAllFunctionMembers();
    await getAllClubs();
    await getAllHealthForms();
    isLoading.value = false;
  }

  getAllUsers() async {
    final list = await _userRepository.getAll();
    listUsers.assignAll(list);
  }

  getAllMembers() async {
    final list = await _memberRepository.getAll();
    listMembers.assignAll(list);
  }

  getAllFunctionMembers() async {
    final list = await _functionMemberRepository.getAll();
    list.removeRange(0, 4);
    listFunctionMembers.assignAll(list);
  }

  getAllClubs() async {
    final list = await _clubRepository.getAll();
    listClubs.assignAll(list);
  }

  getAllHealthForms() async {
    final list = await _healthFormRepository.getAll();
    listHealthForms.assignAll(list);
  }
}
