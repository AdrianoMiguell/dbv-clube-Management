import 'package:dbv_clube_management/core/utils/drift_absent_value.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

class FunctionMemberRepository {
  final _db = Get.find<AppDatabase>();
  $$FunctionMembersTableTableManager get _manager =>
      _db.managers.functionMembers;

  FunctionMembersCompanion prepareData(Map<String, dynamic> data) {
    return FunctionMembersCompanion(
      id: (data['id'] as int?).toValue(),
      name: (data['name'] as String?).toValue(),
      desc: (data['desc'] as String?).toValue(),
    );
  }

  Future<void> save(function) async {
    await _manager.create((item) => function, mode: InsertMode.insertOrReplace);
  }

  Future<void> saveAll(List<FunctionMembersCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.functionMembers, list);
    });
    _manager.get();
  }

  Future<List<FunctionMember>> getAll() async {
    return await _manager.get();
  }

  Future<List<FunctionMember>> getAllFuncCoordinators() async {
    return await _manager.filter((f) => f.id.isIn([1, 2, 3, 4])).get();
  }

  Future<FunctionMember?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }
}
