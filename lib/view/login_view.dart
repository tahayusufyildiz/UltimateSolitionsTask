import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 127,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.62,
                  top: 56.33,
                ),
                child: Image.asset(
                  "assets/OnxRestaurant_Logo.png",
                  width: 171.38,
                  height: 73.38,
                ),
              ),
              Container(
                width: 121,
                height: 127,
                decoration: BoxDecoration(
                    color: Color(0xFFD42A0F),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(180))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/ic_language.png",
                          width: 27.5,
                          height: 27.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Color(0xFF004F62),
                  fontSize: 29,
                ),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.blue,
          height: 197.65,
          width: 194.24,
          child: Image.asset("assets/delivery.png"),
        ),
      ],
    ));
  }
}
