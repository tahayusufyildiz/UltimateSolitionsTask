import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
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
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150))),
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
            Padding(
              padding: const EdgeInsets.only(top: 132),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xFF004F62),
                            fontSize: 29,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "Log back into your account",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xFF004F62),
                                fontSize: 12,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 16, left: 17, top: 44),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: userIdController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF1F5FB),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(
                                color: Color(0xFFF1F5FB),
                              )),
                          hintText: "User ID",
                          hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 16, left: 17, top: 8),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF1F5FB),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(
                                color: Color(0xFFF1F5FB),
                              )),
                          hintText: "Password",
                          hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 44, right: 17, left: 16),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Log in"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          //fixedSize: const Size(342, 44),
                          backgroundColor: Color(0xFF004F62),
                          minimumSize: const Size.fromHeight(44),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 27.65),
              child: Container(
                // color: Colors.blue,
                height: 197.65,
                width: 194.24,
                child: Image.asset("assets/delivery.png"),
              ),
            ),
          ],
        ));
  }
}
