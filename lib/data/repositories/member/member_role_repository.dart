import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

class MemberRoleRepository {
  final _db = Get.find<AppDatabase>();
  $$MemberRolesTableTableManager get _manager => _db.managers.memberRoles;

  MemberRolesCompanion prepareData(Map<String, dynamic> data) {
    final model = MemberRole.fromJson(data);
    return model.toCompanion(true);
  }

  Future<int> save(MemberRolesCompanion memberRole) async {
    return await _manager.create(
      (item) => memberRole,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<MemberRolesCompanion> memberRoles) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.memberRoles, memberRoles);
    });
  }

  Future<MemberRole?> get(int id) async {
    return await _manager
        .filter((memberRole) => memberRole.id.equals(id))
        .getSingleOrNull();
  }

  Future<int> deleteAll() async {
    return await _db.delete(_db.memberRoles).go();
  }
}
