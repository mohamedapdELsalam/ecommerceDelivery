import 'package:flutter/material.dart';

class AuthSocialIconsBar extends StatelessWidget {
  const AuthSocialIconsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.facebook_outlined),
          SizedBox(width: 20),
          Icon(Icons.email_outlined),
          SizedBox(width: 20),
          Icon(Icons.telegram),
        ],
      ),
    );
  }
}
