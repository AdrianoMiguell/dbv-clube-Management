import 'package:dbv_clube_management/core/widgets/components/empty_result_widget.dart';
import 'package:dbv_clube_management/core/widgets/layouts/main_layout.dart';
import 'package:dbv_clube_management/core/widgets/themes/app_theme.dart';
import 'package:dbv_clube_management/routes/routes.dart';
import 'package:dbv_clube_management/ui/member/member_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MemberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Get.find<MemberViewModel>();

    return MainLayout(
      appBar: AppBar(title: Text("Membros"), centerTitle: true),
      body: Obx(() {
        if (vm.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.only(left: 32, right: 32, top: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lista de Membros", style: AppText.titleMedium),
                  TextButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Registrar Membro"),
                    onPressed: () {
                      Get.toNamed(Routes.memberForm);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildListView(context, vm),
            ],
          ),
        );
      }),
    );
  }

  _buildListView(BuildContext context, MemberViewModel vm) {
    if (vm.listClubs.isEmpty) {
      return Expanded(child: EmptyResultWidget());
    }
    
    return ListView.builder(
      itemCount: vm.listMembers.length,
      itemBuilder: (context, index) {
        final member = vm.listMembers[index];

        return Card(
          margin: EdgeInsets.only(bottom: 10),
          child: ListTile(title: Text("Nome: ${member.name}")),
        );
      },
    );
  }
}
