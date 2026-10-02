import 'package:flutter/material.dart';

class EmptyResultWidget extends StatelessWidget {
  final bool isLarge;
  final String? label;

  const EmptyResultWidget({super.key, this.isLarge = true, this.label});

  @override
  Widget build(BuildContext context) {
    double fontSize = isLarge ? 16 : 14;
    double iconSize = isLarge ? 96 : 42;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search_off_rounded,
          size: iconSize,
          color: Colors.blueGrey.shade800,
        ),
        Text(
          label ?? "Nenhum resultado encontrado",
          style: TextStyle(color: Colors.blueGrey.shade800, fontSize: fontSize),
        ),
      ],
    );
  }
}
