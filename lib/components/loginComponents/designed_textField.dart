import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignedTextField extends StatelessWidget {
  TextEditingController textcontroller;
  String hintText;
  double topPadding;
  DesignedTextField({
    Key? key,
    required this.textcontroller,
    required this.hintText,
    required this.topPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 16, left: 17, top: topPadding),
      child: TextField(
        textAlign: TextAlign.center,
        controller: textcontroller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF1F5FB),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(
                color: Color(0xFFF1F5FB),
              )),
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Color(0xFF000000),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
