import 'package:deliveryapp/controller/onBoarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends GetView<OnBoardingController> {
  final void Function()? onPress;
  final String? title;
  const AuthButton({super.key, this.onPress, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 0, 12, 40),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: MaterialButton(
          textColor: Theme.of(context).colorScheme.surface,
          height: 38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: onPress,
          child: Text(
            "$title",
            style: context.textTheme.titleSmall,
          )),
    );
  }
}
