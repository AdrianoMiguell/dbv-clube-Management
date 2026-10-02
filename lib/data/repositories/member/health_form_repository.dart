import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' as getx;

class HealthFormRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$HealthFormsTableTableManager get _manager => _db.managers.healthForms;

  HealthFormsCompanion prepareData(Map<String, dynamic> data) {
    return HealthFormsCompanion(
      id: (data['id'] as int?).toValue(),
      hadCovid: (data['hadCovid'] as bool?).toValue(),
      hadDengue: (data['hadDengue'] as bool?).toValue(),
      hadMumps: (data['hadMumps'] as bool?).toValue(),
      hadMeasles: (data['hadMeasles'] as bool?).toValue(),
      hadRubella: (data['hadRubella'] as bool?).toValue(),
      asthma: (data['asthma'] as bool?).toValue(),
      bronchitis: (data['bronchitis'] as bool?).toValue(),
      rhinitis: (data['rhinitis'] as bool?).toValue(),
      epilepsy: (data['epilepsy'] as bool?).toValue(),
      diabetes: (data['diabetes' as String?]).toValue(),
      hypertension: (data['hypertension' as String?]).toValue(),
      otherDiseases: (data['otherDiseases' as String?]).toValue(),
      autism: (data['autism' as String?]).toValue(),
      adhd: (data['adhd' as String?]).toValue(),
      otherCondition: (data['otherCondition' as String?]).toValue(),
      allergies: (data['allergies' as String?]).toValue(),
      drugAllergies: (data['drugAllergies'] as String?).toValue(),
      foodAllergies: (data['foodAllergies'] as String?).toValue(),
      healthInsurance: (data['healthInsurance'] as String?).toValue(),
    );
  }

  Future<int> save(HealthFormsCompanion members) async {
    return await _manager.create(
      (item) => members,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<List<HealthForm>> getAll() async {
    return await _manager.get();
  }

  Future<HealthForm?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }
}
