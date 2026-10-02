import 'package:dbv_clube_management/core/widgets/themes/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarCustom {
  static AppBar base(
    BuildContext context,
    String title, {
    Widget? leading,
    bool returnBase = false,
  }) {
    return AppBar(
      backgroundColor: AppColors.primaryContainer,
      leading:
          leading ??
          (returnBase
              ? IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                  iconSize: 22,
                )
              : null),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
