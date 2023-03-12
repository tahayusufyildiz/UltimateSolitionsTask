import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/delivery_model.dart';

class DeliveryService {
  final String url =
      "http://mapp.yemensoft.net/OnyxDeliveryService/Service.svc/GetDeliveryBillsItems";
  Future<DeliveryModel?> fetchDelivery() async {
    var res = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "Value": {
            "P_DLVRY_NO": "1010",
            "P_LANG_NO": "2",
            "P_BILL_SRL": "",
            "P_PRCSSD_FLG": ""
          }
        }));
        if (res.statusCode == 200) {
      var jsonBody = DeliveryModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print("Fail Request => ${res.statusCode}");
    }
  }
}
