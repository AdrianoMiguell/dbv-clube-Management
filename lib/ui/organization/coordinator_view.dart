import 'package:dbv_clube_management/core/utils/show_snackbar.dart';
import 'package:dbv_clube_management/core/widgets/components/date_time_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/dialog_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/document_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/dropdown_menu_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/empty_result_widget.dart';
import 'package:dbv_clube_management/core/widgets/components/icon_button_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom%20copy.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/layouts/main_layout.dart';
import 'package:dbv_clube_management/core/widgets/themes/app_theme.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/database/models/function_members.dart';
import 'package:dbv_clube_management/data/database/models/members.dart';
import 'package:dbv_clube_management/ui/organization/coordinator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CoordinatorView extends GetView<CoordinatorViewModel> {
  const CoordinatorView({super.key});

  CoordinatorViewModel get vm => super.controller;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MainLayout(
      appBar: AppBar(
        title: Text("Coordenadores", style: AppText.titleMedium),
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
          // vm.cleanFields();
          _openBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Obx(() {
          if (vm.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return _buildSepFunctionList(context);
        }),
      ),
    );
  }

  _buildSepFunctionList(BuildContext context) {
    final sections = [
      (
        title: "Coordenadores Gerais",
        list: vm.listCoordinatorGeral,
        icon: Icons.star,
      ),
      (title: "Pastores", list: vm.listPastor, icon: Icons.church),
      (title: "Regionais", list: vm.listRegionais, icon: Icons.map),
      (title: "Distritais", list: vm.listDistritais, icon: Icons.location_on),
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];
        if (section.list.isEmpty) {
          return const SizedBox.shrink();
        }

        return _buildSection(
          context,
          section.title,
          section.list,
          section.icon,
        );
      },
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Member> list,
    IconData icon,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(icon),
        shape: const Border(),
        collapsedShape: const Border(),
        childrenPadding: EdgeInsets.only(bottom: 6),
        title: Row(
          children: [
            Text(title, style: AppText.titleMedium),
            const SizedBox(width: 8),
            // badge com a quantidade
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${list.length}',
                style: AppText.labelSmall?.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        initiallyExpanded: true,
        children: [
          if (list.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Nenhum registro encontrado."),
            )
          else
            _buildListView(context, list),
        ],
      ),
    );
  }

  _buildListView(BuildContext context, List<Member> list) {
    return Column(
      children: list
          .map(
            (item) => ListTile(
              leading: const Icon(Icons.person),
              title: Text(item.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButtonCustom.edit(
                    onPressed: () {
                      vm.edit(item);
                      _openBottomSheet(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  IconButtonCustom.delete(onPressed: () => vm.delete(item.id)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
  // _buildListView(BuildContext context, List<Coordinator> list) {
  //   return list.isEmpty
  //       ? Center(child: Text("Nenhum resultado encontrado!"))
  //       : ListView.builder(
  //           itemCount: list.length,
  //           itemBuilder: (context, i) {
  //             final item = list[i];
  //             return ListTile(
  //               leading: Icon(Icons.person),
  //               title: Text(item.name),
  //               trailing: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   IconButtonCustom.edit(
  //                     onPressed: () {
  //                       vm.edit(item);
  //                       _openBottomSheet(context);
  //                     },
  //                   ),
  //                   SizedBox(width: 8),
  //                   IconButtonCustom.delete(
  //                     onPressed: () {
  //                       vm.delete(item.id);
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         );
  // }

  _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que ele cresça além de 50% da tela
      backgroundColor: Colors.transparent, // Para podermos arredondar as bordas
      builder: (context) {
        return Container(
          // Define a altura máxima como 90% da tela
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white, // Ou sua cor de fundo
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(
                    context,
                  ).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Form(
                        key: vm.coordinatorFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Registro de coordenador",
                              style: AppText.titleLarge,
                            ),
                            SizedBox(height: 32),
                            TextFieldCustom(
                              controller: vm.nameController,
                              validator: (v) => (v == null || v.isEmpty)
                                  ? "Este Campo é obrigatório"
                                  : null,
                              label: "Nome",
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: vm.listFunctionMembers.isEmpty
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Nenhuma função encontrada"),
                                          SizedBox(width: 12),
                                          IconButtonCustom.add(
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    )
                                  : DropdownMenuCustom<FunctionMember>(
                                      list: vm.listFunctionMembers,
                                      label: "Selecione uma função",
                                      controller: TextEditingController()
                                        ..text =
                                            vm.funcMemberSel.value?.name ?? "",
                                      validator: (value) =>
                                          value == null &&
                                              vm.funcMemberSel.value == null
                                          ? "Este campo é obrigatório"
                                          : null,
                                      labelBuilder: (f) => f.name,
                                      initialSelection: vm.funcMemberSel.value,
                                      onSelected: (value) =>
                                          vm.funcMemberSel.value = value,
                                      icon: Icon(Icons.list_alt_sharp),
                                    ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: DateTimeFieldCustom(
                                    controller: vm.birthdateController,
                                    validator: (v) => (v == null || v.isEmpty)
                                        ? "Este Campo é obrigatório"
                                        : null,
                                    label: "Data de Nascimento",
                                    onChanged: (value) {
                                      debugPrint(
                                        "Value: $value | Text Controller : ${vm.birthdateController.text}",
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(width: 12),
                                Flexible(
                                  child: DocumentFieldCustom(
                                    controller: vm.cpfController,
                                    type: DocumentType.cpf,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Flexible(
                                  child: DocumentFieldCustom(
                                    controller: vm.rgController,
                                    type: DocumentType.rg,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            TextFieldCustom(
                              controller: vm.emailController,
                              label: "Email",
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: TextFieldCustom(
                                    controller: vm.phoneController,
                                    label: "Telefone",
                                  ),
                                ),
                                SizedBox(width: 12),

                                Flexible(
                                  child: TextFieldCustom(
                                    controller: vm.sizeShirtController,
                                    label: "Tamanho da Camisa",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            TextFieldCustom(
                              controller: vm.cepController,
                              label: "CEP",
                            ),
                            const SizedBox(height: 12),

                            TextFieldCustom(
                              controller: vm.neighborhoodController,
                              label: "Logradouro",
                            ),
                            const SizedBox(height: 12),

                            TextFieldCustom(
                              controller: vm.streetController,
                              label: "N° Rua",
                            ),
                            const SizedBox(height: 12),

                            TextFieldCustom(
                              controller: vm.complementController,
                              label: "Complemento",
                            ),

                            const SizedBox(height: 24),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (!vm.coordinatorFormKey.currentState!
                                      .validate()) {
                                    debugPrint(
                                      "Erro ao salvar dados, alguns estão vazios",
                                    );
                                    return;
                                  }

                                  Navigator.of(context).pop();
                                  vm.saveData();
                                  MessageSnackbar.success(
                                    "Dados salvos com sucesso!",
                                  );
                                },
                                child: Text("Salvar"),
                              ),
                            ),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
