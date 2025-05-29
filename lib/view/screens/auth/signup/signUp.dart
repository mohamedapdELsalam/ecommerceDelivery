import 'package:deliveryapp/controller/auth/signup/signup_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/functions/alert_exit.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_socialIconsBar.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:deliveryapp/view/widgets/Auth/login/login_bottomText.dart';
import 'package:deliveryapp/view/widgets/Auth/signup/signup_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LangKeys.signup.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          alertExit(context);
        },
        child: GetBuilder<SignUpController>(
          builder:
              (controller) => HandlingStatusRequest(
                controller: controller,
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: ListView(
                    children: [
                      const SizedBox(width: double.infinity),
                      TitleAndSubtitleAuth(
                        title: LangKeys.signupTitle.tr,
                        subtitle: LangKeys.signupSub.tr,
                        bottomMargin: 25,
                      ),
                      SignUpFields(),
                      AuthButton(
                        onPress: () {
                          controller.signUp();
                        },
                        title: LangKeys.signup.tr,
                      ),
                      const AuthSocialIconsBar(),
                      AuthBottomText(
                        firsText: LangKeys.ifHaveAccount.tr,
                        secondText: LangKeys.login.tr,
                        onTap: () {
                          controller.goToLogin();
                        },
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
