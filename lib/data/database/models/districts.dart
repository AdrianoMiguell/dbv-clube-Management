import 'package:dbv_clube_management/data/database/models/regions.dart';
import 'package:drift/drift.dart';

class Districts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get acronym => text()();
  IntColumn get regionId => integer().references(Regions, #id)();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
