import 'package:flutter/material.dart';

class TitleAndSubtitleAuth extends StatelessWidget {
  final String title;
  final String subtitle;
  final double bottomMargin;
  final String? veriable;
  const TitleAndSubtitleAuth(
      {super.key,
      required this.subtitle,
      required this.title,
      required this.bottomMargin,
      this.veriable});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
              veriable ?? "",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        SizedBox(height: bottomMargin),
      ],
    );
  }
}
