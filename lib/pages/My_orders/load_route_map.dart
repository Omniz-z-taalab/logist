import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logist/models/order_list.dart';
import 'package:lottie/lottie.dart';

import '../../Classes/Order_Class.dart';
import '../../widgets/Location_service.dart';
import 'order_map_v2.dart';

class LoadingRoute extends StatefulWidget {
  LoadingRoute({Key? key, required this.order}) : super(key: key);
  AllOrders order;

  @override
  State<LoadingRoute> createState() => _LoadingRouteState(order);
}

class _LoadingRouteState extends State<LoadingRoute> {
  AllOrders order;

  String OrPoint = "";
  String DesPoint = "";
  late OrderRoute orderRoute;
  void GoNext() {
    Get.off(() => orderMapv2(order, orderRoute),
        transition: Transition.rightToLeft);
  }

  _setData(AllOrders order) async {
    OrPoint =
        order.locationLat.toString() + ',' + order.locationLong.toString();
    DesPoint = order.distinationLat.toString() +
        ',' +
        order.distinationLong.toString();

    var directions = await LocationService().getDirections(OrPoint, DesPoint);

    orderRoute = OrderRoute(
        directions['popyline_decoded'],
        directions['bounds_sw'],
        directions['bounds_ne'],
        directions['start_location']['lat'],
        directions['start_location']['lng'],
        OrPoint,
        DesPoint);
    bounds_nee = directions['bounds_ne'];
    bounds_sww = directions['bounds_sw'];

    GoNext();
  }

  @override
  void initState() {
    super.initState();
    _setData(order);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Lottie.asset('assets/json/loading_map_route.json',
              frameRate: FrameRate(60)),
        ),
      ),
    );
  }

  _LoadingRouteState(this.order);
}
