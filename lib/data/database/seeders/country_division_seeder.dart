import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/country_division_repository.dart';

class CountryDivisionSeeder {
  late final List<CountryDivisionsCompanion> list;
  final CountryDivisionRepository _countryDivisionRepository =
      CountryDivisionRepository();

  List<Map<String, dynamic>> datas = [
    {'id': 1, 'country': "Brasil", 'divisionId': 1},
  ];

  Future<void> run() async {
    list = datas.map((d) => _countryDivisionRepository.prepareData(d)).toList();
    await _countryDivisionRepository.saveAll(list);
  }
}
