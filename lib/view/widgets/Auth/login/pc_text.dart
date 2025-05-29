import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PcLoginText extends StatelessWidget {
  const PcLoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.3,
      color: const Color.fromARGB(134, 222, 220, 220),
      child: Column(
        children: [
          Text(
            "Imagine as you like",
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
