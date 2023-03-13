import 'package:flutter/material.dart';

class LoginImageBox extends StatelessWidget {
  const LoginImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 27.65),
      child: Container(
        // color: Colors.blue,
        height: 197.65,
        width: 194.24,
        child: Image.asset("assets/delivery.png"),
      ),
    );
  }
}
