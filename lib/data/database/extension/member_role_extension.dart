import 'package:dbv_clube_management/data/database/database.dart';

extension MemberRoleExtensions on Member {
  bool get isCoordinator => functionMemberId >= 1 && functionMemberId <= 4;

  bool get isDepartamental => functionMemberId == 1;
  bool get isPastor => functionMemberId == 2;
  bool get isRegional => functionMemberId == 3;
  bool get isDistrictal => functionMemberId == 4;

  bool get isDirector => functionMemberId == 5;
  bool get isLider => functionMemberId >= 6 && functionMemberId <= 11;
  bool get isDesbravador => functionMemberId >= 12;

  String get scopeRole {
    switch (functionMemberId) {
      case 1:
        return 'Departamental';
      case 2:
        return 'Pastor Distrital';
      case 3:
        return 'Regional';
      case 4:
        return 'Distrital';
      case 5:
        return 'Diretor';
      case 6:
        return 'Lider';
      case 7:
        return 'Diretor Associoado';
      case 8:
        return 'Conselheiro/Líder';
      case 9:
        return 'Secretário/Lider';
      case 10:
        return 'Tesoureiro/Lider';
      case 11:
        return 'Capelão/Lider';
      case 12:
        return 'Desbravador';
      case 13:
        return 'Capitão/Desbravador';
      case 14:
        return 'Secretário/Desbravador';
      case 15:
        return 'Tesoureiro/Desbravador';
      case 16:
        return 'Capelão/Desbravador';
      case 17:
        return 'Padioleiro/Desbravador';
      default:
        return "";
    }
  }
}

extension MemberRoleScope on MemberRole {
  bool get isActive {
    if (endDate == null) return true;
    return endDate!.isAfter(DateTime.now());
  }
}
