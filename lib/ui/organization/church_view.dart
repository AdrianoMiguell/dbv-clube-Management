import 'package:dbv_clube_management/core/widgets/components/dialog_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/empty_result_widget.dart';
import 'package:dbv_clube_management/core/widgets/components/icon_button_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom%20copy.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/layouts/main_layout.dart';
import 'package:dbv_clube_management/core/widgets/themes/app_theme.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/routes/routes.dart';
import 'package:dbv_clube_management/ui/organization/church_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChurchView extends StatelessWidget {
  const ChurchView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<ChurchViewModel>();
    double screenWidth = MediaQuery.of(context).size.width;

    return MainLayout(
      appBar: AppBar(
        title: Text("Igrejas", style: AppText.titleMedium),
        backgroundColor: AppColors.primaryContainer,
        actions: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: SizedBox(
              width: screenWidth * 0.4,
              child: TextFieldCustom(
                controller: vm.searchController,
                hint: "Pesquise algo ...",
                suffixIcon: Icon(Icons.search, color: Colors.grey),
                onChanged: vm.searchData,
              ),
            ),
          ),

          SizedBox(width: 12),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.cleanFields();
          openDialog(context, vm);
        },
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        if (vm.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: _buildListView(context, vm),
        );
      }),
    );
  }

  _buildListView(BuildContext context, ChurchViewModel vm) {
    return Obx(
      () => vm.listChurches.isEmpty
          ? Center(child: EmptyResultWidget())
          : ListView.builder(
              itemCount: vm.listChurches.length,
              itemBuilder: (context, i) {
                final church = vm.listChurches[i];
                final district = vm.findDistrict(church.districtId);

                return ListTile(
                  title: Text(church.name),
                  subtitle: Text(district?.name ?? ""),
                  leading: Icon(Icons.church),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButtonCustom.edit(
                        onPressed: () {
                          vm.edit(church);
                          openDialog(context, vm);
                        },
                      ),
                      SizedBox(width: 8),
                      IconButtonCustom.delete(
                        onPressed: () {
                          vm.delete(church.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  void openDialog(BuildContext context, ChurchViewModel vm) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        double screenWidth = MediaQuery.of(dialogContext).size.width;

        return DialogCustom(
          constraint: BoxConstraints(
            minHeight: 200,
            maxWidth: screenWidth * 0.6 >= 350 ? 350 : screenWidth * 0.6,
          ),
          child: SingleChildScrollView(
            child: Obx(
              () => Container(
                padding: const EdgeInsets.all(6),
                child: Form(
                  key: vm.formChurchKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          (vm.churchSel != null)
                              ? Icon(Icons.edit_sharp)
                              : Icon(Icons.add),
                          SizedBox(width: 6),
                          Text("Igreja"),
                        ],
                      ),
                      // Skeletonizer
                      const SizedBox(height: 18),
                      TextFieldCustom(
                        label: "Nome (Localidade)",
                        controller: vm.nameController,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownMenuFormField<District?>(
                          expandedInsets: EdgeInsets.zero,
                          enableSearch: true,
                          enableFilter: true,
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(),
                          ),
                          controller: vm.districtController..text,
                          validator: (value) {
                            if (value == null && vm.districtSel == null) {
                              return 'Selecione um distrito';
                            }
                            return null;
                          },
                          label: Text("Selecione um distrito"),
                          onSelected: (District? value) {
                            debugPrint(
                              "District Sel = ${vm.districtSel?.toJsonString()}",
                            );
                            vm.districtSel = value;
                          },
                          dropdownMenuEntries: vm.listDistricts
                              .map(
                                (District? c) => DropdownMenuEntry<District?>(
                                  value: c,
                                  label: c?.name ?? "",
                                  leadingIcon: Icon(Icons.add_box),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (!vm.formChurchKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Erro ao salvar dados"),
                                ),
                              );
                              debugPrint(
                                "Erro ao salvar dados, alguns estão vazios",
                              );
                              return;
                            }

                            Navigator.of(context).pop();
                            await vm.saveData();
                          },
                          label: Text("Salvar"),
                          icon: Icon(Icons.save),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
