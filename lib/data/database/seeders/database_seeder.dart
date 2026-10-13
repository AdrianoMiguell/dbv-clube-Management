import 'package:dbv_clube_management/data/database/seeders/association_seeder.dart';
import 'package:dbv_clube_management/data/database/seeders/country_division_seeder.dart';
import 'package:dbv_clube_management/data/database/seeders/division_seeder.dart';
import 'package:dbv_clube_management/data/database/seeders/function_member_seeder.dart';
import 'package:dbv_clube_management/data/database/seeders/region_seeder.dart';
import 'package:dbv_clube_management/data/database/seeders/state_union_seeder.dart';
import 'package:dbv_clube_management/data/database/seeders/union_seeder.dart';
import 'package:dbv_clube_management/data/database/seeders/user_seeder.dart';

class DatabaseSeeder {
  static Future<void> runSeeders() async {
    await Future.wait([
      UserSeeder.run(),
      DivisionSeeder().run(),
      FunctionMemberSeeder().run(),
      CountryDivisionSeeder().run(),
      UnionSeeder().run(),
      StateUnionSeeder().run(),
      AssociationSeeder().run(),
      RegionSeeder().run(),
    ]);
  }
}
