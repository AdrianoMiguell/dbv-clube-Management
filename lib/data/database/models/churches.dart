import 'package:dbv_clube_management/data/database/models/districts.dart';
import 'package:drift/drift.dart';

@DataClassName("Church")
class Churches extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get districtId => integer().references(Districts, #id)();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
