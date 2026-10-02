import 'dart:async';

import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/member/member_repository.dart';
import 'package:dbv_clube_management/data/repositories/club/club_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/church_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/district_repository.dart';
import 'package:dbv_clube_management/data/services/address/address_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClubViewModel extends GetxController {
  RxInt currentScreenId = 0.obs;

  final _clubRepository = ClubRepository();
  final _churchRepository = ChurchRepository();
  final _districtRepository = DistrictRepository();
  final _memberRepository = MemberRepository();

  final formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateFundationController = TextEditingController();
  TextEditingController symbolController = TextEditingController();
  TextEditingController historyController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController churchController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  TextEditingController starsController = TextEditingController();

  Club? clubSel;
  Church? churchSel;
  District? districtSel;
  Member? directorSel;

  RxList<Club> listClubs = <Club>[].obs;
  RxList<Church> listChurches = <Church>[].obs;
  RxList<District> listDistricts = <District>[].obs;
  RxList<Member> listMembers = <Member>[].obs;
  RxList<Member> listLiders = <Member>[].obs;

  RxList<Member> get listDirectors =>
      listLiders.where((m) => m.functionMemberId == 6).toList().obs;

  // 'dateFundation': DateFormat('dd/MM/yyyy').tryParse(dateFundationController.text)?.toIso8601String(),

  Map<String, dynamic> get data => {
    'id': clubSel?.id,
    'name': nameController.text,
    'dateFundation': DateFormat(
      'dd/MM/yyyy',
    ).tryParse(dateFundationController.text)?.toIso8601String(),
    'symbol': symbolController.text,
    'history': historyController.text,
    'cep': cepController.text,
    'street': streetController.text,
    'number': numberController.text,
    'complement': complementController.text,
    'neighborhood': neighborhoodController.text,
    'city': cityController.text,
    'state': stateController.text,
    'churchId': churchSel?.id,
    'districtId': districtSel?.id,
    'directorId': directorSel?.id,
  };

  RxBool cepIsValid = false.obs;

  Timer? _timerAddress;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    await getAllClubs();
    await getAllChurches();
    await getAllDistricts();
    await getAllMembers();
  }

  getAllClubs() async {
    final list = await _clubRepository.getAll();
    listClubs.assignAll(list);
  }

  getAllChurches() async {
    final list = await _churchRepository.getAll();
    listChurches.assignAll(list);
  }

  getAllDistricts() async {
    final list = await _districtRepository.getAll();
    listDistricts.assignAll(list);
  }

  getAllMembers() async {
    final list = await _memberRepository.getAll();
    listMembers.assignAll(list);
  }

  getAllLiders() async {
    final list = await _memberRepository.getAllLiders();
    listLiders.assignAll(list);
  }

  Timer? _timerSearch;

  searchData(String value) {
    if ((_timerSearch?.isActive ?? false)) _timerSearch!.cancel();

    _timerSearch = Timer(Duration(milliseconds: 750), () async {
      try {
        final list = await _clubRepository.search(value);
        listClubs.assignAll(list);
      } catch (e) {
        debugPrint("Erro ao pesquisar item");
      }
    });
  }

  saveData() async {
    try {
      ClubsCompanion clubData = _clubRepository.prepareData(data);
      int newId = await _clubRepository.save(clubData);

      Club? newClub = await _clubRepository.get(newId);

      if (newClub == null) return;

      final index = listClubs.indexWhere((c) => c.id == newId);

      if (index != -1) {
        listClubs[index] = newClub;
      } else {
        listClubs.add(newClub);
        clearFields();
      }

      currentScreenId.value = 0;
    } catch (e) {
      debugPrint("Erro ao registrar dados de clube : $e");
    }
  }

  void fillAddress(Map<String, dynamic> data) {
    try {
      final state = data['estado'];
      final city = data['localidade'];
      final neighborhood = data['bairro'];
      final complement = data['complemento'];

      stateController.text = state ?? "";
      cityController.text = city ?? "";
      neighborhoodController.text = neighborhood ?? "";
      complementController.text = complement ?? "";
    } catch (e) {
      debugPrint("Erro ao endereçar pelo CEP : $e");
    }
  }

  void selectAddress(String cep) {
    if ((_timerAddress?.isActive ?? false)) _timerAddress!.cancel();

    _timerAddress = Timer(Duration(seconds: 1), () async {
      if (cep.length != 8) {
        cepIsValid.value = true;
        return debugPrint("Evento cancelado");
      }

      final mapAddress = await AddressService.buscarCep(cep);
      debugPrint("Map Address : $mapAddress");
      if (mapAddress != null) {
        cepIsValid.value = true;
        fillAddress(mapAddress);
      } else {
        cepIsValid.value = false;
      }
    });
  }

  clearFields() {
    clubSel = null;
    nameController.text = "";
    dateFundationController.text = "";
    symbolController.text = "";
    historyController.text = "";
    cepController.text = "";
    streetController.text = "";
    numberController.text = "";
    complementController.text = "";
    neighborhoodController.text = "";
    cityController.text = "";
    stateController.text = "";

    churchSel = null;
    churchController.text = "";
    districtSel = null;
    districtController.text = "";
    directorSel = null;
    directorController.text = "";
  }

  edit(Club club) async {
    clubSel = club;
    nameController.text = club?.name ?? "";
    dateFundationController.text = DateFormat(
      'dd/MM/yyyy',
    ).format(club.dateFundation);
    symbolController.text = club.symbol ?? "";
    historyController.text = club.history ?? "";
    cepController.text = club.cep ?? "";
    streetController.text = club.street ?? "";
    numberController.text = club.number ?? "";
    complementController.text = club.complement ?? "";
    neighborhoodController.text = club.neighborhood ?? "";
    cityController.text = club.city ?? "";
    stateController.text = club.state ?? "";

    churchController.text = "";
    churchSel = listChurches.firstWhere((c) => c.id == club.churchId);
    churchController.text = churchSel?.name ?? "";
    districtSel = listDistricts.firstWhere((d) => d.id == club.districtId);
    districtController.text = districtSel?.name ?? "";

    await Future.delayed(Duration(milliseconds: 100));
    currentScreenId.value = 1;
  }
}
