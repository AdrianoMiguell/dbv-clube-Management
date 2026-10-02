import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

class ChurchRepository {
  final _db = Get.find<AppDatabase>();
  $$ChurchesTableTableManager get _manager => _db.managers.churches;

  ChurchesCompanion prepareData(Map<String, dynamic> data) {
    return ChurchesCompanion(
      id: (data['id'] as int?).toValue(),
      name: (data['name'] as String?).toValue(),
      districtId: (data['districtId'] as int?).toValue(),
    );
  }

  Future<int> save(ChurchesCompanion church) async {
    return await _manager.create(
      (item) => church,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<ChurchesCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.churches, list);
    });
  }

  Future<List<Church>> getAll() async {
    return await _manager.orderBy((c) => c.name.asc()).get();
  }

  Future<Church?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<List<Church>> search(String query) async {
    return await _manager
        .filter(
          (item) =>
              item.name.contains(query) | item.districtId.name.contains(query),
        )
        .get();
  }

  Future<bool> checkIfUsed(int id) async {
    return await _db.managers.clubs
        .filter((item) => item.id.equals(id))
        .exists();
  }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }
}
