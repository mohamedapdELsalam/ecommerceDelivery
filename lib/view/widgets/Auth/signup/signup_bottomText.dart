import 'package:deliveryapp/controller/auth/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signupBottomText extends StatelessWidget {
  final String firsText;
  final String SecondText;
  const signupBottomText({
    required this.SecondText,
    required this.firsText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firsText),
        InkWell(
          onTap: () {
            controller.goToLogin();
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
