import 'package:dbv_clube_management/data/database/models/clubs.dart';
import 'package:drift/drift.dart';

class ClubTerms extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clubId => integer().references(Clubs, #id)();
  TextColumn get textTerm => text()();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
