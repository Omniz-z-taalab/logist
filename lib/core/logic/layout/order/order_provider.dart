import 'package:flutter/material.dart';

import '../../../../models/order_list.dart';
import '../../../../models/order_model.dart';
import '../../../utilities/api_path.dart';
import '../../../utilities/api_service.dart';

class OrderProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isGetLoading = false;
  //get orders
  List<Orders> orders = [];
  Future<bool> getOrders() async {
    isGetLoading = true;
    notifyListeners();

    try {
      var response = await DioManager().get(
        '${AppApiPaths.base}/api/v1/user/GetOrders',
      );
      orders =
          (response as List<dynamic>).map((e) => Orders.fromJson(e)).toList();

      isGetLoading = false;
      notifyListeners();
      return isLoading;
    } catch (error) {
      isGetLoading = false;
      // notifyListeners();
      return isGetLoading;
    }
  }

  //create order//
  Future<bool> createOrder({OrderModel? orderModel}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response =
          await DioManager().post('${AppApiPaths.base}/api/v1/order', data: {
        "Driver_ID": 5,
        "Date_of_Order": "2023-01-13",
        "Distination": {"lant": 30.0817441, "long": 31.2365508},
        "location": {"lant": 30.0817441, "long": 31.2365508},
        "viecle_Id": 1,
        "trailer_id": 1,
        "Current_Location": {"lant": 30.0678471, "long": 31.2265421},
        "Order_Type": "Single",
        "Order_Start_Time": "2023-01-15"
      });

      isLoading = false;
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isLoading;
    }
  }

  //accept order
  Future<bool> acceptOrders({int? orderId}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .post('${AppApiPaths.base}/api/v1/order/AcceptOrder', data: {
        {"id": 6}
      });

      isLoading = false;
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isLoading;
    }
  }

  //cancel order
  Future<bool> cancelOrders({int? orderId}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .post('${AppApiPaths.base}/api/v1/order/CancelOrder', data: {
        {"id": 6}
      });

      isLoading = false;
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isLoading;
    }
  }

  //complete order
  Future<bool> completeOrders({int? orderId}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .post('${AppApiPaths.base}/api/v1/order/CompleteOrder', data: {
        {"id": 6}
      });

      isLoading = false;
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isLoading;
    }
  }

  //updateLocationfor Order
  Future<bool> updateLocationOrders({int? orderId, double? lat, long}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .post('${AppApiPaths.base}/api/v1/order/UpdateLocation', data: {
        {
          "location": {"lant": 30.0812558, "long": 31.2511902},
          "id": 6
        }
      });

      isLoading = false;
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;

      return isLoading;
    }
  }

  //getOrderStatus
  Future<bool> getOrderStatus({int? orderId, double? lat, long}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .get('${AppApiPaths.base}/api/v1/order/UpdateLocation', data: {
        {
          "location": {"lant": 30.0812558, "long": 31.2511902},
          "id": 6
        }
      });

      isLoading = false;
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;

      return isLoading;
    }
  }

  //DriversToDeliver
  Future<bool> getdeliverToDriver({int? range, double? lat, long}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .get('${AppApiPaths.base}/api/v1/order/DriversToDeliver', data: {
        {"lan": 30.0812558, "lon": 31.2511902, "Range": range}
      });

      isLoading = false;
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;

      return isLoading;
    }
  }
}
