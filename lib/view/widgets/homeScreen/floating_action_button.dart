import 'package:deliveryapp/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
    required this.controller,
    required this.mycolors,
  });

  final HomeScreenController controller;
  final ColorScheme mycolors;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor:
          controller.currentIndex == 0 ? mycolors.primary : mycolors.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Icon(
        Icons.home,
        color: controller.currentIndex == 0
            ? mycolors.onPrimary
            : mycolors.onSecondary,
      ),
      onPressed: () {
        controller.changePage(0);
      },
    );
  }
}
