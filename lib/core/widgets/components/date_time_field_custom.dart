import 'package:dbv_clube_management/core/widgets/themes/text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DateType { date, time, dateTime }

class DateTimeFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;
  final Color color;
  final DateType type;
  final Function(String v)? onChanged;

  const DateTimeFieldCustom({
    super.key,
    required this.controller,
    this.label,
    this.validator,
    this.color = const Color.fromARGB(255, 1, 3, 12),
    this.type = DateType.date,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.calendar_today;

    Future<void> handleTap() async {
      String formattedValue = "";

      if (type == DateType.date) {
        DateTime? date = await _selectDate(context);
        if (date != null) {
          formattedValue = DateFormat('dd/MM/yyyy').format(date);
        }
      } else if (type == DateType.time) {
        TimeOfDay? time = await _selectTime(context);
        if (time != null) {
          // Converter TimeOfDay para DateTime para usar o DateFormat
          final now = DateTime.now();
          final dt = DateTime(
            now.year,
            now.month,
            now.day,
            time.hour,
            time.minute,
          );
          formattedValue = DateFormat('HH:mm').format(dt);
        }
      } else if (type == DateType.dateTime) {
        // Primeiro seleciona a data
        DateTime? date = await _selectDate(context);
        if (date != null) {
          // Depois seleciona a hora
          TimeOfDay? time = await _selectTime(context);
          if (time != null) {
            final fullDateTime = DateTime(
              date.year,
              date.month,
              date.day,
              time.hour,
              time.minute,
            );
            formattedValue = DateFormat(
              'dd/MM/yyyy HH:mm',
            ).format(fullDateTime);
          }
        }
      }

      if (formattedValue.isNotEmpty) {
        controller.text = formattedValue;
        if (onChanged != null) onChanged!(formattedValue);
      }
    }

    // Definir ícone visual
    icon = switch (type) {
      DateType.time => Icons.access_time_filled_rounded,
      DateType.dateTime => Icons.calendar_month_sharp,
      _ => Icons.date_range,
    };

    return InkWell(
      onTap: handleTap, // Usa a lógica unificada
      child: IgnorePointer(
        child: TextFormField(
          controller: controller,
          validator: validator,
          readOnly: true,
          decoration: inputDecorationBase(
            color: color,
            label: label,
            prefixIcon: icon,
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1925),
      lastDate: DateTime(2100),
    );
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
