import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_solitions_task/view/home_view.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? ResNameSurname;
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
                        obscureText: true,
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
                        onPressed: () {
                          login();
                        },
                        child: Text(
                          "Log in",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                            ),
                          ),
                        ),
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

  Future<void> login() async {
    var bodyy = jsonEncode({
      "Value": {
        "P_LANG_NO": "2",
        "P_DLVRY_NO": userIdController.text,
        "P_PSSWRD": passwordController.text
      }
    });
    if (userIdController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "http://mapp.yemensoft.net/OnyxDeliveryService/Service.svc/CheckDeliveryLogin"),
          headers: {"Content-Type": "application/json"},
          body: bodyy);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        var errMsg = (data as Map)['Result']['ErrMsg'];
        if (errMsg == "Successful") {
          ResNameSurname = (data as Map)['Data']['DeliveryName'];

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeView(
                        NameSurname: ResNameSurname.toString(),
                      )));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(errMsg)));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.statusCode.toString())));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Not allowed")));
    }
  }
}
