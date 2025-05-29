import 'package:flutter/material.dart';

class TextFormAuth extends StatelessWidget {
  final TextEditingController Ctrl;
  final String? hint;
  final String? label;
  final Widget icon;
  final TextInputType? keyboardType;
  final bool? obscure;
  final void Function()? onIconTap;
  final String? Function(String?)? valid;
  const TextFormAuth(
      {super.key,
      this.onIconTap,
      required this.Ctrl,
      this.hint,
      this.label,
      required this.icon,
      this.obscure,
      this.keyboardType,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        validator: valid,
        obscureText: obscure ?? false,
        controller: Ctrl,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: "  $label   ",
            labelStyle: Theme.of(context).textTheme.titleMedium,
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            suffixIcon: IconButton(icon: icon, onPressed: onIconTap ?? () {})));
  }
}
