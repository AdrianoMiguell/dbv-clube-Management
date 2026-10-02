import 'package:dbv_clube_management/data/database/models/function_members.dart';
import 'package:dbv_clube_management/data/database/models/members.dart';
import 'package:drift/drift.dart';

class MemberRoles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get memberId => integer().references(Members, #id)();
  IntColumn get functionMemberId =>
      integer().references(FunctionMembers, #id)();

  // Qual entidade ele é responsável (só um desses será preenchido)
  IntColumn get clubId => integer().nullable()(); // sem FK
  IntColumn get districtId => integer().nullable()(); // sem FK
  IntColumn get regionId => integer().nullable()(); // sem FK
  IntColumn get associationId => integer().nullable()(); // sem FK
  IntColumn get unionId => integer().nullable()(); // sem FK
  IntColumn get divisionId => integer().nullable()(); // sem FK

  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()(); // null = ativo
}
