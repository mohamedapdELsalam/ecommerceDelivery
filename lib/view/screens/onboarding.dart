import 'package:deliveryapp/controller/onBoarding_controller.dart';
import 'package:deliveryapp/data/data_source/static/static.dart';
import 'package:deliveryapp/view/widgets/onBoarding/onboarding_button.dart';
import 'package:deliveryapp/view/widgets/onBoarding/onboarding_ctrl_slider.dart';
import 'package:deliveryapp/view/widgets/onBoarding/onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());

    return GetBuilder<OnBoardingController>(
      builder:
          (_) => Scaffold(
            backgroundColor:
                onBoardingList[controller.currentPage].backGroundColor,
            body: SafeArea(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(flex: 6, child: OnboardingSlider()),
                    const Flexible(
                      flex: 2,
                      child: OnboardingControllerSlider(),
                    ),
                    Flexible(
                      flex: 2,
                      child: OnBoardingButton(
                        onPress: () {
                          controller.next();
                          controller.changeButtonText();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
