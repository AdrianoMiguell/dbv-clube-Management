import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;

class RegionRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$RegionsTableTableManager get _manager => _db.managers.regions;

  RegionsCompanion prepareData(Map<String, dynamic> data) {
    return RegionsCompanion(
      id: (data['id'] as int?).toValue(),
      name: (data['name'] as String?).toValue(),
      acronym: (data['acronym'] as String?).toValue(),
      associationId: (data['associationId'] as int?).toValue(),
    );
  }

  Future<int> save(RegionsCompanion region) async {
    return await _manager.create(
      (item) => region,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<RegionsCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.regions, list);
    });
  }

  Future<List<Region>> getAll() async {
    return await _manager.get();
  }

  Future<Region?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<Association?> getHighArea(Region? region) async {
    if (region == null) return null;

    final association = _db.associations.select()
      ..where((a) => a.id.equals(region.associationId));
    debugPrint("😀 $association");
    return association.getSingleOrNull();
  }

  Future<List<Region>> search(String query) async {
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
