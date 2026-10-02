import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/union_repository.dart';

class UnionSeeder {
  late final List<UnionsCompanion> list;
  final UnionRepository _unionRepository = UnionRepository();

  List<Map<String, dynamic>> datas = [
    {
      'id': 1,
      'name': 'União Nordeste Brasileira',
      'acronym': 'UNEB',
      'divisionId': 1,
      'coordinatorId': 2,
    },
  ];

  Future<void> run() async {
    list = datas.map((d) => _unionRepository.prepareData(d)).toList();

    await _unionRepository.saveAll(list);
  }
}
