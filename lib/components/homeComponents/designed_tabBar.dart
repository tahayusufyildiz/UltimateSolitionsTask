import 'package:flutter/material.dart';

class DesignedTabBar extends StatelessWidget {
  late TabController? tabController;
  DesignedTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          controller: tabController,
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
    );
  }
}
