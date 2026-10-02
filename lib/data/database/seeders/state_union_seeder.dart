import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/state_union_repository.dart';

class StateUnionSeeder {
  late final List<StateUnionsCompanion> list;
  final StateUnionRepository _stateUnionRepository = StateUnionRepository();

  List<Map<String, dynamic>> datas = [
    {'id': 1, 'state': "Pernambuco", 'unionId': 1},
  ];

  Future<void> run() async {
    list = datas.map((d) => _stateUnionRepository.prepareData(d)).toList();

    await _stateUnionRepository.saveAll(list);
  }
}
