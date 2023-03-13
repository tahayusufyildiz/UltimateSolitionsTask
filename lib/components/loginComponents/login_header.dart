import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            decoration: const BoxDecoration(
                color: Color(0xFFD42A0F),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(150))),
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
    );
  }
}
