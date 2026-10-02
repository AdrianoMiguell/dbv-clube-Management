import 'dart:async';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/organization/church_repository.dart';
import 'package:dbv_clube_management/data/repositories/organization/district_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class ChurchViewModel extends GetxController {
  final ChurchRepository _churchRepository = Get.find<ChurchRepository>();
  final DistrictRepository _districtRepository = Get.find<DistrictRepository>();

  Church? churchSel;
  District? districtSel;

  final RxBool isLoading = true.obs;
  final RxList<Church> listChurches = <Church>[].obs;
  final RxList<District> listDistricts = <District>[].obs;

  Timer? _debounceSearch;

  final nameController = TextEditingController();
  final districtController = TextEditingController();

  final formChurchKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  int get indexSel => listChurches.indexWhere((c) => c.id == churchSel?.id);

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }

  @override
  void onClose() {
    _debounceSearch?.cancel();
    super.onClose();
  }

  getAllData() async {
    try {
      getChurches();
      final listDist = await _districtRepository.getAll();
      listChurches.sort((a, b) => a.name.compareTo(b.name));
      listDistricts.assignAll(listDist);
    } catch (e) {
      debugPrint("⚠ Erro ao executar carregamento inicial : $e");
    } finally {
      isLoading.value = false;
    }
  }

  void getChurches() async {
    final list = await _churchRepository.getAll();
    listChurches.assignAll(list);
  }

  void searchData(String search) {
    if (_debounceSearch?.isActive ?? false) _debounceSearch!.cancel();

    _debounceSearch = Timer(const Duration(milliseconds: 400), () async {
      if (search.isEmpty) {
        getChurches();
        debugPrint("Query vazia, retornando todos os dados");
        return;
      }

      try {
        final list = await _churchRepository.search(search);
        debugPrint("Lista : ${list.toList().toString()}");
        listChurches.assignAll(list);
      } catch (e) {
        debugPrint("Erro ao fazer pesquisa : $e");
      }
    });
  }

  saveData() async {
    try {
      final json = {
        'id': churchSel?.id,
        'name': nameController.text.trim(),
        'districtId': districtSel?.id,
      };
      // debugPrint("${json.toString()} // ${indexSel.toString()}");
      // return;
      final church = _churchRepository.prepareData(json);
      int newId = await _churchRepository.save(church);
      final newChurch = await _churchRepository.get(newId);

      if (newChurch != null) {
        if (indexSel != -1) {
          listChurches[indexSel] = newChurch;
          return;
        }

        final list = List<Church>.from(listChurches)
          ..add(newChurch)
          ..toList();
        listChurches.assignAll(list);
        cleanFields();
      } else {
        debugPrint("Erro ao salvar registros : retorno foi nulo");
      }
    } catch (e) {
      debugPrint("Erro ao salvar registros: $e");
    }
  }

  cleanFields() async {
    nameController.clear();
    districtController.clear();
    churchSel = null;
    districtSel = null;
  }

  District? findDistrict(int? id) {
    if (id == null) return null;
    return listDistricts.firstWhereOrNull((d) => d.id == id);
  }

  void edit(Church? church) {
    if (church == null) return;
    churchSel = church;
    districtSel = findDistrict(church.districtId);
    nameController.text = churchSel?.name ?? "";
    districtController.text = districtSel?.name ?? "";
  }

  void delete(int id) async {
    bool checkIfUser = await _churchRepository.checkIfUsed(id);
    if (checkIfUser) {
      debugPrint("Em uso");
      return;
    }

    try {
      await _churchRepository.delete(id);
      listChurches.removeWhere((c) => c.id == id);
    } catch (e) {
      debugPrint("⚠ Erro : $e");
    }

    debugPrint("Não em uso");
  }
}
