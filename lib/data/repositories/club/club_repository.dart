import 'package:dbv_clube_management/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' as getx;

class ClubRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$ClubsTableTableManager get _manager => _db.managers.clubs;

  ClubsCompanion prepareData(Map<String, dynamic> data) {
    final model = Club.fromJson(data);
    return model.toCompanion(true);
    // return ClubsCompanion(
    //   id: (data['id'] as int?).toValue(),
    //   name: (data['name'] as String?).toValue(),
    //   dateFundation: (data['dateFundation'] as DateTime?).toValue(),
    //   symbol: (data['symbol'] as String?).toValue(),
    //   history: (data['history'] as String?).toValue(),
    //   cep: (data['cep'] as String?).toValue(),
    //   street: (data['street'] as String?).toValue(),
    //   number: (data['number'] as String?).toValue(),
    //   complement: (data['complement'] as String?).toValue(),
    //   neighborhood: (data['neighborhood'] as String?).toValue(),
    //   city: (data['city'] as String?).toValue(),
    //   state: (data['state'] as String?).toValue(),
    //   churchId: (data['churchId'] as int?).toValue(),
    //   districtId: (data['districtId'] as int?).toValue(),
    //   directorId: (data['directorId'] as int?).toValue(),
    //   stars: (data['stars'] as int?).toValue(),
    //   createdAt: (data['createdAt'] as DateTime?).toValue(),
    //   updatedAt: (data['updatedAt'] as DateTime?).toValue(),
    // );
  }

  Future<int> save(ClubsCompanion club) async {
    return await _manager.create(
      (item) => club,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<ClubsCompanion> list) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.clubs, list);
    });
    _manager.get();
  }

  Future<List<Club>> getAll() async {
    return await _manager.get();
  }

  Future<Club?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  Future<List<Club>> search(String query) async {
    // final searchWithRefs = await _manager.withReferences().get();
    // for (final (club, refs) in searchWithRefs) {
    //   final district = await refs.directorId?.getSingle();
    // }

    // final

    return await _manager
        .filter(
          (item) =>
              item.name.contains(query) | item.districtId.name.contains(query),
        )
        .get();
    // final qS = '%$query%';
    // final club = _db.clubs;

    // final sQuery = _db.select(club)..where((q) => _db.clubs.name.like(qS));
    // return await sQuery.get();
  }

  // Future<List<Club>> search(String query) async {
  //   final q = '%$query%';

  //   final club = _db.alias(_db.clubs, 'd');
  //   // final coordinator = _db.alias(_db.coordinators, 'c');

  //   // final joinQuery =
  //   //     _db.select(club).join([
  //   //       innerJoin(
  //   //         coordinator,
  //   //         coordinator.id.equalsExp(club.coordinatorId),
  //   //       ),
  //   //     ])..where(
  //   //       club.name.like(q) |
  //   //           club.acronym.like(q) |
  //   //           coordinator.name.like(q),
  //   //     );

  //   return await joinQuery.map((row) => row.readTable(club)).get();
  // }

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }
}
