import 'package:deliveryapp/controller/auth/login_controller.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOptionsBar extends StatelessWidget {
  const LoginOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
      child: Row(
        children: [
          // GetBuilder<LoginController>(
          //     builder: (controller) => controller.isRememberMeChecked
          //         ? IconButton(
          //             onPressed: () {
          //               controller.toggleRememberMe();
          //             },
          //             icon: Icon(Icons.check_box))
          //         : IconButton(
          //             onPressed: () {
          //               controller.toggleRememberMe();
          //             },
          //             icon: Icon(Icons.check_box_outline_blank))),
          SizedBox(width: 5),
          // FittedBox(child: Text(LangKeys.rememberMe.tr)),
          // Spacer(),
          TextButton(
            child: Text(
              LangKeys.forgetPassword.tr,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: context.onSecondary),
            ),
            onPressed: () {
              controller.goToForgetPassword();
            },
          ),
        ],
      ),
    );
  }
}
