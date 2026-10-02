import 'package:flutter/material.dart';

class ButtonNormalWidget extends StatelessWidget {
  const ButtonNormalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.amber),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(5)),
              side: BorderSide(color: Colors.black54, width: 2),
            ),
          ),
        ),
        icon: Icon(Icons.cloud_circle),
        onPressed: () => debugPrint("Clicou"),
        label: Row(children: [Text("Dados")]),
      ),
    );
  }
}
