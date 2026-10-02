import 'package:dbv_clube_management/core/widgets/components/bottom_navigator_bar_widget.dart';
import 'package:dbv_clube_management/core/widgets/layouts/main_layout.dart';
import 'package:dbv_clube_management/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel vm = Get.find<HomeViewModel>();

    return MainLayout(
      appBar: AppBar(title: Text("DBV MANAGER"), leading: null),
      body: Obx(() => vm.currentPage),
      bottomNavBar: BottomNavigationBarWidget(
        onTap: (value) {
          if (value != vm.valuePages.value) {
            debugPrint("Pages : $value");
            vm.valuePages.value = value;
          }
        },
      ),
    );
  }
}
