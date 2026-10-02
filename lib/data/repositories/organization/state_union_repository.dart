import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' as getx;

class StateUnionRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$StateUnionsTableTableManager get _manager => _db.managers.stateUnions;

  StateUnionsCompanion prepareData(Map<String, dynamic> data) {
    return StateUnionsCompanion(
      id: data['id'] != null ? Value(data['id']) : Value.absent(),
      state: Value(data['state']),
      acronym: Value(data['acronym']),
      unionId: Value(data['unionId']),
    );
  }

  Future<int> save(StateUnionsCompanion stateUnion) async {
    return await _manager.create(
      (item) => stateUnion,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<StateUnionsCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.stateUnions, list);
    });
  }

  Future<List<StateUnion>> getAll() async {
    return await _manager.get();
  }

  Future<StateUnion?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }
}
