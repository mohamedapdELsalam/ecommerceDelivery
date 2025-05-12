import 'package:flutter/material.dart';

class ProfileModel {
  final String title;
  final String subtitle;
  final Widget? trailing;
  final void Function() onTap;
  ProfileModel(
      {required this.title,
      required this.subtitle,
      this.trailing,
      required this.onTap});
}
