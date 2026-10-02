import 'dart:async';
import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/member/function_member_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/member_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CoordinatorViewModel extends GetxController {
  final _repository = Get.find<MemberRepository>();
  final _repositoryFunc = Get.find<FunctionMemberRepository>();

  Rx<Member?> coordinatorSel = Rx<Member?>(null);

  final RxBool isLoading = true.obs;
  final RxList<Member> listCoordinators = <Member>[].obs;
  final RxList<FunctionMember> listFunctionMembers = <FunctionMember>[].obs;

  Timer? _debounceSearch;

  List<Member> get listCoordinatorGeral =>
      listCoordinators.where((c) => c.functionMemberId == 1).toSet().toList();
  List<Member> get listRegionais =>
      listCoordinators.where((c) => c.functionMemberId == 2).toSet().toList();
  List<Member> get listDistritais =>
      listCoordinators.where((c) => c.functionMemberId == 3).toSet().toList();
  List<Member> get listPastor =>
      listCoordinators.where((c) => c.functionMemberId == 4).toSet().toList();

  final nameController = TextEditingController();
  final birthdateController = TextEditingController();
  final cpfController = TextEditingController();
  final rgController = TextEditingController();
  final sizeShirtController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cepController = TextEditingController();
  final streetController = TextEditingController();
  final numberController = TextEditingController();
  final complementController = TextEditingController();
  final neighborhoodController = TextEditingController();

  final searchController = TextEditingController();

  final coordinatorFormKey = GlobalKey<FormState>();

  Rx<FunctionMember?> funcMemberSel = Rx<FunctionMember?>(null);

  Map<String, dynamic> get jsonData => {
    "id": coordinatorSel.value?.id,
    "name": nameController.text,
    "birthdate": DateFormat("dd/MM/yyyy").parse(birthdateController.text),
    "cpf": cpfController.text,
    "rg": rgController.text,
    "sizeShirt": sizeShirtController.text,
    "email": emailController.text,
    "phone": phoneController.text,
    "cep": cepController.text,
    "street": streetController.text,
    "number": numberController.text,
    "complement": complementController.text,
    "neighborhood": neighborhoodController.text,
    "functionMemberId": funcMemberSel.value?.id,
  };

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  @override
  void onClose() {
    _debounceSearch?.cancel();
    super.onClose();
  }

  void _init() async {
    await getAllData();
    isLoading.value = false;
  }

  Future<void> getAllData() async {
    try {
      final list = await _repository.getAll();
      listCoordinators.assignAll(list);

      final listF = await _repositoryFunc.getAllFuncCoordinators();
      listFunctionMembers.assignAll(listF);
      debugPrint("Total Functions : ${listF.length}");
    } catch (e) {
      debugPrint("⚠ Erro ao executar carregamento inicial : $e");
    }
  }

  Future<Member?> getData(int id) async {
    return await _repository.get(id);
  }

  searchData(value) async {
    try {
      final list = await _repository.searchCoordinator(searchController.text);
      listCoordinators.assignAll(list);
    } catch (e) {
      debugPrint("Erro ao realizar pesquisa: $e");
    }
  }

  void edit(Member coordSel) {
    cleanFields();

    coordinatorSel.value = coordSel;
    funcMemberSel.value = listFunctionMembers.firstWhereOrNull(
      (f) => f.id == coordSel.functionMemberId,
    );

    nameController.text = coordSel.name;
    birthdateController.text = coordSel.birthdate != null
        ? DateFormat("dd/MM/yyyy").format(coordSel.birthdate!)
        : "";
    cpfController.text = coordSel.cpf ?? "";
    rgController.text = coordSel.rg ?? "";
    sizeShirtController.text = coordSel.shirtSize ?? "";
    emailController.text = coordSel.email ?? "";
    phoneController.text = coordSel.phone ?? "";
    cepController.text = coordSel.cep ?? "";
    streetController.text = coordSel.street ?? "";
    numberController.text = coordSel.number ?? "";
    complementController.text = coordSel.complement ?? "";
    neighborhoodController.text = coordSel.neighborhood ?? "";

    funcMemberSel.refresh();
  }

  cleanFields() async {
    coordinatorSel.value = null;
    funcMemberSel.value = null;

    nameController.clear();
    birthdateController.clear();
    cpfController.clear();
    rgController.clear();
    sizeShirtController.clear();
    emailController.clear();
    phoneController.clear();
    cepController.clear();
    streetController.clear();
    numberController.clear();
    complementController.clear();
    neighborhoodController.clear();
  }

  void saveData() async {
    try {
      final data = _repository.prepareData(jsonData);
      int id = await _repository.save(data);
      final index = listCoordinators.indexWhere((c) => c.id == id);

      if (index != -1) {
        Member? newCoord = await _repository.get(id);
        if (newCoord != null) {
          // coordinatorSel.value = newCoord;
          listCoordinators[index] = newCoord;
        }
      } else {
        Member? newCoord = await _repository.get(id);
        // coordinatorSel.value = newCoord;
        if (newCoord != null) listCoordinators.add(newCoord);
      }

      cleanFields();
    } catch (e) {
      debugPrint("Erro ao salvar registro: $e");
    }
  }

  void delete(int id) async {
    try {
      await _repository.delete(id);
      listCoordinators.removeWhere((c) => c.id == id);
    } catch (e) {
      debugPrint("Erro ao salvar registro: $e");
    }
  }
}
