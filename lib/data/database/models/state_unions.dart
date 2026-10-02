import 'package:dbv_clube_management/data/database/models/unions.dart';
import 'package:drift/drift.dart';

class StateUnions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get state => text()();
  TextColumn get acronym => text()();
  IntColumn get unionId => integer().references(Unions, #id)();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
