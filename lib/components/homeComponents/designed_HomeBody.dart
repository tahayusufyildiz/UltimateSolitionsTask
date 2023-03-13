import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'delivery_card.dart';

class HomeBody extends StatelessWidget {
  late TabController? tabController;
  bool? isLoading;
  List deliveriesList;
  HomeBody({
    Key? key,
    required this.tabController,
    required this.isLoading,
    required this.deliveriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //height: 300,
        width: double.infinity,

        child: TabBarView(
          controller: tabController,
          children: [
            //New (I cant see a new type on APIs so create like just this.....)
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
            isLoading == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : isLoading == true
                    ? ListView.builder(
                        itemCount: deliveriesList.length,
                        itemBuilder: (context, index) {
                          return DeliveryCard(
                            index: index,
                            date: deliveriesList[index].bILLDATE!,
                            billNo: deliveriesList[index].bILLNO!,
                            statusFlag: deliveriesList[index].dLVRYSTATUSFLG!,
                          );
                        },
                      )
                    : const Center(
                        child: Text("We have a problem.."),
                      ),
          ],
        ),
      ),
    );
  }
}
