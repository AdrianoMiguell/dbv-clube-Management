import 'package:dbv_clube_management/data/database/models/associations.dart';
import 'package:drift/drift.dart';

class Regions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get acronym => text()();
  IntColumn get associationId => integer().references(Associations, #id)();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
