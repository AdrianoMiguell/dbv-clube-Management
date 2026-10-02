import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/member/function_member_repository.dart';

class FunctionMemberSeeder {
  late final List<Function> list;
  final FunctionMemberRepository _functionRepository =
      FunctionMemberRepository();

  List<Map<String, dynamic>> datas = [
    {'id': 1, 'name': 'Departamental', 'desc': ''},
    {'id': 2, 'name': 'Pastor Distrital', 'desc': ''},
    {'id': 3, 'name': 'Regional', 'desc': ''},
    {'id': 4, 'name': 'Distrital', 'desc': ''},

    {'id': 5, 'name': 'Diretor', 'desc': ''},
    {'id': 6, 'name': 'Lider', 'desc': ''},
    {'id': 7, 'name': 'Diretor Associoado', 'desc': ''},
    {'id': 8, 'name': 'Conselheiro/Líder', 'desc': ''},
    {'id': 9, 'name': 'Secretário/Lider', 'desc': ''},
    {'id': 10, 'name': 'Tesoureiro/Lider', 'desc': ''},
    {'id': 11, 'name': 'Capelão/Lider', 'desc': ''},

    {'id': 12, 'name': 'Desbravador', 'desc': ''},
    {'id': 13, 'name': 'Capitão/Desbravador', 'desc': ''},
    {'id': 14, 'name': 'Secretário/Desbravador', 'desc': ''},
    {'id': 15, 'name': 'Tesoureiro/Desbravador', 'desc': ''},
    {'id': 16, 'name': 'Capelão/Desbravador', 'desc': ''},
    {'id': 17, 'name': 'Padioleiro/Desbravador', 'desc': ''},
  ];

  Future<void> run() async {
    final list = datas.map((d) => _functionRepository.prepareData(d)).toList();
    await _functionRepository.saveAll(list);
  }
}
