import 'package:flutter/material.dart';

class NavigationButtonModel {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  NavigationButtonModel(this.title, this.icon, this.onPressed);
}
