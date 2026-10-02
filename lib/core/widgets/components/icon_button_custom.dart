import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconButtonCustom extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final ButtonStyle? style;
  final Function() onPressed;

  const IconButtonCustom({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.style,
  });

  static Widget add({IconData? icon, required Function() onPressed}) {
    final buttonStyle = ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      backgroundColor: WidgetStatePropertyAll(Colors.blue.withAlpha(50)),
    );

    return IconButtonCustom(
      icon: icon ?? Icons.add,
      color: Colors.blue.shade800,
      style: buttonStyle,
      onPressed: onPressed,
    );
  }

  static Widget edit({IconData? icon, required Function() onPressed}) {
    final buttonStyle = ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      backgroundColor: WidgetStatePropertyAll(Colors.greenAccent.withAlpha(50)),
    );

    return IconButtonCustom(
      icon: icon ?? Icons.edit,
      color: Colors.green,
      style: buttonStyle,
      onPressed: onPressed,
    );
  }

  static Widget delete({IconData? icon, required Function() onPressed}) {
    final buttonStyle = ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      backgroundColor: WidgetStatePropertyAll(Colors.redAccent.withAlpha(50)),
    );

    return IconButtonCustom(
      icon: icon ?? Icons.delete,
      color: Colors.red,
      style: buttonStyle,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle =
        style ??
        ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          backgroundColor: color != null
              ? WidgetStatePropertyAll(color?.withAlpha(50))
              : null,
        );

    return IconButton(
      onPressed: onPressed,
      style: buttonStyle,
      icon: Icon(icon, color: color),
    );
  }
}
