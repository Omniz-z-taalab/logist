import 'package:flutter/material.dart';

import '../../../../models/order_list.dart';
import '../../../../models/order_model.dart';
import '../../../utilities/api_path.dart';
import '../../../utilities/dio_helper.dart';

class OrderProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isGetLoading = false;
  bool all = false;
  bool compelet = false;
  bool cancele = false;
  bool accept = false;
  //get orders
  List<AllOrders> allorders = [];
  List<AllOrders> comporders = [];
  List<AllOrders> acceptorder = [];
  List<AllOrders> cancelorder = [];
  OrderDitModel? orderDitModel;
  // Future<bool> getOrders() async {
  //   orders=[];
  //   isGetLoading = true;
  //   notifyListeners();
  //
  //   try {
  //     var response = await DioHelper.getData(url:
  //       '${AppApiPaths.base}/api/v1/employee/orders',
  //     );
  //         response .data.forEach((e) => orders.add(AllOrders.fromJson(e)));
  //           print('sssssssssss');
  //     isGetLoading = false;
  //     notifyListeners();
  //     return isLoading;
  //   } catch (error) {
  //     isGetLoading = false;
  //     // notifyListeners();
  //     return isGetLoading;
  //   }
  // }

  //create order//
  //accept order
  Future<bool> acceptOrders() async {
    isLoading = true;
    accept = true;
    print('omniaZayed');
    acceptorder =[];
    notifyListeners();
    try {
      var response = await DioHelper
          .getData(url:'${AppApiPaths.base}/api/v1/user/GetOrders?status=Started');
      isLoading = false;
      response.data.forEach((order)=> acceptorder.add(AllOrders.fromJson(order)));
      print('tttttttttttttttttt');
      accept == false;
      print('tttttttttttttttttt');
      print(response.data);
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isLoading;
    }
  }
  //cancel order
  Future<void> cancelOrders(int id) async {

    print('Youssef');
    print('Youssef');
    print(id);
    cancelorder = [];
    notifyListeners();
    try {
      var response = await DioHelper.postData(url:'${AppApiPaths.base}/api/v1/order/CancelOrder',data: {
        "id":id
      });

      print(response.data);
      print('eeeeeeee');
      isLoading = false;
      notifyListeners();
      // return isLoading;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      print(error);
    //  return isLoading;
    }
  }
  //complete order
  Future<bool> completeOrders() async {
    isLoading = true;
    comporders = [];
    compelet == true;
    notifyListeners();
    try {
      var response = await DioHelper
          .getData(url:'${AppApiPaths.base}/api/v1/user/GetOrders',);
      isLoading = false;
      response.data.forEach((order)=> comporders.add(AllOrders.fromJson(order)));
      print('rrrrrrrrrrrrrrrr');
      compelet == false;
      print(response.data);
      print('434444');
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      print(error);
      return isLoading;
    }
  }
  Future<bool> orderDetails(int? id) async {
    notifyListeners();

    try {
      var response = await DioHelper
          .getData(url:'${AppApiPaths.base}/api/v1/employee/orders/$id',);
      print(response.data);
      print('taalaaaaaaaaaaab');
      orderDitModel =   OrderDitModel.fromJson(response.data);
      print('434444');
      print(orderDitModel!.driverName);
      print(response.data);
      notifyListeners();
      return isLoading;
    } catch (error) {
      isLoading = false;
      print(error);
      // notifyListeners();
      return isLoading;
    }
  }
  Future<bool> allOrder() async {
    isLoading = true;
    allorders = [];
    all = true;
    notifyListeners();
    try {
      var response = await DioHelper.getData(url:'${AppApiPaths.base}/api/v1/user/GetOrders');
          print('object');
          print(response.data);
      response.data.forEach((order)=> allorders.add(AllOrders.fromJson(order)));
      isLoading = false;
      print(allorders);
      print('[[[[ewewew]]]]]]');
      acceptOrders();
      completeOrders();
      all == false;
      print('object');
      notifyListeners();
      return isLoading;
    } catch (error) {
      print(error);
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
      var response = await DioHelper
          .postData(url:'${AppApiPaths.base}/api/v1/order/UpdateLocation', data:
        {
          "location": {"lant": 30.0812558, "long": 31.2511902},
          "id": 6

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
      var response = await DioHelper
          .getData(url:'${AppApiPaths.base}/api/v1/order/UpdateLocation', data:
        {
          "location": {"lant": 30.0812558, "long": 31.2511902},
          "id": 6

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
      var response = await DioHelper
          .getData(url:'${AppApiPaths.base}/api/v1/order/DriversToDeliver', data: {
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
