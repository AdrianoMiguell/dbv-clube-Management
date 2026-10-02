import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Página Inicial")),
          SizedBox(height: 10),
          // Image(image: image_clube.png),
          Text("Nome do Clube | Distrito, Região e Associação"),
          SizedBox(height: 10),
          Text("Total de pontos"),
          SizedBox(height: 10),
          Text("Informações básicas : total de desbravadores, especialidades, classes, reuniões e história"),
        ],
      ),
    );
  }
}
