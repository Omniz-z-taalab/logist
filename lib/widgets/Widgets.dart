import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/order_list.dart';
import '../pages/My_orders/OrderInfo.dart';
import '../pages/My_orders/load_route_map.dart';

Widget Vspace(double height) {
  return SizedBox(height: height);
}

Widget Hspace(double width) {
  return SizedBox(width: width);
}

//Simple Picture Widget with height , weight , pre path

//Simple Picture Widget with height , weight , pre path
Widget SimplePic(String name, double width, double height) {
  return Image.asset('assets/pics/$name.png', width: width, height: height);
}

Widget SimplePicNetwork(String name, double width, double height) {
  return Image.network(
    name,
    width: width,
    height: height,
    errorBuilder: (context, error, stackTrace) =>
        Icon(Icons.info_outline, size: height + 10, color: Colors.grey),
  );
}

//Orders List Widgets
Color SayColor(Status) {
  if (Status == 'Delivered') {
    return const Color(0xff2FBF71);
  } else if (Status == 'Pending') {
    return const Color(0xff015FF5);
  } else if (Status == 'Accepted') {
    return const Color(0xff191F28);
  } else if (Status == 'Waiting') {
    return const Color(0xffe1c01c);
  } else {
    return Colors.red;
  }
}

String SayDesc(Status) {
  if (Status == 'Delivered') {
    return 'تم إيصال الشحنة بنجاح';
  } else if (Status == 'Started') {
    return 'جاري توصيل الشحنة';
  } else if (Status == 'Canceled') {
    return 'تم إلغاء الطلب';
  } else if (Status == 'Accepted') {
    return 'تم قبول الطلب / لم تتحرك الشحنة';
  } else if (Status == 'Pending') {
    return 'لم يتم قبول الطلب بعد';
  } else {
    return '';
  }
}

String ConvertStatus(Status) {
  if (Status == 'Delivered') {
    return 'مكتملة';
  } else if (Status == 'Started') {
    return 'تتبع';
  } else if (Status == 'Canceled') {
    return 'مرفوضة';
  } else if (Status == 'Accepted') {
    return 'مقبولة';
  } else if (Status == 'Pending') {
    return 'معلقة';
  } else {
    return '';
  }
}

Widget _OrdersListNow(BuildContext context, AllOrders order) {
  // Return Status Color Type Depending on the State

  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      //color: Colors.black12,
      color: const Color(0xffF6F6F6),
      borderRadius: BorderRadius.circular(13),
    ),
    width: MediaQuery.of(context).size.width - 50,
    height: 95,
    child: ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 23,
          decoration: BoxDecoration(
            //    color: Color(0xffF9F1FD),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(13),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(ConvertStatus(order.status),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Madani',
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  //todo: set its own Parameter
                  color: order.status == 'Delivered'
                      ? SayColor('Delivered')
                      : order.status == 'Accepted'
                          ? SayColor('Accepted')
                          : order.status == 'Canceled'
                              ? SayColor('Canceled')
                              : order.status == 'Pending'
                                  ? SayColor('Pending')
                                  : SayColor('Started'),
                )),
          ),
        ),
      ),

      //Status Icon
      // leading: Padding(
      //   padding: const EdgeInsets.only(top:8.0),
      //   child: Container(
      //     alignment: Alignment.center,
      //     width: 50,
      //     height: 23,
      //     decoration: BoxDecoration(
      //       //    color: Color(0xffF9F1FD),
      //       color: Colors.black12,
      //       borderRadius: BorderRadius.circular(13),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Container(
      //           height: 15,
      //           width: 15,
      //           decoration: BoxDecoration(
      //             //todo: set its own Parameter
      //               color: SayColor("Accepted"),
      //               shape: BoxShape.circle
      //           ),
      //
      //         ),
      //
      //       ],
      //     ),
      //   ),
      // ),

      //Truck Name
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                order.driverName!,
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Madani',
                    fontWeight: FontWeight.w500),
                textDirection: TextDirection.rtl,
              ),
              Text(SayDesc(order.status),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Madani',
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    //todo: set its own Parameter
                    color: order.status == 'Delivered'
                        ? SayColor('Delivered')
                        : order.status == 'Accepted'
                            ? SayColor('Accepted')
                            : order.status == 'Canceled'
                                ? SayColor('Canceled')
                                : order.status == 'Pending'
                                    ? SayColor('Pending')
                                    : SayColor('Started'),
                  ))
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          const CircleAvatar(
            backgroundColor: Colors.black26,
            child: Icon(
              Icons.car_crash_outlined,
              color: Color(0xff191F28),
            ),
          ),
        ],
      ),

      //Status

      //Truck Icon
      // trailing: SimplePic(SayImage(title), 45, 56),

      onTap: () async {
        if (order.status == "Delivered" || order.status == "Canceled") {
          Get.to(() => LoadingRoute(order: order),
              transition: Transition.rightToLeft);
        } else {
          Get.to(() => orderInfo(order.id!),
              transition: Transition.rightToLeft);
        }
        // } else if(order.Status == 'Delivered' || order.Status == 'Canceled'){
        //   Get.to(
        //           () => LoadingRoute(order: order),
        //       transition: Transition.rightToLeft
        //   );
        // }
      },
    ),
  );
}

Widget _OrdersListViewDone(BuildContext context, AllOrders order) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      //color: Colors.black12,
      color: const Color(0xffF6F6F6),
      borderRadius: BorderRadius.circular(13),
    ),
    width: MediaQuery.of(context).size.width - 50,
    height: 95,
    child: ListTile(
      //Status Icon
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          width: 80,
          height: 30,
          decoration: BoxDecoration(
            //    color: Color(0xffF9F1FD),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(ConvertStatus(order.status),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Madani',
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    //todo: set its own Parameter
                    color: SayColor(order.status),
                  )),
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                    //todo: set its own Parameter
                    color: SayColor(order.status),
                    shape: BoxShape.circle),
              )
            ],
          ),
        ),
      ),
      //Truck Name
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            order.driverName!,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Madani',
                fontWeight: FontWeight.w500),
            textDirection: TextDirection.rtl,
          ),
          Text(SayDesc(order.status),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Madani',
                fontSize: 10,
                fontWeight: FontWeight.w300,
                //todo: set its own Parameter
                color: order.status == 'Delivered'
                    ? SayColor('Delivered')
                    : order.status == 'Accepted'
                        ? SayColor('Accepted')
                        : order.status == 'Canceled'
                            ? SayColor('Canceled')
                            : order.status == 'Pending'
                                ? SayColor('Pending')
                                : SayColor('Started'),
              ))
        ],
      ),
      //Status
      // subtitle: Text(
      //   SayDesc(status),
      //   style: const TextStyle(
      //       fontSize: 10, fontFamily: 'Madani', color: Color(0xff909090)),
      //   textDirection: TextDirection.rtl,
      // ),

      //Truck Icon
      // trailing: SimplePic(SayImage(title), 45, 56),

      onTap: () {
        Get.to(() => LoadingRoute(order: order),
            transition: Transition.rightToLeft);
      },
    ),
  );
}

Widget _OrdersListView(BuildContext context, AllOrders order) {
  // Return Status Color Type Depending on the State

  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      //color: Colors.black12,
      color: const Color(0xffF6F6F6),
      borderRadius: BorderRadius.circular(13),
    ),
    width: MediaQuery.of(context).size.width - 50,
    height: 95,
    child: ListTile(
      //Status Icon
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          alignment: Alignment.center,
          width: 80,
          height: 30,
          decoration: BoxDecoration(
            //    color: Color(0xffF9F1FD),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(ConvertStatus(order.status),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Madani',
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      //todo: set its own Parameter
                      color: order.status == 'Delivered'
                          ? SayColor('Delivered')
                          : order.status == 'Accepted'
                              ? SayColor('Accepted')
                              : order.status == 'Canceled'
                                  ? SayColor('Canceled')
                                  : order.status == 'Pending'
                                      ? SayColor('Pending')
                                      : SayColor('Started'),
                    )),
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    //todo: set its own Parameter
                    color: SayColor("Delivered"),
                    shape: BoxShape.circle),
              ),
            ],
          ),
        ),
      ),

      //Truck Name
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            order.driverName!,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Madani',
                fontWeight: FontWeight.w500),
            textDirection: TextDirection.rtl,
          ),
          Text(SayDesc(order.status),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Madani',
                fontSize: 10,
                fontWeight: FontWeight.w300,
                //todo: set its own Parameter
                color: order.status == 'Delivered'
                    ? SayColor('Delivered')
                    : order.status == 'Accepted'
                        ? SayColor('Accepted')
                        : order.status == 'Canceled'
                            ? SayColor('Canceled')
                            : order.status == 'Pending'
                                ? SayColor('Pending')
                                : SayColor('Started'),
              ))
        ],
      ),

      //Status
      // subtitle: Text(order!.status,
      //   style: const TextStyle(
      //       fontSize: 10, fontFamily: 'Madani', color: Color(0xff909090)),
      //   textDirection: TextDirection.rtl,
      // ),

      //Truck Icon
      // trailing: SimplePic(SayImage(title), 45, 56),

      onTap: () async {
        if (order.status == 'Accepted' ||
            order.status == 'Started' ||
            order.status == 'Pending') {
          Get.to(() => orderInfo(order.id!),
              transition: Transition.rightToLeft);
        } else if (order.status == 'Delivered' || order.status == 'Canceled') {
          Get.to(() => LoadingRoute(order: order),
              transition: Transition.rightToLeft);
        }
      },
    ),
  );
}

ListView OrdersList(List<AllOrders> List, var context,
    {bool trial = false, int limit = 3}) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: trial && List.length > limit ? limit : List.length,
    itemBuilder: (context, index) {
      return 'Pending' != List[index].orderType
          ? Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: _OrdersListView(context, List[index]))
          : Container();
    },
  );
}

ListView OrdersListNow(List<AllOrders> List, var context,
    {bool trial = false, int limit = 3}) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: trial && List.length > limit ? limit : List.length,
    itemBuilder: (context, index) {
      return 'Delivered' != List[index].orderType
          ? 'Canceled' != List[index].orderType
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _OrdersListNow(context, List[index]))
              : Container()
          : Container();
    },
  );
}

ListView DeliveredOrdersList(List<AllOrders> List, var context,
    {bool trial = false, int limit = 3}) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: List.length == 0 ? limit : List.length,
    itemBuilder: (context, index) {
      return List[index].status == 'Delivered' ||
              List[index].status == 'Canceled'
          ? Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: _OrdersListViewDone(context, List[index]))
          : Container();
    },
  );
}

//User in order Details page
DetailsListView(
    {var title,
    var subtitle,
    var numb,
    var unit,
    var image,
    bool isLocalImage = true,
    var context}) {
  return Container(
    width: MediaQuery.of(context).size.width - 50,
    height: 63,
    alignment: Alignment.center,
    child: ListTile(
        leading: numb != ''
            ? Container(
                alignment: Alignment.centerLeft,
                width: 65,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '$numb ',
                      style: const TextStyle(
                          fontFamily: 'Madani',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff191F28))),
                  TextSpan(
                      text: unit,
                      style: const TextStyle(
                          fontFamily: 'Madani',
                          fontSize: 12,
                          color: Color(0xff191F28)))
                ])),
              )
            : null,
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontFamily: 'Madani', fontWeight: FontWeight.w500),
          textDirection: TextDirection.rtl,
        ),
        subtitle: subtitle == ''
            ? null
            : Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Madani',
                    color: Color(0xff909090)),
                textDirection: TextDirection.rtl,
              ),
        trailing: isLocalImage
            ? SimplePic(image, 33, 33)
            : SimplePicNetwork(image, 33, 33)),
  );
}
