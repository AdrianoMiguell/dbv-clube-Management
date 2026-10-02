import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImagePickerFieldCustom extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  const ImagePickerFieldCustom({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.onChanged,
  });

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      controller.text = result.files.single.path!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: const Icon(Icons.image_search),
          tooltip: "Selecionar imagem",
          onPressed: _pickImage,
        ),
      ),
      onTap: _pickImage, // abre ao clicar no campo também
      onChanged: onChanged,
    );
  }
}
