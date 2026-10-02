import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/member/member_role_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/member_repository.dart';

class CoordinatorSeeder {
  late final List<MembersCompanion> list;
  late final List<MemberRolesCompanion> listRoles;
  final _repository = MemberRepository();
  final _repositoryMemberRole = MemberRoleRepository();

  List<Map<String, dynamic>> datas = [
    {'id': 1, 'name': 'Jeferson Silva', 'functionMemberId': 1},
    {'id': 2, 'name': 'Rafael Santos de Souza', 'functionMemberId': 1},
    {'id': 3, 'name': 'Vinícius Santos', 'functionMemberId': 1},
    {'id': 4, 'name': 'Lindomar', 'functionMemberId': 2},
    {'id': 5, 'name': 'Emerson', 'functionMemberId': 3},
    {'id': 6, 'name': 'Alexandro Espindola', 'functionMemberId': 4},
  ];

  List<Map<String, dynamic>> dataMemberRoles = [
    {
      'id': 1,
      'memberId': 1,
      'functionMemberId': 1,
      "division": 1,
      'startDate': DateTime(2022).toIso8601String(),
      'endDate': DateTime(2026).toIso8601String(),
    },
    {
      'id': 2,
      'memberId': 2,
      'functionMemberId': 1,
      'unionId': 1,
      'startDate': DateTime(2022).toIso8601String(),
      'endDate': DateTime(2026).toIso8601String(),
    },
    {
      'id': 3,
      'memberId': 3,
      'functionMemberId': 1,
      'associationId': 1,
      'startDate': DateTime(2022).toIso8601String(),
      'endDate': DateTime(2026).toIso8601String(),
    },
    {
      'id': 4,
      'memberId': 4,
      'functionMemberId': 3,
      'regionId': 1,
      'startDate': DateTime(2024).toIso8601String(),
      'endDate': DateTime(2026).toIso8601String(),
    },
    {
      'id': 5,
      'memberId': 5,
      'functionMemberId': 4,
      'districtId': 1,
      'startDate': DateTime(2024).toIso8601String(),
      'endDate': DateTime(2026).toIso8601String(),
    },
    {
      'id': 6,
      'memberId': 6,
      'functionMemberId': 2,
      'startDate': DateTime(2022).toIso8601String(),
      'endDate': DateTime(2026).toIso8601String(),
    },
  ];

  Future<void> run() async {
    list = datas.map((d) => _repository.prepareData(d)).toList();
    await _repository.saveAll(list);

    listRoles = dataMemberRoles
        .map((d) => _repositoryMemberRole.prepareData(d))
        .toList();
    await _repositoryMemberRole.saveAll(listRoles);
  }
}
