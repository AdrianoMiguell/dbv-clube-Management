import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/region_repository.dart';

class RegionSeeder {
  late final List<RegionsCompanion> list;
  final RegionRepository _regionRepository = RegionRepository();

  List<Map<String, dynamic>> datas = [
    {'id': 1, 'name': 'Região 10', 'acronym': 'R10', 'associationId': 1},
  ];

  Future<void> run() async {
    list = datas.map((d) => _regionRepository.prepareData(d)).toList();

    await _regionRepository.saveAll(list);
  }
}
