import 'package:flutter/material.dart';

class SettingOptionModel {
  final String title;
  final String subtitle;
  final Widget? trailing;
  final void Function() onTap;
  SettingOptionModel(
      {required this.title,
      required this.subtitle,
      this.trailing,
      required this.onTap});
}
