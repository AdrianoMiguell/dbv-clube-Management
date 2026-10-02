import 'package:flutter/material.dart';

InputDecoration inputDecorationBase({
  required Color color,
  String? label,
  String? hint,
  IconData? prefixIcon,
  Widget? suffixIcon,
}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color.withAlpha(20), width: 2),
  );

  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    hint: hint != null
        ? Text(
            hint,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade600),
          )
        : null,
    labelStyle: TextStyle(color: color.withAlpha(175)),
    labelText: label,
    floatingLabelStyle: TextStyle(color: color),
    prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, color: color.withAlpha(150))
        : null,
    suffixIcon: suffixIcon,
    focusedBorder: border,
    enabledBorder: border,
    border: border,
  );
}
