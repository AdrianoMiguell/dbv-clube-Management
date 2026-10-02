import 'package:dbv_clube_management/data/database/models/function_members.dart';
import 'package:dbv_clube_management/data/database/models/users.dart';
import 'package:drift/drift.dart';

class Members extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Dados pessoais
  TextColumn get name => text()();
  DateTimeColumn get birthdate => dateTime().nullable()();
  TextColumn get cpf => text().nullable()();
  TextColumn get rg => text().nullable()();

  // Orgão emissor do documento
  TextColumn get issuingAgency => text().nullable()();
  TextColumn get shirtSize => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();

  // local
  TextColumn get cep => text().nullable()();
  TextColumn get street => text().nullable()();
  TextColumn get number => text().nullable()();
  TextColumn get complement => text().nullable()();
  TextColumn get neighborhood => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get state => text().nullable()();

  TextColumn get nameMother => text().nullable()();
  TextColumn get emailMother => text().nullable()();
  TextColumn get phoneMother => text().nullable()();
  TextColumn get nameFather => text().nullable()();
  TextColumn get emailFather => text().nullable()();
  TextColumn get phoneFather => text().nullable()();

  BoolColumn get acceptClubTerm =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get acceptImageTerm =>
      boolean().withDefault(const Constant(false))();

  IntColumn get clubId => integer().nullable()();

  IntColumn get functionMemberId =>
      integer().references(FunctionMembers, #id)();

  IntColumn get userId => integer().nullable().references(Users, #id)();

  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
