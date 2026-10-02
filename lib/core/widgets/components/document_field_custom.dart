import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'text_field_custom.dart'; // seu widget base

enum DocumentType { cpf, rg }

class DocumentFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  final DocumentType type;
  final bool docRequired;

  const DocumentFieldCustom({
    super.key,
    required this.controller,
    required this.type,
    this.docRequired = false,
  });

  @override
  State<DocumentFieldCustom> createState() => _DocumentFieldCustomState();
}

class _DocumentFieldCustomState extends State<DocumentFieldCustom> {
  late final MaskTextInputFormatter _mask;

  @override
  void initState() {
    super.initState();
    _mask = MaskTextInputFormatter(
      mask: widget.type == DocumentType.cpf
          ? '###.###.###-##' // CPF
          : '##.###.###-#', // RG
      filter: {'#': RegExp(r'[0-9]')},
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldCustom(
      controller: widget.controller,
      label: widget.type == DocumentType.cpf ? 'CPF' : 'RG',
      textFormatters: [_mask],
      type: TextInputType.number,
      validator: _defaultValidator,
    );
  }

  String? _defaultValidator(String? value) {
    if (widget.docRequired) {
      if (value == null || value.isEmpty) {
        return "Este campo é obrigatório";
      }
    }

    final digits = value!.replaceAll(RegExp(r'\D'), '');
    final expected = widget.type == DocumentType.cpf ? 11 : 9;

    if (digits.length < expected) {
      return widget.type == DocumentType.cpf ? "CPF inválido" : "RG inválido";
    }
    return null;
  }
}
