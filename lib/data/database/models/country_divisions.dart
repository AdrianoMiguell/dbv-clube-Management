import 'package:dbv_clube_management/data/database/models/divisions.dart';
import 'package:drift/drift.dart';

class CountryDivisions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get country => text()();
  TextColumn get acronym => text()();
  IntColumn get divisionId => integer().references(Divisions, #id)();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
