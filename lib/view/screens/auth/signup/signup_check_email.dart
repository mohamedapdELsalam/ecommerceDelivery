import 'package:deliveryapp/controller/auth/signup/check_email_signup_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/functions/validate_inputs.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_textForm.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/Auth/auth_title&subtitle.dart';

class SignupCheckEmail extends StatelessWidget {
  const SignupCheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailSignupController controller = Get.put(
      CheckEmailSignupController(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LangKeys.forgetPassword.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: controller.formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              SizedBox(width: double.infinity),
              LogoApp(bottomMargin: 10, hight: 100, width: 100),
              TitleAndSubtitleAuth(
                title: LangKeys.checkYourEmail.tr,
                subtitle: "",
                bottomMargin: 50,
              ),
              TextFormAuth(
                valid: (val) {
                  return validate(val!, 5, 100, "email", controller);
                },
                Ctrl: controller.emailCtrl,
                hint: LangKeys.emailFieldHint.tr,
                label: LangKeys.email.tr,
                obscure: false,
                icon: Icon(Icons.email),
              ),
              SizedBox(height: 40),
              GetBuilder<CheckEmailSignupController>(
                builder:
                    (controller) => HandlingStatusRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(),
                      controller: controller,
                    ),
              ),
              AuthButton(
                onPress: () {
                  controller.checkEmail();
                },
                title: LangKeys.check.tr,
              ),

              // ForgetPassBottomText(
              //   firsText: LangKeys.returnTo.tr,
              //   SecondText: LangKeys.login.tr,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
