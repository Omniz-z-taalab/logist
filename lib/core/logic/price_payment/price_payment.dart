import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

import '../../../pages/Payments/PaymentMethods.dart';
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
      print(price);
      print("$lat2 $lang2 $lat1 $lang1");
      isGetViecle = false;
      notifyListeners();
      print(price);
    } catch (e) {
      print(e);
    }
  }

  bool res = false;

  bool? responsee;

  int? orderId;

  Future<void> createOrder(
      {int? vicleId,
      required BuildContext context,
      int? vicleTypeId,
      List<String>? dateStart,
      List<String>? dateEnd,
      String? note,
      String? locationNote,
      String? destenationNote,
      String? locationTitle,
      String? destenationTitle,
      var lat1,
      var lang1,
      var lat2,
      var lang2,
      int? driverId,
      int? trilerId,
      int? trilerTypeId}) async {
    res == true;
    notifyListeners();
    DioHelper.postData(url: '${AppApiPaths.base}/api/v1/order', data: {
      "Driver_ID": driverId,
      "Date_of_Order": "${dateStart![0]} ${dateStart[1]}",
      "Date_of_Order_Delivered": "${dateEnd![0]} ${dateEnd[1]}",
      "Distinations": [
        {
          "lant": lat2,
          "long": lang2,
          "address_name": "$destenationTitle",
          "address_note": "$destenationNote"
        },
      ],
      "locations": [
        {
          "lant": lat1,
          "long": lang1,
          "address_name": "$locationTitle",
          "address_note": "$locationNote"
        }
      ],
      "viecle_Id": vicleId,
      "trailer_id": trilerId,
      "vehicle_type_Id": vicleTypeId,
      "trailer_type_id": trilerTypeId,
      "Current_Location": {
        "lant": 29.951755714712075,
        "long": 30.934096798504832,
        "address_name": "address_name",
        "address_note": "address_name"
      },
      "Order_Type": "Single",
      "Order_Start_Time": dateStart[0],
      "order_note": note,
    }).then((value) {
      if (value.statusCode == 200) {
        print(value.data);
        orderId = value.data['id'];
        print(orderId);
        res = false;
        Get.to(() => paymentMethods(context.watch<PriceProvider>().price),
            transition: Transition.rightToLeft);
        notifyListeners();
      }
      res = false;
      notifyListeners();
    }).catchError((error) {
      res = false;
      showToast("يوجد مشكله فنية و جاري العمل عليها",false,false);
      print(error);
    });
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
