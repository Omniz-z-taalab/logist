import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';

import '../../utilities/api_path.dart';
import '../../utilities/dio_helper.dart';

class PriceProvider extends ChangeNotifier {
  bool isGetViecle = false;
  dynamic price;
  dynamic distance;

  Future<void> getPrice(
      dynamic lat1, dynamic lang1, dynamic lat2, dynamic lang2) async {
    isGetViecle = true;
    notifyListeners();

    try {
      Response response = await DioHelper.postData(
          url: '${AppApiPaths.base}/api/v1/order/price',
          data: {
            "Distinations": [
              {"lant": lat2, "long": lang2}
            ],
            "locations": [
              {"lant": lat1, "long": lang1}
            ]
          });

      price = response.data['price'];
      distance = response.data['distance'];

      isGetViecle = false;
      notifyListeners();
      print(price);
    } catch (e) {
      print(e);
    }
  }

  bool? res;

  bool? responsee;

  int? orderId;

  Future<void> createOrder(
      dynamic vicleId,
      dynamic vicleTypeId,
      dynamic date,
      dynamic lat1,
      dynamic lang1,
      dynamic lat2,
      dynamic lang2,
      dynamic driverId,
      dynamic trilerId,
      dynamic trilerTypeId) async {
    res == true;

    try {
      Response response = await DioHelper.postData(
          url: '${AppApiPaths.base}/api/v1/order',
          data: {
            "Driver_ID": driverId,
            "Date_of_Order": date,
            "Distination": {"lant": lat2, "long": lang2},
            "location": {"lant": lat1, "long": lang1},
            "viecle_Id": vicleId,
            "trailer_id": trilerId,
            "vehicle_type_Id": vicleTypeId,
            "trailer_type_id": trilerTypeId,
            "Current_Location": {
              "lant": 29.951755714712075,
              "long": 30.934096798504832
            },
            "Order_Type": "Single",
            "Order_Start_Time": date
          });

      print(response.data);
      orderId = response.data['id'];
      print(orderId);
      res = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> payOrder() async {
    responsee = true;
    print(orderId);
    print(orderId);
    print('bbbbbbbbbbbb');
    try {
      Response response = await DioHelper.postData(
          url: '${AppApiPaths.base}/api/v1/order/pay', data: {'id': orderId});
      print(orderId);
      print(response.data);
      print('wwqwqwqw');
      responsee = false;
      notifyListeners();
    } catch (e) {
      print(e);
      print('eeeeerrrrrrrer');
    }
  }
}
