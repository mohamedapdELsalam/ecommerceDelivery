import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/login_controller.dart';

class AuthBottomText extends StatelessWidget {
  final String firsText;
  final String secondText;
  final void Function()? onTap;
  const AuthBottomText({
    required this.secondText,
    required this.firsText,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // LoginController controller =
     Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firsText),
        InkWell(
          onTap: onTap,
          child: Text(
            secondText,
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
