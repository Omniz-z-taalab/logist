import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../Classes/Order_Class.dart';
import '../../../../models/order_list.dart';
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
  // List<AllOrders> allorders = [];
  // List<AllOrders> comporders = [];
  // List<AllOrders> acceptorder = [];
  // List<AllOrders> cancelorder = [];
  OrderDitModel? orderDitModel;
  List<AllOrders> myWaitingOrdersModel = [];
  List<AllOrders> myOrdersModel = [];
  List<AllOrders> myCanceldOrdersModel = [];
  List<AllOrders> myDelivredOrdersModel = [];
  List<AllOrders> myAcceptedOrdersModel = [];
  List<Place> points = [];

  Future<String> getAddressFromLatLong(Position position, bool isName) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    notifyListeners();
    if (!isName) {
      return '${place.street}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea} , ${place.country}';
    } else {
      return place.country!;
    }
  }

  Future<void> getPlaces(AllOrders myOrderModel) async {
    points = [];
    Place origin = Place(
        await getAddressFromLatLong(
            Position(
              altitude: 31.000,
              accuracy: 1,
              speed: 1,
              heading: 1,
              timestamp: DateTime.now(),
              speedAccuracy: 1,
              longitude: myOrderModel.locations![0].longitude,
              latitude: myOrderModel.locations![0].latitude,
            ),
            true),
        await getAddressFromLatLong(
            Position(
              altitude: 31.000,
              accuracy: 1,
              speed: 1,
              heading: 1,
              timestamp: DateTime.now(),
              speedAccuracy: 1,
              longitude: myOrderModel.locations![0].longitude,
              latitude: myOrderModel.locations![0].latitude,
            ),
            false),
        LatLng(myOrderModel.locations![0].latitude,
            myOrderModel.locations![0].longitude),
        "Origine");
    Place destenation = Place(
        await getAddressFromLatLong(
            Position(
              altitude: 31.000,
              accuracy: 1,
              speed: 1,
              heading: 1,
              timestamp: DateTime.now(),
              speedAccuracy: 1,
              longitude: myOrderModel.locations![0].longitude,
              latitude: myOrderModel.locations![0].latitude,
            ),
            true),
        await getAddressFromLatLong(
            Position(
              altitude: 31.000,
              accuracy: 1,
              speed: 1,
              heading: 1,
              timestamp: DateTime.now(),
              speedAccuracy: 1,
              longitude: myOrderModel.locations![0].longitude,
              latitude: myOrderModel.locations![0].latitude,
            ),
            false),
        LatLng(myOrderModel.locations![0].latitude,
            myOrderModel.locations![0].longitude),
        "Destination");

    points = [origin, destenation];
    notifyListeners();
  }

  //get orders
  Future<void> getOrders() async {
    myOrdersModel = [];
    myWaitingOrdersModel = [];
    //myEndedOrdersModel = [];
    myAcceptedOrdersModel = [];
    myDelivredOrdersModel = [];
    myCanceldOrdersModel = [];
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioHelper.getData(
          url: '${AppApiPaths.base}/api/v1/user/GetOrders');

      response.data
          .forEach((order) => myOrdersModel.add(AllOrders.fromJson(order)));
      print(myOrdersModel);
      for (var element in myOrdersModel) {
        if (element.status == "Pending") {
          myWaitingOrdersModel.add(element);
        } else if (element.status == "Accepted" ||
            element.status == "Started") {
          myAcceptedOrdersModel.add(element);
        } else if (element.status == "Delivered") {
          myDelivredOrdersModel.add(element);
        } else if (element.status == "Canceled") {
          myCanceldOrdersModel.add(element);
        }
      }

      notifyListeners();

      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      print(error);
      // notifyListeners();
    }
  }

  Future<void> cancelOrders(int id, BuildContext context) async {
    // cancelorder = [];
    notifyListeners();
    try {
      var response = await DioHelper.postData(
          url: '${AppApiPaths.base}/api/v1/order/CancelOrder',
          data: {"id": id});

      getOrders();
      showToast(' تم إلغاء الطلب', true, true);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
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

  Future<void> orderDetails(int? id) async {
    orderDitModel = null;
    notifyListeners();

    try {
      var response = await DioHelper.getData(
        url: '${AppApiPaths.base}/api/v1/employee/orders/$id',
      );
      orderDitModel = OrderDitModel.fromJson(response.data);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
