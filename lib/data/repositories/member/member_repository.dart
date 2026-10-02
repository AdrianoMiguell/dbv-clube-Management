import 'package:dbv_clube_management/data/database/extension/member_role_extension.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/database/models/members.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' as getx;

class MemberRepository {
  final _db = getx.Get.find<AppDatabase>();
  $$MembersTableTableManager get _manager => _db.managers.members;

  MembersCompanion prepareData(Map<String, dynamic> data) {
    return Member.fromJson(data).toCompanion(true);
    // return MembersCompanion(
    //   id: Value(data['id']),
    //   name: Value(data['name']),
    //   birthdate: Value(data['birthdate']),
    //   cpf: Value(data['cpf']),
    //   rg: Value(data['rg']),
    //   issuingAgency: Value(data['issuingAgency']),
    //   shirtSize: Value(data['shirtSize']),
    //   email: Value(data['email']),
    //   phone: Value(data['phone']),
    //   cep: Value(data['cep']),
    //   street: Value(data['street']),
    //   number: Value(data['number']),
    //   complement: Value(data['complement']),
    //   neighborhood: Value(data['neighborhood']),
    //   city: Value(data['city']),
    //   state: Value(data['state']),
    //   nameMother: Value(data['nameMother']),
    //   emailMother: Value(data['emailMother']),
    //   phoneMother: Value(data['phoneMother']),
    //   nameFather: Value(data['nameFather']),
    //   emailFather: Value(data['emailFather']),
    //   phoneFather: Value(data['phoneFather']),
    //   acceptClubTerm: Value(data['acceptClubTerm']),
    //   acceptImageTerm: Value(data['acceptImageTerm']),
    //   userId: Value(data['userId']),
    //   functionMemberId: Value(data['functionMemberId']),
    //   clubId: Value(data['clubId']),
    //   createdAt: Value(data['createdAt']),
    //   updatedAt: Value(data['updatedAt']),
    // );
  }

  Future<int> save(MembersCompanion members) async {
    return await _manager.create(
      (item) => members,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> saveAll(List<MembersCompanion> list) async {
    _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.members, list);
    });
  }

  Future<List<Member>> getAll() async {
    return await _manager.get();
  }

  Future<List<Member>> getAllLiders() async {
    return await _manager
        .filter((item) => item.id.isIn([5, 6, 7, 8, 9, 10, 11]))
        .get();
  }

  Future<Member?> get(int id) async {
    return await _manager.filter((item) => item.id(id)).getSingleOrNull();
  }

  // Future<Member?> search(String query) async {}

  Future<void> deleteAll() async {
    await _manager.delete();
  }

  Future<void> delete(int id) async {
    await _manager.filter((item) => item.id(id)).delete();
  }

  Future<List<Member>> searchCoordinator(String query) async {
    return await _manager
        .filter(
          (item) =>
              item.functionMemberId.id.isBetween(1, 5) &
              (item.name.contains(query) |
                  item.functionMemberId.name.contains(query) |
                  item.email.contains(query) |
                  item.phone.contains(query) |
                  item.cpf.contains(query) |
                  item.rg.contains(query) |
                  item.cep.contains(query) |
                  item.street.contains(query) |
                  item.city.contains(query) |
                  item.state.contains(query) |
                  item.nameMother.contains(query) |
                  item.nameFather.contains(query)),
        )
        .get();
  }
}
