import 'package:dbv_clube_management/data/database/database.dart';
import 'package:dbv_clube_management/data/repositories/auth/user_repository.dart';
import 'package:dbv_clube_management/data/repositories/club/club_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/function_member_repository.dart';
import 'package:dbv_clube_management/data/repositories/member/member_repository.dart';
import 'package:dbv_clube_management/data/services/member/member_service.dart';
import 'package:dbv_clube_management/ui/member/health_form_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberFormViewModel extends GetxController {
  final _memberService = Get.find<MemberService>();
  final vmHealth = Get.find<HealthFormViewModel>();

  final _userRepository = Get.find<UserRepository>();
  final MemberRepository _memberRepository = MemberRepository();
  final FunctionMemberRepository _functionMemberRepository =
      FunctionMemberRepository();
  final ClubRepository _clubRepository = ClubRepository();

  int? idSel;

  RxList<User> listUsers = <User>[].obs;
  RxList<Member> listMembers = <Member>[].obs;
  RxList<FunctionMember> listFunctionMembers = <FunctionMember>[].obs;
  RxList<Club> listClubs = <Club>[].obs;

  List<Map<String, dynamic>> listControllers = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController issuingAgencyController = TextEditingController();
  TextEditingController shirtSizeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController nameMotherController = TextEditingController();
  TextEditingController emailMotherController = TextEditingController();
  TextEditingController phoneMotherController = TextEditingController();
  TextEditingController nameFatherController = TextEditingController();
  TextEditingController emailFatherController = TextEditingController();
  TextEditingController phoneFatherController = TextEditingController();
  TextEditingController acceptClubTermController = TextEditingController();
  TextEditingController acceptImageTermController = TextEditingController();

  TextEditingController userIdController = TextEditingController();
  TextEditingController funcMemberIdController = TextEditingController();
  TextEditingController clubIdController = TextEditingController();

  DateTime? get birthdateSel => DateTime.tryParse(birthdateController.text);

  User? userSel;
  FunctionMember? functionMemberSel;
  Club? clubSel;

  GlobalKey formKey = GlobalKey<FormState>();
  Rx<int?> get healthFormIdSel => vmHealth.idSel.obs;

  RxInt currentScreen = 0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    await getAllUsers();
    await getAllFunctionMembers();
    await getAllClubs();

    isLoading.value = false;
    update();
  }

  getAllUsers() async {
    final list = await _userRepository.getAll();
    listUsers.assignAll(list);
  }

  getAllMembers() async {
    final list = await _memberRepository.getAll();
    listMembers.assignAll(list);
  }

  getAllFunctionMembers() async {
    final list = await _functionMemberRepository.getAll();
    final listCoordFuncIds = [1, 2, 3, 4];
    list.removeWhere((f) => listCoordFuncIds.contains(f.id));
    listFunctionMembers.assignAll(list);
  }

  getAllClubs() async {
    final list = await _clubRepository.getAll();
    listClubs.assignAll(list);
  }

  // buildListControllers() {
  //   final list = [
  //     {
  //       'controller': nameController,
  //       'type': TextInputType.text,
  //       'label': 'Nome',
  //     },
  //     {
  //       'controller': birthdateController,
  //       'type': TextInputType.datetime,
  //       'label': 'Data de Nascimento',
  //     },
  //     {'controller': cpfController, 'type': TextInputType.text, 'label': 'CPF'},
  //     {'controller': rgController, 'type': TextInputType.text, 'label': 'RG'},
  //     {
  //       'controller': issuingAgencyController,
  //       'type': TextInputType.text,
  //       'label': 'Orgão Emissor',
  //     },
  //     {
  //       'controller': shirtSizeController,
  //       'type': TextInputType.text,
  //       'label': 'Tamanho de Camisa',
  //     },
  //     {
  //       'controller': emailController,
  //       'type': TextInputType.text,
  //       'label': 'Email',
  //     },
  //     {
  //       'controller': phoneController,
  //       'type': TextInputType.text,
  //       'label': 'Contato',
  //     },
  //     {'controller': cepController, 'type': TextInputType.text, 'label': 'CEP'},
  //     {
  //       'controller': streetController,
  //       'type': TextInputType.text,
  //       'label': 'Rua',
  //     },
  //     {
  //       'controller': numberController,
  //       'type': TextInputType.text,
  //       'label': 'Número',
  //     },
  //     {
  //       'controller': complementController,
  //       'type': TextInputType.multiline,
  //       'label': 'Complemento',
  //     },
  //     {
  //       'controller': neighborhoodController,
  //       'type': TextInputType.text,
  //       'label': 'Bairro',
  //     },
  //     {
  //       'controller': cityController,
  //       'type': TextInputType.text,
  //       'label': 'Cidade',
  //     },
  //     {
  //       'controller': stateController,
  //       'type': TextInputType.text,
  //       'label': 'Estado',
  //     },
  //     {
  //       'controller': nameMotherController,
  //       'type': TextInputType.text,
  //       'label': 'Nome da mãe',
  //     },
  //     {
  //       'controller': emailMotherController,
  //       'type': TextInputType.text,
  //       'label': 'Email',
  //     },
  //     {
  //       'controller': phoneMotherController,
  //       'type': TextInputType.text,
  //       'label': 'Contato',
  //     },
  //     {
  //       'controller': nameFatherController,
  //       'type': TextInputType.text,
  //       'label': 'Nome do Pai',
  //     },
  //     {
  //       'controller': emailFatherController,
  //       'type': TextInputType.text,
  //       'label': 'Email',
  //     },
  //     {
  //       'controller': phoneFatherController,
  //       'type': TextInputType.text,
  //       'label': 'Contato',
  //     },
  //     {
  //       'controller': acceptClubTermController,
  //       'type': TextInputType.text,
  //       'label': 'Aceita os Termos do Clube?',
  //     },
  //     {
  //       'controller': acceptImageTermController,
  //       'type': TextInputType.text,
  //       'label': 'Aceita os termos de imagem?',
  //     },
  //     {
  //       'controller': healthFormIdController,
  //       'type': TextInputType.text,
  //       'label': 'Nome',
  //     },
  //     {
  //       'controller': userIdController,
  //       'type': TextInputType.text,
  //       'label': 'Nome',
  //     },
  //     {
  //       'controller': funcMemberIdController,
  //       'type': TextInputType.text,
  //       'label': 'Nome',
  //     },
  //     {
  //       'controller': clubIdController,
  //       'type': TextInputType.text,
  //       'label': 'Nome',
  //     },
  //   ];
  // }

  saveData() async {
    Map<String, dynamic> data = {
      'name': nameController.text,
      'birthdate': birthdateSel,
      'cpf': cpfController.text,
      'rg': rgController.text,
      'issuingAgency': issuingAgencyController.text,
      'shirtSize': shirtSizeController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'cep': cepController.text,
      'street': streetController.text,
      'number': numberController.text,
      'complement': complementController.text,
      'neighborhood': neighborhoodController.text,
      'city': cityController.text,
      'state': stateController.text,
      'nameMother': nameMotherController.text,
      'emailMother': emailMotherController.text,
      'phoneMother': phoneMotherController.text,
      'nameFather': nameFatherController.text,
      'emailFather': emailFatherController.text,
      'phoneFather': phoneFatherController.text,
      'acceptClubTerm': bool.tryParse(acceptClubTermController.text),
      'acceptImageTerm': bool.tryParse(acceptImageTermController.text),
      'healthFormId': healthFormIdSel.value,
      'userId': userSel?.id,
      'functionMemberId': functionMemberSel?.id,
      'clubId': clubSel?.id,
    };

    try {
      MembersCompanion memberData = _memberRepository.prepareData(data);
      int newId = await _memberRepository.save(memberData);

      Member? newMember = await _memberRepository.get(newId);
      if (newMember != null) {
        listMembers.add(newMember);
      }
    } catch (e) {
      debugPrint("Erro ao registrar dados de membro : $e");
    }
  }
}
