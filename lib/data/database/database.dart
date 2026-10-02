import 'dart:io';
import 'package:dbv_clube_management/core/config/app_directory.dart';
import 'package:dbv_clube_management/data/database/models/associations.dart';
import 'package:dbv_clube_management/data/database/models/churches.dart';
import 'package:dbv_clube_management/data/database/models/clubs.dart';
import 'package:dbv_clube_management/data/database/models/country_divisions.dart';
import 'package:dbv_clube_management/data/database/models/districts.dart';
import 'package:dbv_clube_management/data/database/models/divisions.dart';
import 'package:dbv_clube_management/data/database/models/function_members.dart';
import 'package:dbv_clube_management/data/database/models/health_forms.dart';
import 'package:dbv_clube_management/data/database/models/member_role.dart';
import 'package:dbv_clube_management/data/database/models/state_unions.dart';
import 'package:dbv_clube_management/data/database/models/members.dart';
import 'package:dbv_clube_management/data/database/models/regions.dart';
import 'package:dbv_clube_management/data/database/models/unions.dart';
import 'package:dbv_clube_management/data/database/models/users.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    HealthForms,
    FunctionMembers,
    Divisions,
    CountryDivisions,
    Unions,
    StateUnions,
    Associations,
    Regions,
    Districts,
    Churches,
    Clubs,
    Members,
    MemberRoles,
  ],
)
class AppDatabase extends _$AppDatabase {
  static AppDatabase? _instance;

  factory AppDatabase() {
    _instance ??= AppDatabase._internal(_openConnection());
    return _instance!;
  }

  AppDatabase._internal(super.executor);

  static Future<void> deleteDatabaseFile() async {
    if (_instance != null) {
      await _instance!.close();
      _instance = null;
    }

    final dbDir = await AppDirectory.getAppDirectory();
    final path = p.join(dbDir.path, 'dbv_management.sqlite');
    final file = File(path);

    debugPrint("📌 Path : $path");

    // 3. Deleta o arquivo se ele existir
    if (await file.exists()) {
      await file.delete();
      debugPrint("Banco de dados dbv_management.sqlite deletado com sucesso!");
    }
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    // onUpgrade: (m, from, to) async {
    //   if (from < 3) {
    //     await m.createTable(healthForms);
    //   }
    // },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  @override
  // ignore: override_on_non_overriding_member
  ValueSerializer get serializer =>
      const ValueSerializer.defaults(serializeDateTimeValuesAsString: true);
  // @override
  // ValueSerializer get serializer => const ValueSerializer.defaults(
  //   serializeDateTimeAsExtensionString:
  //       true, // Ajuda com o que vamos ver abaixo!
  // );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbDir = await AppDirectory.getAppDirectory();
    final path = p.join(dbDir.path, 'dbv_management.sqlite');
    final file = File(path);

    // debugPrint("""
    //   -----------------------
    //   Path : $path
    //   -----------------------
    // """);

    final cachebase = (await getTemporaryDirectory()).path;

    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
