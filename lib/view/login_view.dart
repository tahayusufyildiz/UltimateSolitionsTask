import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_solitions_task/components/loginComponents/designed_textField.dart';
import 'package:ultimate_solitions_task/components/loginComponents/login_header.dart';
import 'package:ultimate_solitions_task/components/loginComponents/login_imageBox.dart';
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
  String? resNameSurname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LoginHeader(),
            Padding(
              padding: const EdgeInsets.only(top: 132),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
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
                            textStyle: const TextStyle(
                                color: Color(0xFF004F62),
                                fontSize: 12,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    DesignedTextField(
                      textcontroller: userIdController,
                      hintText: "User ID",
                      topPadding: 44,
                    ),
                    DesignedTextField(
                      textcontroller: passwordController,
                      hintText: "Password",
                      topPadding: 8,
                    ),
                    //Log in Button
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 44, right: 17, left: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          //fixedSize: const Size(342, 44),
                          backgroundColor: const Color(0xFF004F62),
                          minimumSize: const Size.fromHeight(44),
                        ),
                        child: Text(
                          "Log in",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const LoginImageBox(),
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
          resNameSurname = (data as Map)['Data']['DeliveryName'];

          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeView(
                        NameSurname: resNameSurname.toString(),
                      )));
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(errMsg)));
        }
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.statusCode.toString())));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Not allowed")));
    }
  }
}
