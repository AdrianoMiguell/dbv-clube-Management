import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' as getx;

class DistrictRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$DistrictsTableTableManager get _manager => _db.managers.districts;

  DistrictsCompanion prepareData(Map<String, dynamic> data) {
    return DistrictsCompanion(
      id: (data['id'] as int?).toValue(),
      name: (data['name'] as String?).toValue(),
      acronym: (data['acronym'] as String?).toValue(),
      regionId: (data['regionId'] as int?).toValue(),
    );
  }

  Future<int> save(DistrictsCompanion district) async {
    return await _manager.create(
      (item) => district,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<DistrictsCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.districts, list);
    });
  }

  Future<List<District>> getAll() async {
    return await _manager.get();
  }

  Future<District?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<List<District>> getAllByIds(List<int> ids) async {
    return await (_db.districts.select(
      distinct: true,
    )..where((d) => d.id.isIn(ids))).get();
  }

  Future<Region?> getHighArea(District? district) async {
    if (district == null) return null;
    final region = _db.regions.select()
      ..where((a) => a.id.equals(district.regionId));
    return region.getSingleOrNull();
  }

  Future<List<District>> search(String query) async {
    return await _manager
        .filter(
          (item) => item.name.contains(query) | item.acronym.contains(query),
        )
        .get();
    // final q = '%$query%';

    // final district = _db.alias(_db.districts, 'd');
    // final coordinator = _db.alias(_db.coordinators, 'c');

    // final joinQuery =
    //     _db.select(district).join([
    //       innerJoin(
    //         coordinator,
    //         coordinator.id.equalsExp(district.coordinatorId),
    //       ),
    //     ])..where(
    //       district.name.like(q) |
    //           district.acronym.like(q) |
    //           coordinator.name.like(q),
    //     );

    // return await joinQuery.map((row) => row.readTable(district)).get();
  }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }
}
