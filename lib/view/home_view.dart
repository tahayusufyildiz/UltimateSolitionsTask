import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ultimate_solitions_task/service/delivery_service.dart';

import '../components/homeComponents/designed_HomeBody.dart';
import '../components/homeComponents/designed_tabBar.dart';
import '../components/homeComponents/home_header.dart';
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
  late DeliveryBills? _delivery;

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
          HomeHeader(name: "${widget.NameSurname}"),
          DesignedTabBar(tabController: _tabController),
          HomeBody(
              tabController: _tabController,
              isLoading: _isLoading,
              deliveriesList: deliveries),
        ]),
      ),
    );
  }
}
