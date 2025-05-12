
import 'package:deliveryapp/controller/auth/signup_controller.dart';
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
      autovalidateMode: AutovalidateMode.always,
      key: controller.formKey,
      child: Column(
        children: [
          TextFormAuth(
              valid: (val) {
                return validate(val!, 1, 50, "userName", controller);
              },
              Ctrl: controller.userNameCtrl,
              hint: "35".tr,
              label: "36".tr,
              icon: Icon(Icons.person)),
          SizedBox(height: 25),
          TextFormAuth(
              valid: (val) {
                return validate(val!, 5, 100, "email", controller);
              },
              Ctrl: controller.emailCtrl,
              hint: "27".tr,
              label: "23".tr,
              icon: Icon(Icons.email)),
          SizedBox(height: 25),
          TextFormAuth(
              valid: (val) {
                return validate(val!, 3, 17, "phone", controller);
              },
              Ctrl: controller.phoneController,
              hint: "30".tr,
              keyboardType: TextInputType.phone,
              label: "32".tr,
              icon: Icon(Icons.phone)),
          SizedBox(height: 25),
          GetBuilder<SignUpController>(
            builder: (myController) => TextFormAuth(
                valid: (val) {
                  return validate(val!, 6, 50, "password", myController);
                },
                Ctrl: controller.passwordCtrl,
                hint: "28".tr,
                label: "24".tr,
                obscure: myController.isDisapearPassword,
                onIconTap: () {
                  myController.switchShowPassword();
                },
                icon: myController.isDisapearPassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined)),
          ),
          SizedBox(height: 25),
          GetBuilder<SignUpController>(
            builder: (myController) => TextFormAuth(
                valid: (val) {
                  return validate(val!, 6, 50, "confirmPassword", myController);
                },
                Ctrl: controller.passConfirmCtrl,
                hint: "29".tr,
                label: "34".tr,
                obscure: myController.isDisapearPassword,
                onIconTap: () {
                  myController.switchShowPassword();
                },
                icon: myController.isDisapearPassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined)),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
