import 'package:flutter/material.dart';

class GlobalTextForm extends StatelessWidget {
  final String hint;
  final String prefix;
  final bool? isNumber;
  final bool? multiLines;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  const GlobalTextForm({
    super.key,
    this.isNumber,
    required this.hint,
    required this.prefix,
    required this.controller,
    required this.validator,
    this.multiLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          isNumber ?? false
              ? TextInputType.number
              : multiLines ?? false
              ? TextInputType.multiline
              : TextInputType.text,
      minLines: 1,
      maxLines: 3,
      validator: validator,
      controller: controller,
      style: TextTheme.of(context).bodyMedium,
      decoration: InputDecoration(
        label: Text(
          ' $prefix ',
          style: TextStyle(
            color: ColorScheme.of(context).onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(
          color: ColorScheme.of(context).onSecondary.withAlpha(140),
          fontSize: 13,
        ),
        fillColor: ColorScheme.of(context).onPrimary.withAlpha(160),
        filled: true,

        border: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            width: 1,
            color: const Color.fromARGB(87, 63, 62, 62),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            width: 1,
            color: const Color.fromARGB(87, 63, 62, 62),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        hintText: hint,
      ),
    );
  }
}
