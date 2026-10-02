import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/member/health_form_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthFormViewModel extends GetxController {
  final HealthFormRepository _healthFormRepository = HealthFormRepository();

  int? idSel;
  RxBool hadCovid = false.obs;
  RxBool hadDengue = false.obs;
  RxBool hadYellowFever = false.obs;
  RxBool hadMumps = false.obs;
  RxBool hadChickenpox = false.obs;
  RxBool hadMeasles = false.obs;
  RxBool hadRubella = false.obs;
  RxBool asthma = false.obs;
  RxBool bronchitis = false.obs;
  RxBool rhinitis = false.obs;
  RxBool epilepsy = false.obs;
  RxBool diabetes = false.obs;
  RxBool hypertension = false.obs;
  RxBool underMedicalTreatment = false.obs;
  RxBool onContinuousMedication = false.obs;

  TextEditingController otherDiseases = TextEditingController();
  TextEditingController physicalDisability = TextEditingController();
  TextEditingController hearingDisability = TextEditingController();
  TextEditingController visualDisability = TextEditingController();
  TextEditingController autism = TextEditingController();
  TextEditingController adhd = TextEditingController();
  TextEditingController otherCondition = TextEditingController();
  TextEditingController allergies = TextEditingController();
  TextEditingController drugAllergies = TextEditingController();
  TextEditingController foodAllergies = TextEditingController();
  TextEditingController healthInsurance = TextEditingController();

  List<String> adhdLevels = ["leve", "moderado", "grave"];
  List<String> autismLevels = [
    "Nível 1 (leve)",
    "Nível 2 (moderado)",
    "Nível 3 (severo)",
  ];

  HealthForm? healthFormSel;
  User? userSel;
  FunctionMember? functionMemberSel;
  Club? clubSel;

  RxBool isLoading = true.obs;

  saveData() async {
    Map<String, dynamic> data = {
      'hadCovid': hadCovid.value,
      'hadDengue': hadDengue.value,
      'hadYellowFever': hadYellowFever.value,
      'hadMumps': hadMumps.value,
      'hadChickenpox': hadChickenpox.value,
      'hadMeasles': hadMeasles.value,
      'hadRubella': hadRubella.value,
      'asthma': asthma.value,
      'bronchitis': bronchitis.value,
      'rhinitis': rhinitis.value,
      'epilepsy': epilepsy.value,
      'diabetes': diabetes.value,
      'hypertension': hypertension.value,
      'underMedicalTreatment': underMedicalTreatment.value,
      'onContinuousMedication': onContinuousMedication.value,
      'otherDiseases': otherDiseases.text,
      'physicalDisability': physicalDisability.text,
      'hearingDisability': hearingDisability.text,
      'visualDisability': visualDisability.text,
      'autism': autism.text,
      'adhd': adhd.text,
      'otherCondition': otherCondition.text,
      'allergies': allergies.text,
      'drugAllergies': drugAllergies.text,
      'foodAllergies': foodAllergies.text,
      'healthInsurance': healthInsurance.text,
    };

    try {
      HealthFormsCompanion healthForm = _healthFormRepository.prepareData(data);
      int newId = await _healthFormRepository.save(healthForm);
      idSel = newId;
    } catch (e) {
      debugPrint("Erro ao registrar dados de membro : $e");
    }
  }
}
