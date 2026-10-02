import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class MessageSnackbar {
  static success(String message, {BuildContext? context}) {
    show(message, context: context, backColor: Colors.greenAccent.shade100);
  }

  static show(String message, {BuildContext? context, Color? backColor}) {
    ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: backColor ?? Colors.black12,
        content: Text(message),
      ),
    );
  }
}
