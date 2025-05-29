import 'package:flutter/material.dart';

class SecondGlobalButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const SecondGlobalButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = ColorScheme.of(context);
    return MaterialButton(
      onPressed: onPressed,
      color: myColors.secondary,
      child: Text(title),
    );
  }
}
