// ignore: unused_import
import 'dart:async';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/association_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/district_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/division_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/region_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/union_repository.dart';
import 'package:dbv_clube_management/ui/organization/church_view_model.dart';
import 'package:dbv_clube_management/ui/organization/coordinator_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class OrganizationAreaViewModel<T> extends GetxController {
  final CoordinatorViewModel _coordinatorViewModel =
      Get.find<CoordinatorViewModel>();
  final ChurchViewModel _churchViewModel = Get.find<ChurchViewModel>();
  late dynamic areaRepository;
  late dynamic highAreaRepository;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController acronymController = TextEditingController();
  final TextEditingController coordinatorController = TextEditingController();
  final TextEditingController highAreaController = TextEditingController();
  final TextEditingController pastorController = TextEditingController();

  RxString identifyHighArea = "".obs;
  RxString identifyArea = "".obs;

  String get areaPluralParam =>
      viewData['fields'][identifyArea.value]['areaPlural'] ?? "";
  String get areaParam => viewData['fields'][identifyArea.value]['area'] ?? "";
  String get labelCoordinatorParam =>
      viewData['fields'][identifyArea.value]['labelCoordinator'] ?? "";
  String get labelAreaParam =>
      viewData['fields'][identifyArea.value]['labelArea'] ?? "";

  String get areaHighParam =>
      viewData['fields'][identifyHighArea.value]['area'] ?? "";

  dynamic areaSel;
  dynamic highAreaSel;
  Member? pastorSel;
  Member? coordinatorSel;

  final RxBool isLoading = false.obs;
  final RxBool isLoadingArea = true.obs;
  final RxList<dynamic> listAreas = <dynamic>[].obs;
  final RxList<dynamic> listHighAreas = <dynamic>[].obs;
  List<Member> get listCoordinators => _coordinatorViewModel.listCoordinators;
  List<Member> get listRegionais => _coordinatorViewModel.listRegionais;
  List<Member> get listDistritais => _coordinatorViewModel.listDistritais;
  List<Member> get listPastor => _coordinatorViewModel.listPastor;

  List<Church> get listChurches => _churchViewModel.listChurches;

  Timer? _debounceSearch;

  List<Member> get listDropdownCoordinators => (identifyArea.value == 'region')
      ? listRegionais
      : (identifyArea.value == 'district')
      ? listDistritais
      : listCoordinators;

  RxMap viewData = {
    'nameField': true,
    'asyncField': true,
    'fields': {
      'division': {
        'areaPlural': 'Divisões',
        'area': 'Divisão',
        'labelCoordinator': 'Coordenador da Divisão',
        'labelArea': '',
      },
      'union': {
        'areaPlural': 'Uniões',
        'area': 'União',
        'labelCoordinator': 'Coordenador da União',
        'labelArea': 'Divisão',
      },
      'association': {
        'areaPlural': 'Associações',
        'area': 'Associação',
        'labelCoordinator': 'Coordenador da Associação',
        'labelArea': 'União',
      },
      'region': {
        'areaPlural': 'Regiões',
        'area': 'Região',
        'labelCoordinator': 'Coordenador da Região',
        'labelArea': 'Associação',
      },
      'district': {
        'areaPlural': 'Distritos',
        'area': 'Distrito',
        'labelCoordinator': 'Coordenador do Distrito',
        'labelArea': 'Região',
      },
    },
  }.obs;

  final formAreaKey = GlobalKey<FormState>();

  @override
  void onInit() {
    getParameters();
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    _debounceSearch?.cancel();
    super.onClose();
  }

  changeOrganizationArea(String value) async {
    isLoading.value = true;
    searchController.clear();

    try {
      identifyArea.value = value;
      setRepository();
      await getAreas();
    } catch (e) {
      debugPrint("Erro ao muda organization area : $e");
    } finally {
      isLoading.value = false;
    }
  }

  void getParameters() {
    Map<String, String?> parameters = Get.parameters;
    if (parameters.isEmpty) {
      debugPrint("Parametros não recebidos");
      return;
    }

    if (parameters.keys.contains("organization")) {
      identifyArea.value = parameters["organization"] ?? "";
    }
  }

  Future<void> loadData() async {
    try {
      setRepository();
      getAreas();
      debugPrint("Tamanho da lista : ${listAreas.length}");
    } catch (e) {
      debugPrint("⚠ Erro ao executar carregamento inicial : $e");
    } finally {
      isLoadingArea.value = false;
    }
  }

  setRepository() {
    switch (identifyArea.value) {
      case "division":
        areaRepository = Get.find<DivisionRepository>();
        break;
      case "union":
        areaRepository = Get.find<UnionRepository>();
        identifyHighArea.value = "division";
        highAreaRepository = Get.find<DivisionRepository>();
        break;
      case "association":
        areaRepository = Get.find<AssociationRepository>();
        identifyHighArea.value = "union";
        highAreaRepository = Get.find<UnionRepository>();
        break;
      case "region":
        areaRepository = Get.find<RegionRepository>();
        identifyHighArea.value = "association";
        highAreaRepository = Get.find<AssociationRepository>();
        break;
      case "district":
        areaRepository = Get.find<DistrictRepository>();
        identifyHighArea.value = "region";
        highAreaRepository = Get.find<RegionRepository>();
        break;
    }
  }

  Future<void> getAreas() async {
    final list = await areaRepository.getAll();
    listAreas.assignAll(list);

    if (identifyArea.value != 'division') {
      final secList = await highAreaRepository.getAll();
      listHighAreas.assignAll(secList);
    }
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  void cleanFields() {
    areaSel = null;
    highAreaSel = null;
    coordinatorSel = null;
    pastorSel = null;

    nameController.text = "";
    acronymController.text = "";
    coordinatorController.text = "";
    highAreaController.text = "";
    pastorController.text = "";
  }

  void searchData(String query) {
    if (_debounceSearch?.isActive ?? false) _debounceSearch!.cancel();

    _debounceSearch = Timer(const Duration(milliseconds: 400), () async {
      if (query.isEmpty) {
        getAreas();
        debugPrint("Query vazia, retornando todos os dados");
        return;
      }

      try {
        final list = await areaRepository.search(query);
        listAreas.assignAll(list);
      } catch (e) {
        debugPrint("Erro ao fazer pesquisa : $e");
      }
    });
  }

  Future<void> editField(dynamic item) async {
    areaSel = item;
    nameController.text = areaSel?.name ?? "";
    acronymController.text = areaSel?.acronym ?? "";

    debugPrint("Elemento selecionado : ${item.id}");

    try {
      highAreaSel = highAreaSel = identifyArea.value != 'division'
          ? await areaRepository.getHighArea(areaSel)
          : null;

      coordinatorSel = await _coordinatorViewModel.getData(areaSel?.id);

      pastorSel = identifyArea.value == 'district'
          ? await areaRepository.getPastor(areaSel?.pastorId)
          : null;

      debugPrint(
        "Verificação de dados : highAreaSel ${highAreaSel == null} // coordinatorSel ${coordinatorSel == null} // pastorSel ${pastorSel == null}",
      );

      if (highAreaSel != null) {
        highAreaController.text = highAreaSel?.name ?? "";
      }
      if (coordinatorSel != null) {
        coordinatorController.text = coordinatorSel?.name ?? "";
      }
      if (pastorSel != null) {
        pastorController.text = pastorSel?.name ?? "";
      }
    } catch (e) {
      debugPrint("Erro ao carregar edição de campo : $e");
    }
  }

  Future<void> saveData({int? id}) async {
    final json = {
      'name': nameController.text,
      'acronym': acronymController.text,
      'coordinatorId': coordinatorSel?.id,
    };

    try {
      if (id != null) json['id'] = id;
      if (identifyArea.value != 'division') {
        json['${identifyHighArea.value}Id'] = highAreaSel?.id;
      }
      if (identifyArea.value == 'district') {
        json['pastorId'] = pastorSel?.id;
      }
      debugPrint(json.toString());
      final data = areaRepository.prepareData(json);
      final newId = await areaRepository.save(data);
      final newArea = await areaRepository.get(newId);
      if (id == null) {
        listAreas.add(newArea);
      } else {
        final index = listAreas.indexWhere((a) => a.id == id);
        if (index != -1) listAreas[index] = newArea;
      }
      debugPrint("Operação finalizada com sucesso!");
    } catch (e) {
      debugPrint("Operação falhou no processo : $e");
    }
  }

  void deleteData(int? id) async {
    if (id == null) {
      debugPrint("⚠ ID nulo, executar no delete");
      return;
    }

    try {
      await areaRepository.delete(id);
      listAreas.removeWhere((item) => item.id == id);
      debugPrint("🚩 Deletado elemento de ID $id");
    } catch (e) {
      debugPrint("⚠ Erro ao executar função de delete");
    }
  }
}
