import 'package:deliveryapp/controller/auth/forget_password/change_password_controller.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/functions/validate_inputs.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_textForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordFields extends GetView<ChangePasswordController> {
  const ResetPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: controller.formKey,
      child: Column(
        children: [
          GetBuilder<ChangePasswordController>(
            builder: (myController) => TextFormAuth(
                valid: (val) {
                  return validate(val!, 6, 50, "password", myController);
                },
                Ctrl: controller.passwordCtrl,
                hint: LangKeys.passwordFieldHint.tr,
                label: LangKeys.newPassword.tr,
                obscure: myController.isDisapearPassword,
                onIconTap: () {
                  myController.switchShowPassword();
                },
                icon: myController.isDisapearPassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined)),
          ),
          SizedBox(height: 30),
          GetBuilder<ChangePasswordController>(
            builder: (myController) => TextFormAuth(
                valid: (val) {
                  return validate(val!, 6, 50, "confirmPassword", myController);
                },
                Ctrl: controller.confirmPasswordCtrl,
                hint: LangKeys.confirmHint.tr,
                label: LangKeys.confirmPassword.tr,
                obscure: myController.isDisapearPassword,
                onIconTap: () {
                  myController.switchShowPassword();
                },
                icon: myController.isDisapearPassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined)),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
