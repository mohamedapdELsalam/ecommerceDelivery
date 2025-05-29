import 'package:deliveryapp/controller/auth/signup/signup_controller.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/functions/validate_inputs.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_textForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());

    return Form(
      // autovalidateMode: AutovalidateMode.always,
      key: controller.formKey,
      child: Column(
        children: [
          TextFormAuth(
              valid: (val) {
                return validate(val!, 1, 50, "userName", controller);
              },
              Ctrl: controller.userNameCtrl,
              hint: LangKeys.userNameFieldHint.tr,
              label: LangKeys.userName.tr,
              icon: Icon(Icons.person)),
          SizedBox(height: 25),
          TextFormAuth(
              valid: (val) {
                return validate(val!, 5, 100, "email", controller);
              },
              Ctrl: controller.emailCtrl,
              hint: LangKeys.emailFieldHint.tr,
              label: LangKeys.email.tr,
              icon: Icon(Icons.email)),
          SizedBox(height: 25),
          TextFormAuth(
              valid: (val) {
                return validate(val!, 3, 17, "phone", controller);
              },
              Ctrl: controller.phoneController,
              hint: LangKeys.phoneFieldHint.tr,
              keyboardType: TextInputType.phone,
              label: LangKeys.phone.tr,
              icon: Icon(Icons.phone)),
          SizedBox(height: 25),
          GetBuilder<SignUpController>(
            builder: (myController) => TextFormAuth(
                valid: (val) {
                  return validate(val!, 6, 50, "password", myController);
                },
                Ctrl: controller.passwordCtrl,
                hint: LangKeys.passwordFieldHint.tr,
                label: LangKeys.password.tr,
                obscure: myController.isDisappearPassword,
                onIconTap: () {
                  myController.switchShowPassword();
                },
                icon: myController.isDisappearPassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined)),
          ),
          SizedBox(height: 25),
          GetBuilder<SignUpController>(
            builder: (myController) => TextFormAuth(
                valid: (val) {
                  return validate(val!, 6, 50, "confirmPassword", myController);
                },
                Ctrl: controller.confirmPasswordCtrl,
                hint: LangKeys.confirmHint.tr,
                label: LangKeys.confirmPassword.tr,
                obscure: myController.isDisappearPassword,
                onIconTap: () {
                  myController.switchShowPassword();
                },
                icon: myController.isDisappearPassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined)),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
