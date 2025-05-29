import 'package:deliveryapp/controller/onBoarding_controller.dart';
import 'package:deliveryapp/data/data_source/static/onboarding_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingControllerSlider extends StatelessWidget {
  const OnboardingControllerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appHeight = Get.size.height;
    var appWidth = Get.size.width;
    Get.put(OnBoardingController());
    return GetBuilder<OnBoardingController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => Container(
                    margin: EdgeInsets.only(
                        right: appWidth * 0.01, bottom: appWidth * 0.004),
                    height: appHeight * 0.012,
                    child: AspectRatio(
                      aspectRatio: controller.currentPage == index ? 1.4 : 1,
                      child: InkWell(
                        onTap: () {
                          controller.gotoPage(index);
                        },
                        child: AnimatedContainer(
                          // width: controller.currentPage == index ? 20 : 10,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: controller.currentPage == index
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
