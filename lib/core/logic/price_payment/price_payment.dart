import 'dart:convert';
import 'dart:ffi';

import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';

import '../../utilities/api_path.dart';
import '../../utilities/dio_helper.dart';

class PriceProvider extends ChangeNotifier {
  bool isGetViecle = false;
   late int price ;
  Future<void> getPrice(
      double lat1, double lang1, double lat2, double lang2) async {
    isGetViecle = true;
    notifyListeners();
    print(lat1);
    print('xzxZXzXd');
    print(lat2);
    print(lang1);
    print(lang2);

    try {
      Response response = await DioHelper.postData(url: '${AppApiPaths.base}/api/v1/order/price',data: {

          "Distination":{
            "lant":lat1,
            "long": lang1
          },
          "location":{
            "lant":lat2,
            "long": lang2
          }

      });
      print('eeeeeeee');
      print(response.data);
    price = response.data['price'];
      isGetViecle = false;
      notifyListeners();
      print(price);
    } catch (e) {
      print(e);
    }
  }
    bool? res ;
    bool? responsee ;
  int? orderId;
  Future<void> createOrder(int vicleId, String? date, double lat1, double lang1, double lat2, double lang2,int driverId, int trilerId )async{
    res == true;
    print(driverId);
    print(date);
    print(lat1);
    print(lang1);
    print(vicleId);
    print(lat2);
    print(lang2);
    print(lat2);
    print(lat2);
    print(vicleId);
    print(vicleId);
    print('trilerId)');
    print(trilerId);

    print(vicleId);
    print(vicleId);

    try{
      Response response =await DioHelper.postData(url: '${AppApiPaths.base}/api/v1/order',
          data:{
        "Driver_ID": driverId,
          "Date_of_Order": '$date',
          "Distination": {
          "lant": lat1,
          "long":lang1
          },
          "location": {
          "lant": lat2,
          "long": lang2
          },
          "viecle_Id": 3,
          "trailer_id": trilerId,
          "Current_Location": {
          "lant": 29.951755714712075,
          "long": 30.934096798504832
          },
          "Order_Type": "Single",
          "Order_Start_Time": date
      });
      print('sddddddddd');

      print(response.data);
      orderId = response.data['id'];
      print(orderId);
            res =false;
      print('la la la la');
    }catch(e){
    print(e);
    }
  }

  Future<void> payOrder() async{
    responsee = true;
    print(orderId);
    print(orderId);
    print('bbbbbbbbbbbb');
    try {
      Response response = await DioHelper.postData(url: '${AppApiPaths.base}/api/v1/order/pay'
          ,data:{ 'id': orderId });
      print(orderId);
        print(response.data);
        print('wwqwqwqw');
          responsee = false;
notifyListeners();
    }catch(e){
    print(e);
    print('eeeeerrrrrrrer');
    }
  }
}
