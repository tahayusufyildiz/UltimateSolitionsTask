import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryCard extends StatelessWidget {
  int index;
  String date;
  String billNo;
  String statusFlag;
  DeliveryCard({
    Key? key,
    required this.index,
    required this.date,
    required this.billNo,
    required this.statusFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 16.5, left: 16.5),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        height: 91,
        width: 342,
        //color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //status column
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 19),
                  child: Container(
                    width: 85,
                    height: 60,
                    //color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //delivery no like #3
                        Text(
                          "#" + billNo,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        //status
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 24),
                          child: Text(
                            "Status",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        //Status Type

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              statusFlag == "1"
                                  ? "Delivered"
                                  : statusFlag == "2"
                                      ? "Partial Return"
                                      : statusFlag == "3"
                                          ? "Full Return"
                                          : "",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: statusFlag == "1"
                                      ? Color(0xFF707070)
                                      : statusFlag == "2"
                                          ? Color(0xFF004F62)
                                          : statusFlag == 3
                                              ? Color(0xFFD42A0F)
                                              : Color(0xFFD42A0F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Divider
                Padding(
                  padding: const EdgeInsets.only(top: 27.5, bottom: 16.5),
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color(0xFFC7C7C7),
                  ),
                ),
                //TotalPrice Container
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 27),
                  child: Container(
                    width: 64,
                    height: 37,
                    //color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Total Price
                        Center(
                          child: Text(
                            "Total price",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        //Price LE
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Center(
                                child: Text(
                                  "6378 LE",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Color(0xFF004F62),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Divider
                Padding(
                  padding:
                      const EdgeInsets.only(top: 27.5, bottom: 16.5, left: 6),
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color(0xFFC7C7C7),
                  ),
                ),
                //Date Container
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 27),
                  child: Container(
                    width: 95,
                    height: 36,
                    //color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Date
                        Center(
                          child: Text(
                            "Date",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        //Date Value
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              date,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Color(0xFF004F62),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 60,
              height: double.infinity,
              decoration: BoxDecoration(
                color: statusFlag == "1"
                    ? Color(0xFF707070)
                    : statusFlag == "2"
                        ? Color(0xFF004F62)
                        : statusFlag == 3
                            ? Color(0xFFD42A0F)
                            : Color(0xFFD42A0F),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  "Order Details \n >",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color(0xFFFFFFFFFF),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
