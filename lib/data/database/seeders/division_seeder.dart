import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/division_repository.dart';

class DivisionSeeder {
  late final List<DivisionsCompanion> list;
  final DivisionRepository _divisionRepository = DivisionRepository();

  List<Map<String, dynamic>> datas = [
    {
      'id': 1,
      'name': 'Divisão Sul Americana',
      'acronym': 'DSA',
    },
  ];

  Future<void> run() async {
    list = datas.map((d) => _divisionRepository.prepareData(d)).toList();

    await _divisionRepository.saveAll(list);
  }
}
