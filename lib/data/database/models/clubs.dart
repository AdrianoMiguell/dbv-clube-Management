import 'package:dbv_clube_management/data/database/models/churches.dart';
import 'package:dbv_clube_management/data/database/models/districts.dart';
import 'package:drift/drift.dart';

class Clubs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get dateFundation => dateTime()();
  TextColumn get symbol => text().nullable()();
  TextColumn get history => text().nullable()();
  TextColumn get cep => text().nullable()();
  TextColumn get street => text().nullable()();
  TextColumn get number => text().nullable()();
  TextColumn get neighborhood => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get complement => text().nullable()();
  IntColumn get churchId => integer().references(Churches, #id)();
  IntColumn get districtId => integer().references(Districts, #id)();
  IntColumn get stars => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
