import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  String name;
   HomeHeader({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 127,
      //color: Color.fromARGB(255, 237, 33, 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 121,
            height: 127,
            decoration: BoxDecoration(
                color: Color(0xFF004F62),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(150))),
            child: Image.asset(
              "assets/deliveryman.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 33, 18),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18))),
    );
  }
}
