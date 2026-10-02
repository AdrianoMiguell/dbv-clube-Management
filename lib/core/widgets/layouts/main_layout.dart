import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? bottomNavBar;
  final Widget? floatingActionButton;

  const MainLayout({
    super.key,
    this.appBar,
    required this.body,
    this.drawer,
    this.bottomNavBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      drawer: drawer,
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
