import 'package:deliveryapp/controller/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginBottomText extends StatelessWidget {
  final String firsText;
  final String SecondText;
  const LoginBottomText({
    required this.SecondText,
    required this.firsText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firsText),
        InkWell(
          onTap: () {
            controller.goToSignup();
          },
          child: Text(
            SecondText,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        SizedBox(height: 70),
      ],
    );
  }
}
