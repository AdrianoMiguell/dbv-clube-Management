import 'package:dbv_clube_management/core/utils/show_snackbar.dart';
import 'package:dbv_clube_management/core/widgets/components/app_bar_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/dialog_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom%20copy.dart';
import 'package:dbv_clube_management/core/widgets/layouts/main_layout.dart';
import 'package:dbv_clube_management/core/widgets/themes/app_theme.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/routes/routes.dart';
import 'package:dbv_clube_management/ui/organization/organization_area_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class OrganizationAreaView extends StatelessWidget {
  const OrganizationAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = (MediaQuery.of(context).size.width) - 25;
    final vm = Get.find<OrganizationAreaViewModel>();

    return MainLayout(
      appBar: AppBar(
        title: Text("Organização Estrutural", style: AppText.titleMedium),
        backgroundColor: AppColors.primaryContainer,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.churches, arguments: vm.areaSel);
            },
            icon: Icon(Icons.church_rounded),
          ),
          SizedBox(width: 5),
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.coordinators);
            },
            icon: Icon(Icons.person_4_sharp),
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.cleanFields();
          openDialog(context, vm);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Áreas", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 5),
            buildListCardAreas(context, vm),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Obx(
                    () => Text(
                      vm.areaPluralParam,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 4,
                  child: TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      "Filtro",
                      style: TextStyle(color: Colors.black87),
                    ),
                    icon: Icon(Icons.filter_list, color: Colors.black87),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFieldCustom(
              controller: vm.searchController,
              hint: "Pesquisa",
              prefixIcon: Icons.search,
              onChanged: vm.searchData,
            ),
            const SizedBox(height: 15),
            Expanded(
              flex: 1,
              child: Obx(() {
                if (vm.isLoadingArea.value) {
                  return Center(child: CircularProgressIndicator());
                }

                return vm.listAreas.isEmpty
                    ? Center(child: Text("Nenhum registro encontrado!"))
                    : ListView.builder(
                        itemCount: vm.listAreas.length,
                        itemBuilder: (c, i) {
                          final item = vm.listAreas[i];
                          return ListTile(
                            contentPadding: EdgeInsets.only(
                              left: 5,
                              right: 20,
                              top: 5,
                            ),
                            isThreeLine: true,
                            title: Text("${item.name}"),
                            subtitle: Text("${item.acronym}"),
                            leading: Icon(Icons.workspaces_filled),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    openDialog(context, vm);
                                    await vm.editField(item);
                                  },
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.greenAccent.withAlpha(50),
                                    ),
                                  ),
                                  icon: Icon(Icons.edit, color: Colors.green),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                    vm.deleteData(item?.id);
                                  },
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.redAccent.withAlpha(50),
                                    ),
                                  ),
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                          );
                        },
                      );
              }),
            ),
            const SizedBox(height: 10),
            Obx(
              () => vm.listAreas.isNotEmpty
                  ? Text(
                      "${vm.listAreas.length} registros encontrados",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListCardAreas(
    BuildContext context,
    OrganizationAreaViewModel vm,
  ) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildCardAreas(
              context,
              vm,
              vm.identifyArea.value == 'division'
                  ? Color.fromARGB(255, 136, 220, 196)
                  : Color.fromARGB(255, 136, 220, 196).withAlpha(150),
              'https://www.svgrepo.com/show/446392/world-1.svg',
              "division",
              "Divisões",
              "Divisões podem englobar vários países",
            ),
            buildCardAreas(
              context,
              vm,
              vm.identifyArea.value == 'union'
                  ? Color.fromARGB(255, 199, 220, 136)
                  : Color.fromARGB(255, 199, 220, 136).withAlpha(150),
              'https://www.svgrepo.com/show/308192/brazil-brazil.svg',
              "union",
              "União",
              "Uniões representam as partes das divisões.",
            ),
            buildCardAreas(
              context,
              vm,
              vm.identifyArea.value == 'association'
                  ? Color.fromARGB(255, 220, 174, 136)
                  : Color.fromARGB(255, 220, 174, 136).withAlpha(150),
              'https://www.svgrepo.com/show/480070/city-2.svg',
              "association",
              "Associações",
              "Associações representam as áreas da união.",
            ),
            buildCardAreas(
              context,
              vm,
              vm.identifyArea.value == 'region'
                  ? Color.fromARGB(255, 220, 136, 157)
                  : Color.fromARGB(255, 220, 136, 157).withAlpha(150),
              'https://www.svgrepo.com/show/490052/city.svg',
              "region",
              "Regiões",
              "Regiões representam as partes da união.",
            ),
            buildCardAreas(
              context,
              vm,
              vm.identifyArea.value == 'district'
                  ? Color.fromARGB(255, 136, 220, 196)
                  : Color.fromARGB(255, 136, 220, 196).withAlpha(150),
              'https://www.svgrepo.com/show/487200/city.svg',
              "district",
              "Distritos",
              "Distritos representam as partes da distritos.",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardAreas(
    BuildContext context,
    OrganizationAreaViewModel vm,
    Color color,
    String linkSvg,
    String valueArea,
    String title,
    String desc,
  ) {
    return InkWell(
      onTap: () => vm.changeOrganizationArea(valueArea),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(minHeight: 100, minWidth: 150),
        child: Card(
          elevation: 0,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                SizedBox(height: 10),
                SvgPicture.network(
                  linkSvg,
                  // 'https://www.svgrepo.com/show/446392/world-1.svg',
                  width: 50,
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(desc, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openDialog(BuildContext context, OrganizationAreaViewModel vm) {
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
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: vm.formAreaKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(("+ ${vm.areaParam}")),
                      const SizedBox(height: 10),
                      TextFieldCustom(
                        label: "Nome",
                        validator: (value) {
                          return (value == null || value.isEmpty)
                              ? 'Este campo é obrigatório'
                              : null;
                        },
                        controller: vm.nameController,
                      ),
                      TextFieldCustom(
                        label: "Sigla",
                        controller: vm.acronymController,
                      ),
                      if (vm.identifyArea.value != 'division') ...[
                        SizedBox(
                          width: double.infinity,
                          child: DropdownMenuFormField(
                            inputDecorationTheme: InputDecorationTheme(
                              border: OutlineInputBorder(),
                            ),
                            controller: vm.highAreaController..text,
                            validator: (value) {
                              if (value == null && vm.coordinatorSel == null) {
                                return 'Selecione uma ${vm.areaHighParam}';
                              }
                              return null;
                            },
                            enableFilter: true,
                            label: Text(vm.areaHighParam),
                            onSelected: (value) {
                              vm.highAreaSel = value;
                            },
                            dropdownMenuEntries: vm.listHighAreas
                                .map(
                                  (c) => DropdownMenuEntry<dynamic>(
                                    value: c,
                                    label: c.name,
                                    leadingIcon: Icon(Icons.add_box),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                      if (vm.labelCoordinatorParam.isNotEmpty) ...[
                        SizedBox(
                          width: double.infinity,
                          child: DropdownMenuFormField(
                            inputDecorationTheme: InputDecorationTheme(
                              border: OutlineInputBorder(),
                            ),
                            controller: vm.coordinatorController..text,
                            validator: (value) {
                              if (value == null && vm.coordinatorSel == null) {
                                return 'Selecione um Coordenador';
                              }
                              return null;
                            },
                            enableFilter: true,
                            label: const Text("Coordenador"),
                            onSelected: (value) {
                              vm.coordinatorSel = value;
                              // debugPrint("📋 Coordenador : $value");
                            },
                            dropdownMenuEntries: vm.listDropdownCoordinators
                                .map(
                                  (c) => DropdownMenuEntry<Member>(
                                    value: c,
                                    label: c.name,
                                    leadingIcon: Icon(Icons.add_box),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                      if (vm.identifyArea.value == 'district') ...[
                        DropdownMenuFormField(
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(),
                          ),
                          controller: vm.pastorController..text,
                          validator: (value) {
                            if (value == null && vm.pastorSel == null) {
                              return 'Selecione um Pastor';
                            }
                            return null;
                          },
                          enableFilter: true,
                          label: const Text("Pastor"),
                          onSelected: (value) {
                            vm.pastorSel = value;
                            // debugPrint("📋 Coordenador : $value");
                          },
                          dropdownMenuEntries: vm.listPastor
                              .map(
                                (p) => DropdownMenuEntry<Member>(
                                  value: p,
                                  label: p.name,
                                  leadingIcon: Icon(Icons.add_box),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (!vm.formAreaKey.currentState!.validate()) {
                            debugPrint(
                              "Erro ao salvar dados, alguns estão vazios",
                            );
                            return;
                          }

                          Navigator.of(context).pop();
                          await vm.saveData(id: vm.areaSel?.id);
                          vm.cleanFields();
                          MessageSnackbar.success("Dados salvos com sucesso!");
                        },
                        label: Text("Salvar"),
                        icon: Icon(Icons.save),
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
