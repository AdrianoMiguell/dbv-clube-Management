import 'package:dbv_clube_management/core/widgets/components/date_time_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/dropdown_menu_custom.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom%20copy.dart';
import 'package:dbv_clube_management/core/widgets/components/text_field_custom.dart';
import 'package:dbv_clube_management/core/widgets/layouts/main_layout.dart';
import 'package:dbv_clube_management/core/widgets/themes/app_theme.dart';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/ui/member/health_form_view_model.dart';
import 'package:dbv_clube_management/ui/member/member_form_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberFormView extends GetView<MemberFormViewModel> {
  const MemberFormView({super.key});

  MemberFormViewModel get vm => super.controller;
  HealthFormViewModel get vmHealth => vm.vmHealth;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: Obx(
          () => Text(
            vm.currentScreen.value == 1
                ? "Ficha de saúde"
                : "Formulário para Membros",
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 18),
          onPressed: () {
            if (vm.currentScreen.value != 0) {
              vm.currentScreen.value = 0;
              return;
            }

            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 48),
        child: Form(
          key: vm.formKey,
          child: Obx(() {
            switch (vm.currentScreen.value) {
              case 0:
                return _buildFirstScreen(context);
              case 1:
                return _buildSecondScreen(context);
              case 2:
                return _buildThirdScreen(context);
              default:
                return Center(child: Text("Erro ao carregar páginas"));
            }
          }),
        ),
      ),
    );
  }

  _buildFirstScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GetBuilder(
        builder: (MemberFormViewModel vm) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informações Pessoais", style: AppText.titleLarge),
            SizedBox(height: 6),
            Text(
              "Preencha as informações referentes ao novo membro cadastrado",
              style: AppText.bodyMedium,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TextFieldCustom(
                    label: "Nome",
                    controller: vm.nameController,
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: DateTimeFieldCustom(
                    label: "Data de Nascimento",
                    controller: vm.birthdateController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TextFieldCustom(
                    label: "Email",
                    prefixIcon: Icons.email,
                    controller: vm.emailController,
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  flex: 1,
                  child: TextFieldCustom(
                    label: "Contato",
                    prefixIcon: Icons.phone,
                    controller: vm.phoneController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: TextFieldCustom(
                    label: "CPF",
                    controller: vm.cpfController,
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  flex: 1,
                  child: TextFieldCustom(
                    label: "RG",
                    controller: vm.rgController,
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: TextFieldCustom(
                    label: "Orgão Emissor",
                    controller: vm.issuingAgencyController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFieldCustom(
              label: "Nome da Mãe",
              controller: vm.nameController,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TextFieldCustom(
                    label: "Contato",
                    prefixIcon: Icons.phone,
                    controller: vm.emailMotherController,
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  flex: 1,
                  child: TextFieldCustom(
                    label: "Contato",
                    prefixIcon: Icons.phone,
                    controller: vm.phoneMotherController,
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
            SizedBox(height: 20),
            TextFieldCustom(
              label: "Nome do Pai",
              controller: vm.nameFatherController,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TextFieldCustom(
                    label: "Email",
                    prefixIcon: Icons.email,
                    controller: vm.emailFatherController,
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  flex: 1,
                  child: TextFieldCustom(
                    label: "Contato",
                    prefixIcon: Icons.phone,
                    controller: vm.phoneFatherController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Cadastro no clube", style: AppText.titleLarge),
            SizedBox(height: 6),
            Text(
              "Informações sobre o membro no clube.",
              style: AppText.bodyMedium,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: DropdownMenuCustom<FunctionMember>(
                    list: vm.listFunctionMembers,
                    labelBuilder: (v) => v.name,
                    controller: vm.funcMemberIdController..text,
                    validator: (value) {
                      if (value == null && vm.functionMemberSel == null) {
                        return 'Selecione um função do membro';
                      }
                      return null;
                    },
                    label: "Função do Membro",
                    onSelected: (value) {
                      vm.functionMemberSel = value;
                      vm.update();
                      debugPrint("📋 Função do membro : $value");
                    },
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  flex: 1,
                  child: TextFieldCustom(
                    label: "Camisa",
                    prefixIcon: Icons.one_x_mobiledata_sharp,
                    controller: vm.shirtSizeController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            DropdownMenuCustom<Club>(
              list: vm.listClubs,
              labelBuilder: (v) => v.name,
              controller: vm.clubIdController..text,
              validator: (value) {
                if (value == null && vm.clubSel == null) {
                  return 'Selecione um clube para o membro';
                }
                return null;
              },
              label: "Clube",
              onSelected: (value) {
                vm.clubSel = value;
                debugPrint("📋 Clube : $value");
              },
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text("Ficha de Saúde", style: AppText.titleMedium),
                subtitle: Text(
                  "Preencha as informações sobre a saúde do novo membro",
                  style: AppText.bodyMedium,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  vm.currentScreen.value = 1;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSecondScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("Status de saúde", style: AppText.titleLarge),
          SizedBox(height: 6),
          Text(
            "Preencha o formulário a seguir sobre a saúde do membro: ",
            style: AppText.bodyMedium,
          ),
          SizedBox(height: 20),
          Text(
            "Doenças e Enfermidades",
            style: AppText.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: vmHealth.hadCovid.value,
                      title: Text("Já teve Covid?", style: AppText.bodyMedium),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.hadCovid.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.hadDengue.value,
                      title: Text("Já teve Denge?", style: AppText.bodyMedium),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.hadDengue.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.hadYellowFever.value,
                      title: Text(
                        "Já teve Febre Amarela?",
                        style: AppText.bodyMedium,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.hadYellowFever.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.hadMumps.value,
                      title: Text(
                        "Já teve Caxumba?",
                        style: AppText.bodyMedium,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.hadMumps.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.hadChickenpox.value,
                      title: Text(
                        "Já teve Catapora?",
                        style: AppText.bodyMedium,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.hadChickenpox.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.hadMeasles.value,
                      title: Text(
                        "Já teve Sarampo?",
                        style: AppText.bodyMedium,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.hadMeasles.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.hadRubella.value,
                      title: Text(
                        "Já teve Rubéola?",
                        style: AppText.bodyMedium,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.hadRubella.value = value ?? false;
                      },
                    ),
                  ],
                ),
              ),

              Flexible(
                child: Column(
                  children: [
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.asthma.value,
                      title: Text("Tem Asma?", style: AppText.bodyMedium),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.asthma.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.bronchitis.value,
                      title: Text("Tem Bronquite?", style: AppText.bodyMedium),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.bronchitis.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.rhinitis.value,
                      title: Text("Tem Rinite?", style: AppText.bodyMedium),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.rhinitis.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.epilepsy.value,
                      title: Text("Tem Epilepsia?", style: AppText.bodyMedium),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.epilepsy.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.diabetes.value,
                      title: Text("Tem Diabetes?", style: AppText.bodyMedium),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.diabetes.value = value ?? false;
                      },
                    ),
                    SizedBox(height: 6),
                    CheckboxListTile(
                      value: vmHealth.hypertension.value,
                      title: Text(
                        "Tem Hipertensão?",
                        style: AppText.bodyMedium,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        vmHealth.hypertension.value = value ?? false;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12),
          Text(
            "Possui outro tipo de doença (Descreva): ",
            style: AppText.bodyMedium,
          ),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva aqui ...",
            controller: vmHealth.otherDiseases,
          ),
          SizedBox(height: 32),

          Text(
            "Deficiências e Condições especiais",
            style: AppText.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text("Possui deficiência física: ", style: AppText.bodyMedium),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva melhor a condição ... ",
            controller: vmHealth.physicalDisability,
          ),
          SizedBox(height: 16),
          Text("Possui deficiência visual:", style: AppText.bodyMedium),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva melhor a condição ... ",
            controller: vmHealth.visualDisability,
          ),
          SizedBox(height: 16),
          Text("Possui deficiência auditiva:", style: AppText.bodyMedium),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva melhor a condição ... ",
            controller: vmHealth.hearingDisability,
          ),
          SizedBox(height: 16),
          Text("Possui algum nível de autismo: ", style: AppText.bodyMedium),
          SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            child: DropdownMenuFormField(
              expandedInsets: EdgeInsets.zero,
              enableSearch: true,
              enableFilter: true,
              controller: vmHealth.autism,
              dropdownMenuEntries: vmHealth.autismLevels
                  .map((a) => DropdownMenuEntry(value: a, label: a))
                  .toList(),
            ),
          ),
          SizedBox(height: 16),
          Text("Possui algum nível de TDAH:", style: AppText.bodyMedium),
          SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            child: DropdownMenuFormField(
              expandedInsets: EdgeInsets.zero,
              enableSearch: true,
              enableFilter: true,
              controller: vmHealth.adhd,
              dropdownMenuEntries: vmHealth.adhdLevels
                  .map((a) => DropdownMenuEntry(value: a, label: a))
                  .toList(),
            ),
          ),
          SizedBox(height: 16),
          Text("Alguma outra condição?", style: AppText.bodyMedium),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva aqui ... ",
            controller: vmHealth.otherCondition,
          ),

          /** -------------------------------------------------------------------- **/
          SizedBox(height: 32),
          Text(
            "Quadro médico geral",
            style: AppText.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text("Possui alergia alimentar: :", style: AppText.bodyMedium),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva aqui ... ",
            controller: vmHealth.foodAllergies,
          ),
          SizedBox(height: 16),
          Text("Possui alergia a remédios:", style: AppText.bodyMedium),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva aqui ... ",
            controller: vmHealth.drugAllergies,
          ),
          SizedBox(height: 16),
          Text("Possui outros tipos de alergia: ", style: AppText.bodyMedium),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva aqui ... ",
            controller: vmHealth.allergies,
          ),
          SizedBox(height: 16),
          Text("Possui algum plano de saúde: ", style: AppText.bodyMedium),
          SizedBox(height: 6),
          TextFieldCustom(
            hint: "Descreva aqui ... ",
            controller: vmHealth.healthInsurance,
          ),
          SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: CheckboxListTile(
                  value: vmHealth.underMedicalTreatment.value,
                  title: Text(
                    "Faz tratamento médico?",
                    style: AppText.bodyMedium,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    vmHealth.underMedicalTreatment.value = value ?? false;
                  },
                ),
              ),
              SizedBox(width: 24),
              Flexible(
                child: CheckboxListTile(
                  value: vmHealth.onContinuousMedication.value,
                  title: Text(
                    "Uso contínuo de medicação?",
                    style: AppText.bodyMedium,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    vmHealth.onContinuousMedication.value = value ?? false;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 42),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
            child: ElevatedButton.icon(
              onPressed: () {
                vmHealth.saveData();
              },
              label: Text("Salvar"),
              icon: Icon(Icons.save_rounded),
            ),
          ),
        ],
      ),
    );
  }

  _buildThirdScreen(BuildContext context) {
    return Container(child: Text("Terceiro"));
  }
}
