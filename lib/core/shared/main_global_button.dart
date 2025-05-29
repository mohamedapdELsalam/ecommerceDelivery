import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const GlobalButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = ColorScheme.of(context);
    return MaterialButton(
      onPressed: onPressed,
      color: myColors.primary,
      child: Text(title),
    );
  }
}
