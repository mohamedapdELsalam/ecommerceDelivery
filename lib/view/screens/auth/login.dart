import 'package:deliveryapp/controller/auth/login_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/functions/alert_exit.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_socialIconsBar.dart';
import 'package:deliveryapp/view/widgets/Auth/login/login_Fields.dart';
import 'package:deliveryapp/view/widgets/Auth/login/login_bottomText.dart';
import 'package:deliveryapp/view/widgets/Auth/login/login_optionsBar.dart';
import 'package:deliveryapp/view/widgets/Auth/login/pc_text.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/Auth/auth_title&subtitle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LangKeys.login.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          alertExit(context);
        },
        child: GetBuilder<LoginController>(
          builder:
              (controller) => HandlingStatusRequest(
                controller: controller,
                statusRequest: controller.statusRequest,
                widget: Row(
                  children: [
                    if (context.width >= 1200) PcLoginText(),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.08,
                          vertical: context.height * 0.01,
                        ),
                        children: [
                          SizedBox(width: double.infinity),
                          LogoApp(bottomMargin: 10, hight: 100, width: 100),
                          TitleAndSubtitleAuth(
                            title: LangKeys.loginTitle.tr,
                            subtitle: LangKeys.loginSub.tr,
                            bottomMargin: 35,
                          ),
                          LoginFields(),
                          LoginOptionsBar(),
                          AuthButton(
                            onPress: () async {
                              controller.login(context);
                            },
                            title: LangKeys.login.tr,
                          ),
                          AuthSocialIconsBar(),
                          AuthBottomText(
                            firsText: LangKeys.dontHaveAccount.tr,
                            secondText: LangKeys.signup.tr,
                            onTap: () {
                              controller.goToSignup();
                            },
                          ),
                        ],
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
