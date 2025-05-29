import 'package:deliveryapp/controller/auth/signup/signup_verifycode_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:deliveryapp/view/widgets/Auth/signup/signup_otp.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckVerifyCodeSignup extends StatelessWidget {
  const CheckVerifyCodeSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SignupCheckVerifycodeController controller = Get.put(
      SignupCheckVerifycodeController(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Verification Code",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: double.infinity),
            LogoApp(bottomMargin: 0, hight: 100, width: 100),
            TitleAndSubtitleAuth(
              title: LangKeys.verificationCode.tr,
              subtitle: LangKeys.verificationSentence.tr,
              veriable: "moalgouker@gmail.com",
              bottomMargin: 50,
            ),
            SignupOtp(),
            Spacer(),
            GetBuilder<SignupCheckVerifycodeController>(
              builder:
                  (controller) => HandlingStatusRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(),
                    controller: controller,
                  ),
            ),
            AuthButton(
              onPress: () {
                controller.checkVerifyCode();
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
