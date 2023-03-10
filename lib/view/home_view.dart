import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  final String NameSurname;
  const HomeView({Key? key, required this.NameSurname}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFFFFFFF),
        child: Column(
          children: [
            Container(
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
                          "${widget.NameSurname}",
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
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150))),
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
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(18))),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: Container(
                width: 220,
                height: 36,
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    indicator: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(00000029),
                            offset: Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFF004F62)),
                    tabs: [
                      Tab(
                        text: "New",
                      ),
                      Tab(
                        text: "Others",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
