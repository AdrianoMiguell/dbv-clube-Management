import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/association_repository.dart';

class AssociationSeeder {
  late final List<AssociationsCompanion> list;
  final AssociationRepository _associationRepository = AssociationRepository();

  List<Map<String, dynamic>> datas = [
    {
      'id': 1,
      'name': 'Associação Pernambucana Central',
      'acronym': 'APEC',
      'unionId': 1,
      'coordinatorId': 3,
    },
  ];

  Future<void> run() async {
    list = datas.map((d) => _associationRepository.prepareData(d)).toList();

    await _associationRepository.saveAll(list);
  }
}
