import 'package:deliveryapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  final double bottomMargin;
  final double hight;
  final double width;
  LogoApp(
      {super.key,
      required this.bottomMargin,
      required this.hight,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      child: Image.asset(
        ImageAssets.logo,
        height: hight,
        width: width,
      ),
    );
  }
}
