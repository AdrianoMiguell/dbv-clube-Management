import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AppDirectory {
  static Future<Directory> getAppDirectory() async {
    final baseDir = await getTemporaryDirectory();
    debugPrint('🚩 Base Dir : ${baseDir.path}');
    final joinDir = join(baseDir.path, 'dbv_club_management');
    final appDir = Directory(joinDir);
    if (!(await appDir.exists())) {
      await appDir.create(recursive: true);
    }
    return appDir;
  }
}
