import 'package:flutter/material.dart';

class Responsible extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? portrait;
  final Widget desktop;
  const Responsible(
      {super.key,
      required this.mobile,
      this.tablet,
      required this.desktop,
      this.portrait});

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 700;
  static bool isPortrait(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 700 &&
      MediaQuery.sizeOf(context).width < 904;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 904 &&
      MediaQuery.sizeOf(context).width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    if (size.width < 904) {
      return mobile;
    } else if (size.width >= 800 && size.width < 904) {
      return portrait ?? mobile;
    } else if (size.width >= 904 && size.width < 1200) {
      return tablet ?? desktop;
    } else {
      return desktop;
    }
  }
}
