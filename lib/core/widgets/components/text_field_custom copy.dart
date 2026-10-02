import 'package:dbv_clube_management/core/widgets/themes/text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustoam<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Color color;
  final bool enabled;
  final TextInputType type;
  final FocusNode? focusNode;
  final int? maxLines;
  final List<TextInputFormatter>? textFormatters;
  final TextEditingController controller;
  final Function(String v)? onChanged;
  final VoidCallback? onTap;

  const TextFieldCustoam({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.color = const Color.fromARGB(255, 1, 3, 12),
    this.type = TextInputType.text,
    this.focusNode,
    this.textFormatters,
    this.maxLines,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formatters = [];

    if (type == TextInputType.number ||
        type == TextInputType.numberWithOptions()) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return TextField(
      controller: controller,
      cursorColor: color,
      keyboardType: type,
      maxLines: maxLines ?? (type == TextInputType.multiline ? 2 : 1),
      inputFormatters: textFormatters ?? formatters,
      onChanged: onChanged,
      onTap: onTap,
      decoration: inputDecorationBase(
        color: color,
        label: label,
        hint: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
