import 'package:flutter/material.dart';

class DropdownMenuCustom<T> extends StatelessWidget {
  final List<T> list;
  final String label;
  final TextEditingController controller;
  final T? initialSelection;
  final Widget? icon;
  final String? Function(T?)? validator;
  final String Function(T) labelBuilder;
  final Function(T?)? onSelected;

  const DropdownMenuCustom({
    super.key,
    required this.list,
    required this.label,
    required this.controller,
    this.initialSelection,
    this.icon,
    this.validator,
    required this.labelBuilder,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenuFormField<T?>(
      expandedInsets: EdgeInsets.zero,
      enableSearch: true,
      enableFilter: true,
      menuHeight: 300,
      controller: controller,
      validator: validator,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
        ),
      ),
      label: Text(label),
      onSelected: onSelected,
      dropdownMenuEntries: list
          .map(
            (item) => DropdownMenuEntry<T?>(
              value: item,
              label: labelBuilder(item),
              leadingIcon: icon,
            ),
          )
          .toList(),
    );
  }
}
