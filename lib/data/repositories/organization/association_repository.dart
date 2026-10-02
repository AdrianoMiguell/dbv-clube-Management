import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart' as getx;

class AssociationRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$AssociationsTableTableManager get _manager => _db.managers.associations;

  AssociationsCompanion prepareData(Map<String, dynamic> data) {
    return AssociationsCompanion(
      id: (data['id'] as int?).toValue(),
      name: (data['name'] as String?).toValue(),
      acronym: (data['acronym'] as String?).toValue(),
      unionId: (data['unionId'] as int?).toValue(),
    );
  }

  Future<int> save(AssociationsCompanion association) async {
    return await _manager.create(
      (item) => association,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<AssociationsCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.associations, list);
    });
  }

  Future<List<Association>> getAll() async {
    return await _manager.get();
  }

  Future<Association?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<Union?> getHighArea(Association? association) async {
    if (association == null) return null;

    final union = _db.unions.select()
      ..where((a) => a.id.equals(association.unionId));
    debugPrint("😀 $union");
    return union.getSingleOrNull();
  }

  Future<List<Association>> search(String query) async {
    // final q = '%$query%';

    // final association = _db.alias(_db.associations, 'd');

    // final joinQuery =
    //     _db.select(association).join([
    //       innerJoin(
    //         coordinator,
    //         coordinator.id.equalsExp(association.coordinatorId),
    //       ),
    //     ])..where(
    //       association.name.like(q) |
    //           association.acronym.like(q) |
    //           coordinator.name.like(q),
    //     );

    return await _manager
        .filter(
          (item) =>
              item.acronym.contains(query) |
              item.name.contains(query)
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
