import 'package:drift/drift.dart';

enum UserFunction { user, administrator, coordinator }

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get email => text().unique().withLength(min: 1, max: 300)();
  TextColumn get token => text().unique()();
  TextColumn get passwordHash => text()();

  IntColumn get function => integer()
      .map(const EnumIndexConverter<UserFunction>(UserFunction.values))
      .withDefault(Constant(UserFunction.user.index))();

  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
