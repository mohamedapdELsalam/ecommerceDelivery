import 'package:deliveryapp/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppbarButton extends GetView<HomeScreenController> {
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  final bool isActive;
  const BottomAppbarButton({
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme mycolors = Theme.of(context).colorScheme;
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Icon(
              icon,
              color: !isActive ? mycolors.onSecondary : mycolors.primary,
            ),
            Text(
              title,
              style: TextStyle(
                color: !isActive ? mycolors.onSecondary : mycolors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
