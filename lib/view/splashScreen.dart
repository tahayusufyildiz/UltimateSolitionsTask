import 'dart:async';
import 'package:path/path.dart' as Path;

import 'package:flutter/material.dart';
import 'package:ultimate_solitions_task/view/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9FAFF),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Center(
              child: Image.asset("assets/OnxRestaurant_Logo.png"),
            ),
            Image.asset("assets/Object.png")
          ],
        ),
      ),
    );
  }
}
