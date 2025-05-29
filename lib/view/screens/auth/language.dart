import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/localizatoin/changeLocal.dart';
import 'package:deliveryapp/view/widgets/language/language_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LangKeys.chooseLanguage.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            SizedBox(height: 20),
            LanguageButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.onboarding);
                  controller.changeLocal("ar");
                },
                title: LangKeys.arabic.tr),
            LanguageButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.onboarding);
                  controller.changeLocal("en");
                },
                title: LangKeys.english.tr),
            LanguageButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.onboarding);
                  controller.changeLocal("de");
                },
                title: LangKeys.germany.tr),
            LanguageButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.onboarding);
                  controller.changeLocal("es");
                },
                title: LangKeys.spain.tr),
          ]),
    ));
  }
}
