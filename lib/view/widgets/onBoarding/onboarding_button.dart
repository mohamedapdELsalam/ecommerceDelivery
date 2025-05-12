import 'package:deliveryapp/controller/onBoarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingButton extends GetView<OnBoardingController> {
  final void Function()? onPress;
  final String? title;
  const OnBoardingButton({this.onPress, this.title});

  @override
  Widget build(BuildContext context) {
    var appHeight = Get.size.height;
    var appWidth = Get.size.width;
    return FittedBox(
      child: Container(
        height: appHeight * 0.05,
        width: appWidth * 0.2,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: onPress,
            color: Theme.of(context).colorScheme.onPrimary,
            child: GetBuilder<OnBoardingController>(
              builder: (controller) =>
                  FittedBox(child: Text(controller.ButtonText)),
            )),
      ),
    );
  }
}
