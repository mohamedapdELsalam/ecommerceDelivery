import 'package:deliveryapp/controller/onBoarding_controller.dart';
import 'package:deliveryapp/data/data_source/static/onboarding_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingSlider extends GetView<OnBoardingController> {
  const OnboardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var appHeight = Get.size.height;
    // var appWidth = Get.size.width;
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
        controller.changeButtonText();
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: FittedBox(child: Text(onBoardingList[i].title!.tr)),
            ),
            SizedBox(height: 10),
            Flexible(
              flex: 10,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    height: appHeight * 0.3,
                    width: appHeight * 0.3,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(72, 255, 255, 255),
                      borderRadius: BorderRadius.circular(
                        200,
                      ), // نصف القطر مش ضروري كبير جدًا
                    ),
                    child: Lottie.asset(onBoardingList[i].image!),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              flex: 2,
              child: FittedBox(child: Text(onBoardingList[i].body!.tr)),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
