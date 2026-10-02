import 'dart:io';

import 'package:dbv_clube_management/core/widgets/components/date_time_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/dialog_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/dropdown_menu_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/empty_result_widget.dart';
import 'package:dbv_clube_management/core/widgets/components/icon_button_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/image_picker_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/layouts/main_layout.dart';
import 'package:dbv_clube_management/core/widgets/themes/app_theme.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/routes/routes.dart';
import 'package:dbv_clube_management/ui/clubs/club_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubView extends StatelessWidget {
  const ClubView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<ClubViewModel>();
    double screenWidth = MediaQuery.of(context).size.width;

    return MainLayout(
      appBar: AppBar(title: Text("Clubes")),
      body: Container(
        height: double.infinity,
        width: screenWidth,
        padding: EdgeInsets.only(left: 32, right: 32, bottom: 24),
        color: AppColors.onPrimary,
        child: Obx(
          () => _buildCurrentScreen(context, vm.currentScreenId.value, vm),
        ),
      ),
      bottomNavBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.class_),
              label: "Registros",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_document),
              label: "Formulário",
            ),
          ],
          currentIndex: vm.currentScreenId.value,
          onTap: (value) {
            debugPrint("Valor Clicado : $value");
            vm.currentScreenId.value = value;
          },
        ),
      ),
    );
  }

  Widget _buildCurrentScreen(
    BuildContext context,
    int index,
    ClubViewModel vm,
  ) {
    if (index == 0) return _buildList(vm);
    return _buildForm(context, vm);
  }

  Widget _buildList(ClubViewModel vm) {
    return Column(
      children: [
        SizedBox(height: 32),
        TextFieldCustom(
          controller: vm.searchController,
          hint: "Pesquisa",
          onChanged: vm.searchData,
        ),
        SizedBox(height: 12),
        if (vm.listClubs.isEmpty) ...{
          Expanded(child: EmptyResultWidget()),
        } else ...{
          Expanded(
            child: ListView.builder(
              itemCount: vm.listClubs.length,
              itemBuilder: (context, i) {
                final club = vm.listClubs[i];

                return ListTile(
                  leading: Icon(Icons.health_and_safety_outlined),
                  title: Text("Nome: ${club.name}"),
                  onTap: () => vm.edit(club),
                );
              },
            ),
          ),
        },
      ],
    );
  }

  // Verifica se o caminho é válido antes de exibir
  Widget buildClubSymbol(String? path) {
    if (path == null || path.isEmpty) {
      return const Icon(Icons.image_not_supported);
    }
    return Image.file(
      File(path),
      width: 48,
      height: 48,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
    );
  }

  Widget _buildForm(BuildContext context, ClubViewModel vm) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 16),
      child: Form(
        key: vm.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text("Formulário de Cadastro", style: AppText.titleMedium),
            Text(
              "Preencha o máximo de campos abaixo. Alguns são obrigatórios.",
              style: AppText.bodySmall,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TextFieldCustom(
                    label: "Nome",
                    prefixIcon: Icons.article_rounded,
                    controller: vm.nameController,
                    validator: (value) {
                      if (value == null || vm.nameController.text.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: DateTimeFieldCustom(
                    label: "Fundação",
                    controller: vm.dateFundationController,
                    validator: (value) {
                      if (value == null ||
                          vm.dateFundationController.text.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row(
            //   children: [
            //     if (vm.symbolController.text.isNotEmpty)
            //       SizedBox(
            //         width: 100,
            //         child: buildClubSymbol(vm.symbolController.text),
            //       ),
            //     Flexible(
            //       flex: 4,
            //       fit: FlexFit.tight,
            //       child:
            ImagePickerFieldCustom(
              label: "Simbolo (Link da imagem)",
              controller: vm.symbolController,
              onChanged: (_) {
                debugPrint("Valor mudado ");
                vm.update();
              },
            ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 25),
            Text("Informações de Endereço", style: AppText.bodyMedium),
            SizedBox(height: 10),
            TextFieldCustom(
              label: "CEP",
              controller: vm.cepController,
              type: TextInputType.number,
              validator: (value) {
                if (value == null || vm.cepController.text.isEmpty) {
                  return 'Este campo é obrigatório';
                }

                if (!vm.cepIsValid.value) return "O CEP informado é invalido";

                return null;
              },
              onChanged: (v) {
                vm.selectAddress(v);
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: TextFieldCustom(
                    label: "Estado",
                    controller: vm.stateController,
                    validator: (value) {
                      if (value == null || vm.stateController.text.isEmpty) {
                        return 'Campo Obrigatório. Digite o Estado';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: TextFieldCustom(
                    label: "Cidade",
                    controller: vm.cityController,
                    validator: (value) {
                      if (value == null || vm.cityController.text.isEmpty) {
                        return 'Campo Obrigatório. Digite o Cidade';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFieldCustom(
                    label: "Bairro",
                    controller: vm.neighborhoodController,
                    validator: (value) {
                      if (value == null ||
                          vm.neighborhoodController.text.isEmpty) {
                        return 'Campo Obrigatório. Digite o Bairro';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextFieldCustom(
                    label: "Rua",
                    controller: vm.streetController,
                    validator: (value) {
                      if (value == null || vm.streetController.text.isEmpty) {
                        return 'Campo Obrigatório. Digite o nome do clube';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextFieldCustom(
                    label: "Número",
                    controller: vm.numberController,
                    type: TextInputType.number,
                    validator: (value) {
                      if (value == null || vm.numberController.text.isEmpty) {
                        return 'Campo Obrigatório. Digite o nome do clube';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFieldCustom(
              label: "Complemento",
              controller: vm.complementController,
            ),

            SizedBox(height: 25),
            Text("Demais Informações", style: AppText.bodyMedium),
            SizedBox(height: 10),
            if (vm.listChurches.isNotEmpty) ...[
              DropdownMenuCustom<Church>(
                list: vm.listChurches,
                labelBuilder: (v) => v.name,
                controller: vm.churchController..text,
                validator: (value) {
                  if (value == null || vm.churchSel == null) {
                    return 'Selecione uma igreja';
                  }
                  return null;
                },
                label: "Igreja",
                onSelected: (value) {
                  vm.churchSel = value;
                },
              ),
            ] else ...[
              Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nenhuma igreja encontrada!"),
                    SizedBox(width: 12),
                    IconButtonCustom.add(
                      onPressed: () {
                        Get.toNamed(Routes.churches);
                        return;
                      },
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 15),
            if (vm.listDistricts.isNotEmpty) ...[
              DropdownMenuCustom<District>(
                list: vm.listDistricts,
                labelBuilder: (v) => v.name,
                controller: vm.districtController..text,
                validator: (value) {
                  if (value == null || vm.districtSel == null) {
                    return 'Selecione um distrito';
                  }
                  return null;
                },
                label: "Distrito",
                onSelected: (value) {
                  vm.districtSel = value;
                  // debugPrint("📋 Coordenador : $value");
                },
              ),
            ] else ...[
              Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nenhum distrito encontrado!"),
                    SizedBox(width: 12),
                    IconButtonCustom.add(
                      onPressed: () {
                        Get.toNamed(Routes.organizationArea);
                        return;
                      },
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 15),
            if (vm.listDirectors.isNotEmpty) ...[
              DropdownMenuCustom<Member>(
                labelBuilder: (v) => v.name,
                list: vm.listDirectors,
                controller: vm.directorController..text,
                validator: (value) {
                  if (value == null || vm.directorSel == null) {
                    return 'Selecione um diretor';
                  }
                  return null;
                },
                label: "Diretor",
                onSelected: (value) {
                  vm.directorSel = value;
                  // debugPrint("📋 Coordenador : $value");
                },
              ),
            ] else ...[
              Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nenhum diretor encontrado!"),
                    SizedBox(width: 12),
                    IconButtonCustom.add(
                      onPressed: () {
                        Get.toNamed(Routes.members);
                        return;
                      },
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("História (Opcional)", style: AppText.bodyMedium),
                SizedBox(height: 8),
                TextFieldCustom(
                  controller: vm.historyController,
                  maxLines: 5,
                  type: TextInputType.multiline,
                ),
              ],
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (!vm.formKey.currentState!.validate()) {
                    return;
                  }

                  vm.saveData();
                },
                child: Text("Salvar"),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
