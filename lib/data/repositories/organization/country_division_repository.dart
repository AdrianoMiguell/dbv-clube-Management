import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' as getx;

class CountryDivisionRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$CountryDivisionsTableTableManager get _manager =>
      _db.managers.countryDivisions;

  CountryDivisionsCompanion prepareData(Map<String, dynamic> data) {
    return CountryDivisionsCompanion(
      id: data['id'] != null ? Value(data['id']) : Value.absent(),
      country: Value(data['country']),
      acronym: Value(data['acronym']),
      divisionId: Value(data['divisionId']),
    );
  }

  Future<int> save(CountryDivisionsCompanion countryDivision) async {
    return await _manager.create(
      (item) => countryDivision,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<CountryDivisionsCompanion> list) async {
    await _db.batch(
      (batch) => batch.insertAllOnConflictUpdate(_db.countryDivisions, list),
    );
  }

  Future<List<CountryDivision>> getAll() async {
    return await _manager.get();
  }

  Future<CountryDivision?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }
}
