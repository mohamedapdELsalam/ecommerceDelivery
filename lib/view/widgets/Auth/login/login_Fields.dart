import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/functions/validate_inputs.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_textForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/login_controller.dart';

class LoginFields extends GetView<LoginController> {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.always,
      key: controller.formKey,
      child: Column(
        children: [
          TextFormAuth(
              valid: (val) {
                return validate(val!, 5, 100, "email", controller);
              },
              Ctrl: controller.emailCtrl,
              hint: LangKeys.emailFieldHint.tr,
              label: LangKeys.email.tr,
              icon: Icon(Icons.email)),
          SizedBox(height: 30),
          GetBuilder<LoginController>(
            builder: (myController) => TextFormAuth(
                valid: (val) {
                  return validate(val!, 6, 30, "password", myController);
                },
                Ctrl: myController.passwordCtrl,
                hint: LangKeys.passwordFieldHint.tr,
                label: LangKeys.password.tr,
                obscure: myController.isDisapearPassword,
                onIconTap: () {
                  myController.switchShowPassword();
                },
                icon: myController.isDisapearPassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined)),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
