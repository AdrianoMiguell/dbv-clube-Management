import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/member/member_repository.dart';
import 'package:flutter/rendering.dart';
import 'package:get/state_manager.dart';

class MemberService extends GetxService {
  final _memberRepository = MemberRepository();

  RxList<Member> listMembers = <Member>[].obs;
  List<int> get listMemberIds =>
      listMembers.asMap().entries.map((m) => m.value.id).toList();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    await getAll();
  }

  getAll() async {
    final list = await _memberRepository.getAll();
    listMembers.assignAll(list);
  }

  save(MembersCompanion member) async {
    try {
      int newId = await _memberRepository.save(member);
      Member? newMember = await _memberRepository.get(newId);
      if (newMember != null && listMemberIds.contains(newId)) {
        listMembers.add(newMember);
      }
    } catch (e) {
      debugPrint("Erro ao registrar dados de membro : $e");
    }
  }

  delete(int id) async {
    try {
      await _memberRepository.delete(id);
      listMembers.removeWhere((m) => m.id == id);
    } catch (e) {
      debugPrint("Erro ao deletar dados de membro : $e");
    }
  }
}
