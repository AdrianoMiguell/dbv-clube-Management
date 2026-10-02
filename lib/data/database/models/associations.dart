import 'package:drift/drift.dart';
import 'package:dbv_clube_management/data/database/models/unions.dart';

class Associations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get acronym => text()();
  IntColumn get unionId => integer().references(Unions, #id)();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
