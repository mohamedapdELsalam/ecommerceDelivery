import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/localizatoin/changeLocal.dart';
import 'package:deliveryapp/view/widgets/language/language_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSettings extends GetView<LocaleController> {
  const LanguageSettings({super.key});

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
                  controller.changeLocal("ar");
                  Get.offAllNamed(AppRoutes.homeScreen);
                },
                title: LangKeys.arabic.tr),
            LanguageButton(
                onPressed: () {
                  controller.changeLocal("en");
                  Get.offAllNamed(AppRoutes.homeScreen);
                },
                title: LangKeys.english.tr),
            LanguageButton(
                onPressed: () {
                  controller.changeLocal("de");
                  Get.offAllNamed(AppRoutes.homeScreen);
                },
                title: LangKeys.germany.tr),
            LanguageButton(
                onPressed: () {
                  controller.changeLocal("es");
                  Get.offAllNamed(AppRoutes.homeScreen);
                },
                title: LangKeys.spain.tr),
          ]),
    ));
  }
}
