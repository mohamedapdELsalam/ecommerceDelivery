import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/Auth/auth_title&subtitle.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LangKeys.passChangedSuccess.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: double.infinity),
            LogoApp(bottomMargin: 10, hight: 100, width: 100),
            TitleAndSubtitleAuth(
              title: LangKeys.passChangedSuccessTitle.tr,
              subtitle: LangKeys.passChangedSuccessSub.tr,
              bottomMargin: 50,
            ),
            Spacer(),
            AuthButton(
              onPress: () {
                Get.offAllNamed(AppRoutes.login);
              },
              title: LangKeys.goLogin.tr,
            ),
          ],
        ),
      ),
    );
  }
}
