import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const LanguageButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        color: Theme.of(context).colorScheme.primary,
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
