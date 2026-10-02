import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final void Function(int)? onTap;

  const BottomNavigationBarWidget({super.key, this.onTap});

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indiceAtual,
      onTap: (value) {
        setState(() {
          indiceAtual = value;
        });
        widget.onTap!(value);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts_outlined),
          label: "Serviços",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Configurações"),
      ],
    );
  }
}
