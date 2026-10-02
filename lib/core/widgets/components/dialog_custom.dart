import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogCustom extends StatelessWidget {
  final Widget child;
  final Color? backColor;
  final ShapeBorder? shape;
  final BoxConstraints? constraint;

  const DialogCustom({
    super.key,
    this.backColor,
    this.shape,
    this.constraint,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      shape:
          shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(width: 0, color: Colors.black12),
          ),
      backgroundColor: backColor ?? const Color.fromARGB(255, 255, 252, 249),
      child: Container(
        constraints:
            constraint ??
            BoxConstraints(
              maxWidth: screenWidth * 0.6 > 200 ? 400 : screenWidth,
              minWidth: screenWidth * 0.6 < 200 ? screenWidth : 200,
              minHeight: 100,
            ),
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            child,
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
