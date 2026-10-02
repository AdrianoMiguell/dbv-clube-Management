import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:get/get.dart';

class DivisionRepository {
  final AppDatabase _db = Get.find<AppDatabase>();
  $$DivisionsTableTableManager get _manager => _db.managers.divisions;

  DivisionsCompanion prepareData(Map<String, dynamic> data) =>
      Division.fromJson(data).toCompanion(true);

  Future<int> save(DivisionsCompanion division) async {
    return await _manager.create(
      (item) => division,
      mode: drift.InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<DivisionsCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.divisions, list);
    });
    _manager.get();
  }

  Future<List<Division>> search(String query) async {
    return await _manager
        .filter(
          (item) => item.name.contains(query) | item.acronym.contains(query),
        )
        .get();
    // final q = '%$query%';

    // final division = _db.alias(_db.divisions, 'd');
    // final coordinator = _db.alias(_db.coordinators, 'c');

    // final joinQuery =
    //     _db.select(division).join([
    //       drift.innerJoin(
    //         coordinator,
    //         coordinator.id.equalsExp(division.coordinatorId),
    //       ),
    //     ])..where(
    //       division.name.like(q) |
    //           division.acronym.like(q) |
    //           coordinator.name.like(q),
    //     );

    // return await joinQuery.map((row) => row.readTable(division)).get();
  }

  Future<List<Division>> getAll() async {
    return await _manager.get();
  }

  Future<Division?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }

  Stream<List<Division>> watchAll() {
    return _db.select(_db.divisions).get().asStream();
  }
}
