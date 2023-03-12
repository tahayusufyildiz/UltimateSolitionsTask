import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_solitions_task/service/delivery_service.dart';

import '../model/delivery_model.dart';

class HomeView extends StatefulWidget {
  final String NameSurname;
  const HomeView({Key? key, required this.NameSurname}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  DeliveryService _service = DeliveryService();
  bool? _isLoading;

  List<DeliveryBills> deliveries = [];
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    //_tabController?.animateTo(2);
    _service.fetchDelivery().then((value) {
      if (value != null && value.data?.deliveryBills != null) {
        setState(() {
          deliveries = value.data!.deliveryBills!;
          _isLoading = true;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFFFFFFF),
        child: Column(children: [
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
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(18))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 61),
            child: Container(
              width: 220,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Color(0xFFFFFFFF),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFFFFFFFF),
                indicator: BoxDecoration(
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
          Expanded(
            child: Container(
              //height: 300,
              width: double.infinity,

              child: TabBarView(
                controller: _tabController,
                children: [
                  //New
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No orders yet",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              //color: Color(0xFF004F62),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "You don't have any delivery in your history.",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                //color: Color(0xFF004F62),
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //others
                  _isLoading == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _isLoading == true
                          ? ListView.builder(
                              itemCount: deliveries.length,
                              itemBuilder: (context, index) {
                                return deliveryCard(
                                  index,
                                  deliveries[index]!.bILLDATE!,
                                  deliveries[index]!.bILLNO!,
                                  deliveries[index]!.dLVRYSTATUSFLG!,
                                );
                              },
                            )
                          : const Center(
                              child: Text("We have a problem.."),
                            ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget deliveryCard(index, date, billNo, statusFlag) {
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
                        Padding(
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
                        Padding(
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
