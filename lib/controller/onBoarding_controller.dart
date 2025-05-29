import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/localizatoin/changeLocal.dart';
import 'package:deliveryapp/core/services/services.dart';
import 'package:deliveryapp/data/data_source/static/onboarding_list.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingControllerAbstract extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingController extends OnBoardingControllerAbstract {
  MyServices servicesController = Get.find();
  LocaleController localController = Get.find();
  late PageController pageController;
  int currentPage = 0;
  RxInt pageColor = 0.obs;

  String buttonText = LangKeys.continueButton.tr;
  @override
  next() {
    currentPage++;
    pageColor.value++;
    if (currentPage == onBoardingList.length) {
      servicesController.sharedPref.setInt("step", 1);
      Get.offAllNamed("login");
    } else {
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  gotoPage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(microseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
    if (index == onBoardingList.length) {
      servicesController.sharedPref.setInt("step", 1);
    }
  }

  changeButtonText() {
    if (currentPage == onBoardingList.length - 1) {
      buttonText = LangKeys.enter.tr;
      update();
    } else if (currentPage < onBoardingList.length - 1) {
      if (buttonText.tr != LangKeys.continueButton.tr) {
        buttonText = LangKeys.continueButton.tr;
        update();
      }
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
