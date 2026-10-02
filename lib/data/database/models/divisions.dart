import 'package:drift/drift.dart';

class Divisions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get acronym => text()();
  DateTimeColumn get createdAt => dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable().withDefault(currentDateAndTime)();
}
