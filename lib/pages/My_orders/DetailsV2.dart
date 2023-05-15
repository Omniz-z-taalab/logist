import 'package:flutter/cupertino.dart';
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logist/others/variables.dart';
import 'package:logist/widgets/Widgets.dart';
import 'package:provider/provider.dart';

import '../../core/logic/layout/order/order_provider.dart';
import '../../models/order_list.dart';

class OrderDetailsV2 extends StatefulWidget {
  OrderDetailsV2({Key? key, required this.order, this.special = false})
      : super(key: key);
  AllOrders order;
  bool special;

  @override
  State<OrderDetailsV2> createState() => _OrderDetailsV2State(order, special);
}

class _OrderDetailsV2State extends State<OrderDetailsV2> {
  bool special;
  AllOrders order;

  _OrderDetailsV2State(this.order, this.special);

  //Icon Functions

  //Truck Shape
  String Tricon(int choice) {
    if (choice == 0) {
      return 'trALX';
    } else if (choice == 1) {
      return 'trOPEN';
    } else if (choice == 2) {
      return 'Bigtr';
    } else {
      return 'IconTruck';
    }
  }

  //Truck Type
  String TypeIcon(int choice) {
    if (choice == 0) {
      return 'Aired';
    } else if (choice == 1) {
      return 'Snow';
    } else if (choice == 2) {
      return 'Dry';
    } else {
      return 'IconTruCkFront';
    }
  }

  //Load Type
  String PayloadIcon(int choice) {
    if (choice == 0) {
      return 'med';
    } else if (choice == 1) {
      return 'food';
    } else if (choice == 2) {
      return 'metal';
    } else if (choice == 3) {
      return 'package';
    } else if (choice == 4) {
      return 'cattle';
    } else if (choice == 5) {
      return 'others';
    } else {
      return 'IconOrder';
    }
  }

  Widget ConfirmationButtn(Status) {
    if (Status == 'Accepted') {
      return Container(
        width: 134,
        height: 52,
        foregroundDecoration:
            BoxDecoration(borderRadius: BorderRadius.circular(39)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff1877F2),
          ),
          onPressed: () {
            print('Do Something');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'تفعيل النقل',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SimplePic('ConfirmStart', 19, 19)
            ],
          ),
        ),
      );
    } else if (Status == 'Pending') {
      return Container(
        width: 134,
        height: 52,
        foregroundDecoration:
            BoxDecoration(borderRadius: BorderRadius.circular(39)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2FBF71),
          ),
          onPressed: () {
            print('Do Something');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'تم التوصيل',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Icon(Icons.check_sharp, size: 19)
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Obackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: const Text('ملخص',
            style: TextStyle(
                fontFamily: 'Madani',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff191F28))),
        actions: [
          SizedBox(
            height: 52,
            width: 52,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: IconButton(
                color: const Color(0xff323232),
                icon: const Icon(CupertinoIcons.chevron_forward),
                iconSize: 25,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            //Bottom + price Bar
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  //Thine line
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: const Color(0xffEDEDED),
                  ),

                  //Final Price
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 100,
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          alignment: Alignment.centerLeft,
                          width: 150,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                //Price Here
                                text: order.price.toString(),
                                style: const TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff191F28))),
                            const TextSpan(
                                //Currency Here
                                text: ' SAR',
                                style: TextStyle(
                                    fontFamily: 'Madani',
                                    fontSize: 18,
                                    color: Color(0xff191F28)))
                          ])),
                        ),

                        //Final Price text
                        title: const Text(
                          'السعر النهائي',
                          style: TextStyle(fontSize: 13, fontFamily: 'Madani'),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),

                  //Thin line
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: const Color(0xffEDEDED),
                  ),

                  //Costumer Name details
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ListTile(
                      //Button
                      leading: order.status == "Canceled" ||
                              order.status == "Delivered"
                          ? Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  image: DecorationImage(
                                    image: NetworkImage(order.driverAvatar!),
                                    onError: (exception, stackTrace) =>
                                        Icon(Icons.person),
                                  )),
                            )
                          : Container(
                              width: 134,
                              height: 52,
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(39)),
                              child: ConfirmationButtn(order.status)),

                      //Client name
                      title: Text(
                        //User Name
                        order.driverName!,
                        style:
                            const TextStyle(fontSize: 16, fontFamily: 'Madani'),
                        textDirection: TextDirection.rtl,
                      ),

                      subtitle: const Text(
                        'السائق',
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Madani',
                            color: Color(0xff909090)),
                        textDirection: TextDirection.rtl,
                      ),

                      // trailing:  Padding(
                      //     padding: EdgeInsets.only(right: 15),
                      //
                      //     child:ClipRRect(
                      //         borderRadius: BorderRadius.circular(18),
                      //         child: Image.network(order.,width: 53,height: 53,)
                      //     )
                      //
                      // ),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),

            //Order Details List
            SizedBox(
              height: MediaQuery.of(context).size.height - 263,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Column(
                      children: [
                        //Depart
                        DetailsListView(
                            title: order.locations![0].addressName ?? "",
                            subtitle: order.locations![0].addressNote ?? "",
                            numb: '',
                            unit: '',
                            image: 'depart',
                            context: context),
                        Container(height: 1, color: const Color(0xffF2F1F4)),

                        //Arrive
                        DetailsListView(
                            title: order.distinations![0].addressName ?? "",
                            subtitle: order.distinations![0].addressNote ?? "",
                            numb: '',
                            unit: '',
                            image: 'arriving',
                            context: context),
                        Container(height: 1, color: const Color(0xffF2F1F4)),

                        //Distance
                        DetailsListView(
                            title: 'مسافة نقل الشحنة',
                            subtitle: '',
                            numb: order.totalDistance
                                .toString()
                                .replaceAll('km', ''),
                            unit: 'KM',
                            image: 'distance',
                            context: context),
                        Container(height: 1, color: const Color(0xffF2F1F4)),

                        //Truck name
                        if (order.vehicleName != null)
                          DetailsListView(
                              title: order.vehicleName,
                              subtitle: order.vehicleDesc,
                              numb: '',
                              unit: '',
                              image: order.vehiclePic,
                              isLocalImage: false,
                              context: context),
                        Container(height: 1, color: const Color(0xffF2F1F4)),

                        //trailler Shape
                        if (order.trailerName != null)
                          DetailsListView(
                              title: order.trailerName,
                              subtitle: '',
                              numb: '',
                              unit: '',
                              image: order.trailerPic,
                              isLocalImage: false,
                              context: context),
                        Container(height: 1, color: const Color(0xffF2F1F4)),

                        //trailler type
                        if (order.traillerTypeName != null)
                          DetailsListView(
                              title: order.traillerTypeName,
                              subtitle: order.traillerTypeDesc,
                              numb: '',
                              unit: '',
                              image: order.traillerTypePic,
                              isLocalImage: false,
                              context: context),
                        Container(height: 1, color: const Color(0xffF2F1F4)),
                        //Truck tyoe
                        if (order.vehicleTypeName != null)
                          DetailsListView(
                              title: order.vehicleTypeName,
                              subtitle: '',
                              numb: '',
                              unit: '',
                              image: "IconTruck",
                              context: context),
                        Container(height: 1, color: const Color(0xffF2F1F4)),

                        //Date and Time
                        DetailsListView(
                            title:
                                "الاستلام: ${order.dateOfOrder!.substring(0, 10)}",
                            subtitle: '',
                            numb: order.dateOfOrder!.substring(11, 16),
                            unit: '',
                            image: 'time',
                            context: context),
                        Container(height: 1, color: const Color(0xffF2F1F4)),
                        DetailsListView(
                            title:
                                "التوصيل: ${order.dateOfOrderDelivered!.substring(0, 10)}",
                            subtitle: '',
                            numb: order.dateOfOrderDelivered!.substring(11, 16),
                            unit: '',
                            image: 'time',
                            context: context),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
