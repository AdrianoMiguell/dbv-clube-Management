import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/district_repository.dart';

class DistrictSeeder {
  late final List<DistrictsCompanion> list;
  final DistrictRepository _districtRepository = DistrictRepository();

  List<Map<String, dynamic>> datas = [
    {
      'id': 1,
      'name': "Rio Corrente",
      'acronym': "RC",
      'coordinatorId': 5,
      'pastorId': 6,
      'regionId': 1,
    },
  ];

  Future<void> run() async {
    list = datas.map((d) => _districtRepository.prepareData(d)).toList();

    await _districtRepository.saveAll(list);
  }
}
