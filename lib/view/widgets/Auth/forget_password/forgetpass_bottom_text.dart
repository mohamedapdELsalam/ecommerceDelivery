import 'package:flutter/material.dart';

class ForgetPassBottomText extends StatelessWidget {
  final String firsText;
  final String SecondText;
  const ForgetPassBottomText({
    required this.SecondText,
    required this.firsText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ForgetPasswordController controller = Get.put(ForgetPasswordController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firsText),
        InkWell(
          onTap: () {
            // controller.returnToLogin();
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
