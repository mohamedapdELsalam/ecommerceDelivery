import 'package:deliveryapp/controller/auth/forget_password/change_password_controller.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/forget_password/resetPasswordFields.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/Auth/auth_title&subtitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // ResetPasswordController controller = Get.put(ResetPasswordController());
    ChangePasswordController controller = Get.put(ChangePasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LangKeys.verificationCode.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            SizedBox(width: double.infinity),
            LogoApp(bottomMargin: 10, hight: 100, width: 100),
            TitleAndSubtitleAuth(
              title: LangKeys.resetPassword.tr,
              subtitle: LangKeys.resetPasswordSentence.tr,
              bottomMargin: 50,
            ),
            ResetPasswordFields(),
            AuthButton(
              onPress: () {
                controller.changePassword();
              },
              title: LangKeys.save.tr,
            ),
          ],
        ),
      ),
    );
  }
}
