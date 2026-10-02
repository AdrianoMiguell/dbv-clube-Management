import 'dart:ffi';

import 'package:dbv_clube_management/core/widgets/components/button_normal_widget.dart';
import 'package:dbv_clube_management/core/widgets/components/card_button_widget.dart';
import 'package:dbv_clube_management/routes/routes.dart';
import 'package:dbv_clube_management/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AdminInitialPage extends GetView<HomeViewModel> {
  const AdminInitialPage({super.key});
  HomeViewModel get vm => super.controller;

  static final List<Map<String, dynamic>> cardInfo = [
    {
      'title': "Organização Estrutural",
      'desc': 'Acessar organização estrutural do clube de desbravadores',
      'icon': SvgPicture.network(
        'https://www.svgrepo.com/show/490052/city.svg',
        width: 50,
      ),
      'on_tap': () {
        Get.toNamed(
          Routes.organizationArea,
          parameters: {'organization': 'division'},
        );
      },
    },
    {
      'title': "Igrejas Locais",
      'desc': 'Área de organização das igrejas locais',
      'icon': SvgPicture.network(
        "https://www.svgrepo.com/show/326167/church.svg",
        width: 50,
      ),
      'on_tap': () {
        Get.toNamed(Routes.churches);
      },
    },
    {
      'title': "Clubes Registrados",
      'desc': 'Acessar clubes de desbravadores registrados no sistema',
      'icon': SvgPicture.network(
        "https://www.svgrepo.com/show/527879/shield-minimalistic.svg",
        width: 50,
      ),
      'on_tap': () {
        Get.toNamed(
          Routes.clubs,
          // parameters: {'organization': 'division'},
        );
      },
    },
    {
      'title': "Membros Cadastrados",
      'desc': 'Acessar os membros cadastrados dos clubes',
      'icon': Icon(Icons.person, size: 42),
      'on_tap': () {
        Get.toNamed(
          Routes.members,
          // parameters: {'organization': 'division'},
        );
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Text("Seja bem vindo, ${vm.adminMapPages}}!"),

          // Expanded(
          //   child: LayoutBuilder(
          //     builder: (context, constraints) {
          //       int crossAxisQuant = constraints.maxWidth > 1000 ? 4 : 2;

          //       return GridView(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 32,
          //           vertical: 16,
          //         ),
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: crossAxisQuant, // Number of columns
          //           crossAxisSpacing: 10.0, // Spacing between columns
          //           mainAxisSpacing: 10.0, // Spacing between rows
          //           childAspectRatio:
          //               1.0, // Width to height ratio of each grid item
          //         ),
          //         children: [
          //           ...cardInfo.map((item) {
          //             return CardButtonWidget(
          //               background: const Color.fromARGB(255, 255, 251, 242),
          //               title: Text(item['title'] ?? ""),
          //               description: Text(item['desc'] ?? ""),
          //               icon: item['icon'],
          //               onTap: item['on_tap'],
          //             );
          //           }),
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
