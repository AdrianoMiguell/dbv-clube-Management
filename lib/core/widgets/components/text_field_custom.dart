import 'package:dbv_clube_management/core/widgets/themes/text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatelessWidget {
  final String? label;
  final String hint;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Color color;
  final bool enabled;
  final bool isObscured;
  final int? maxLines;

  final List<TextInputFormatter>? textFormatters;
  final TextEditingController controller;
  final Function(String v)? onChanged;
  final TextInputType type;

  const TextFieldCustom({
    super.key,
    required this.controller,
    this.label,
    this.hint = "",
    this.enabled = true,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.isObscured = false,
    this.textFormatters,
    this.color = const Color.fromARGB(255, 1, 3, 12),
    this.type = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formatters = [];

    if (type == TextInputType.number ||
        type == TextInputType.numberWithOptions()) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    final labelWidget = label == null
        ? SizedBox.shrink()
        : Text(
            label ?? "",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade900,
            ),
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelWidget,
        label == null ? SizedBox.shrink() : SizedBox(height: 4),
        TextFormField(
          controller: controller,
          cursorColor: color,
          minLines: type == TextInputType.multiline ? 2 : 1,
          maxLines: maxLines ?? (type == TextInputType.multiline ? 2 : 1),
          obscureText: isObscured,
          enabled: enabled,
          keyboardType: type,
          inputFormatters: textFormatters ?? formatters,
          onChanged: onChanged,
          validator: validator,
          decoration: inputDecorationBase(
            color: color,
            hint: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
