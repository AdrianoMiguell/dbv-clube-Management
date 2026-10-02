import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;

class UnionRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$UnionsTableTableManager get _manager => _db.managers.unions;

  UnionsCompanion prepareData(Map<String, dynamic> data) {
    return UnionsCompanion(
      id: (data['id'] as int?).toValue(),
      name: (data['name'] as String?).toValue(),
      acronym: (data['acronym'] as String?).toValue(),
      divisionId: (data['divisionId'] as int?).toValue(),
    );
  }

  Future<int> save(UnionsCompanion union) async {
    return await _manager.create(
      (item) => union,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<UnionsCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.unions, list);
    });
  }

  Future<List<Union>> getAll() async {
    return await _manager.get();
  }

  Future<Union?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<Division?> getHighArea(Union? union) async {
    if (union == null) return null;

    final division = _db.divisions.select()
      ..where((a) => a.id.equals(union.divisionId));
    debugPrint("😀 $division");
    return division.getSingleOrNull();
  }

  Future<List<Union>> search(String query) async {
    return await _manager
        .filter(
          (item) => item.name.contains(query) | item.acronym.contains(query),
        )
        .get();
  }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }
}
