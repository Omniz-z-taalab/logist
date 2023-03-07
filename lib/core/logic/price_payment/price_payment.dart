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
      isGetViecle = false;
    price = response.data['price'];
      notifyListeners();
      print(price);
    } catch (e) {
      print(e);
    }
  }
    bool? res ;
    bool? responsee ;
  int? orderId;
  Future<void> createOrder(int driverId, String? date, double lat1, double lang1, double lat2, double lang2,int vicleId,  )async{
    res == true;

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
          "viecle_Id": 1,
          "trailer_id": 1,
          "Current_Location": {
          "lant": 29.951755714712075,
          "long": 30.934096798504832
          },
          "Order_Type": "Single",
          "Order_Start_Time": "2023-02-22"
      });
      print('sddddddddd');

      print(response.data);
      orderId = response.data['id'];
      print(orderId);
      if(response.statusCode  == 200){
            res ==false;
      }
      print('la la la la');
    }catch(e){
    print(e);
    }
  }

  Future<void> payOrder() async{
    responsee == true;
    print(orderId);
    try {
      Response response = await DioHelper.postData(url: '${AppApiPaths.base}/api/v1/order/pay'
          ,data:{ 'id': orderId });
      print(orderId);
        print(response.data);
        print('wwqwqwqw');
        if(response.statusCode == 200){
          responsee == false;

        }
notifyListeners();
    }catch(e){
    print(e);
    print('eeeeerrrrrrrer');
    }
  }
}
