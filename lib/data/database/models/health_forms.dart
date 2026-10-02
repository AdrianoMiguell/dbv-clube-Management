import 'package:dbv_clube_management/data/database/models/members.dart';
import 'package:drift/drift.dart';

class HealthForms extends Table {
  IntColumn get id => integer().autoIncrement()();

  // membro_id INTEGER NOT NULL UNIQUE
  IntColumn get memberId => integer().unique().references(Members, #id)();

  // Histórico de doenças infecciosas e vacinas
  // COVID-19
  BoolColumn get hadCovid => boolean().withDefault(const Constant(false))();

  // Dengue
  BoolColumn get hadDengue => boolean().withDefault(const Constant(false))();

  // Febre Amarela
  BoolColumn get hadYellowFever =>
      boolean().withDefault(const Constant(false))();

  // Caxumba
  BoolColumn get hadMumps => boolean().withDefault(const Constant(false))();

  // Catapora (Varicela)
  BoolColumn get hadChickenpox =>
      boolean().withDefault(const Constant(false))();

  // Sarampo
  BoolColumn get hadMeasles => boolean().withDefault(const Constant(false))();

  // Rubéola
  BoolColumn get hadRubella => boolean().withDefault(const Constant(false))();

  // Doenças respiratórias ou crônicas
  // Asma
  BoolColumn get asthma => boolean().withDefault(const Constant(false))();

  // Bronquite
  BoolColumn get bronchitis => boolean().withDefault(const Constant(false))();

  // Rinite
  BoolColumn get rhinitis => boolean().withDefault(const Constant(false))();

  // Outras condições relevantes
  // Epilepsia
  BoolColumn get epilepsy => boolean().withDefault(const Constant(false))();

  // Diabetes
  BoolColumn get diabetes => boolean().withDefault(const Constant(false))();

  // Hipertensão
  BoolColumn get hypertension => boolean().withDefault(const Constant(false))();

  // Outras doenças
  TextColumn get otherDiseases => text().nullable()();

  // Deficiências
  // Deficiência física
  TextColumn get physicalDisability =>
      text().withDefault(const Constant("nenhuma"))();

  // Deficiência auditiva
  TextColumn get hearingDisability =>
      text().withDefault(const Constant("nenhuma"))();

  // Deficiência visual
  TextColumn get visualDisability =>
      text().withDefault(const Constant("nenhuma"))();

  // Autismo
  TextColumn get autism => text().withDefault(const Constant("nenhuma"))();

  // TDAH
  TextColumn get adhd => text().withDefault(const Constant("nenhuma"))();

  // Outra condição
  TextColumn get otherCondition => text().nullable()();

  // Alergias
  // Alergias gerais
  TextColumn get allergies => text().nullable()();

  // Alergia a remédios
  TextColumn get drugAllergies => text().nullable()();

  // Alergia alimentar
  TextColumn get foodAllergies => text().nullable()();

  // Acompanhamento médico
  // Faz tratamento médico
  BoolColumn get underMedicalTreatment =>
      boolean().withDefault(const Constant(false))();

  // Usa medicação contínua
  BoolColumn get onContinuousMedication =>
      boolean().withDefault(const Constant(false))();

  // Plano de saúde
  TextColumn get healthInsurance => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(currentDateAndTime)();
}
