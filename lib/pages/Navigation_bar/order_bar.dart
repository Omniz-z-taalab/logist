import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/logic/messages/chat_provider.dart';
import '../../others/Dummy_Data_Orders.dart';
import '../../others/variables.dart';
import '../../widgets/Widgets.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/logic/layout/order/order_provider.dart';

class Orders extends StatefulWidget {
  Orders({Key? key, this.isLoading = true}) : super(key: key);
  bool isLoading;

  @override
  State<Orders> createState() => _OrdersState(isLoading);
}

class _OrdersState extends State<Orders> {
  _OrdersState(this.isLoading);

  //PageView
  final controller = PageController(initialPage: 1);

  //Current Page
  int CurrentPage = 1;

  //is Data loading
  bool isLoading;

  // //Finish loading
  // void done() async{
  //   await Future.delayed(const Duration(seconds: 1), (){
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  // void initState(){
  //   super.initState();
  //   done();
  // }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    context.read<OrderProvider>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('طلباتي'),
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
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 2,
                      color: CurrentPage == 0
                          ? Color(0xff2FBF71)
                          : Colors.transparent,
                    ))),
                    child: TextButton(
                        onPressed: () {
                          controller.animateToPage(0,
                              duration: Duration(milliseconds: 750),
                              curve: Curves.easeOutQuart);
                        },
                        child: Text(
                          'المنتهية',
                          style: TextStyle(
                              color: CurrentPage == 0
                                  ? const Color(0xff2FBF71)
                                  : const Color(0xffB8BED3),
                              fontFamily: 'Madani',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
                Hspace(20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 2,
                      color: CurrentPage == 1
                          ? Color(0xff2c55fb)
                          : Colors.transparent,
                    ))),
                    child: TextButton(
                        onPressed: () {
                          controller.animateToPage(1,
                              duration: Duration(milliseconds: 750),
                              curve: Curves.easeOutQuart);
                        },
                        child: Text(
                          'الحالية',
                          style: TextStyle(
                              color: CurrentPage == 1
                                  ? Color(0xff2c55fb)
                                  : Color(0xffB8BED3),
                              fontFamily: 'Madani',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
                Hspace(20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 2,
                      color: CurrentPage == 2
                          ? const Color(0xff191f28)
                          : Colors.transparent,
                    ))),
                    child: TextButton(
                        onPressed: () {
                          controller.animateToPage(2,
                              duration: Duration(milliseconds: 750),
                              curve: Curves.easeOutQuart);
                        },
                        child: Text(
                          'الطلبات',
                          style: TextStyle(
                              color: CurrentPage == 2
                                  ? const Color(0xff191f28)
                                  : Color(0xffB8BED3),
                              fontFamily: 'Madani',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ],
            ),
            Vspace(28),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    CurrentPage = value;
                  });
                },
                controller: controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: context.read<OrderProvider>().isGetLoading
                        ? ShimmerData()
                        : context.read<OrderProvider>().orders.isNotEmpty
                            ? DeliveredOrdersList(
                                context.read<OrderProvider>().orders, context)
                            : const Center(child: Text("لايوجد طلبات")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: context.read<OrderProvider>().isGetLoading
                        ? ShimmerData()
                        : context.read<OrderProvider>().orders.isNotEmpty
                            ? OrdersList(
                                context.read<OrderProvider>().orders, context)
                            : const Center(child: Text("لايوجد طلبات")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: context.read<OrderProvider>().isGetLoading
                        ? ShimmerData()
                        : context.read<OrderProvider>().orders.isNotEmpty
                            ? OrdersList(
                                context.read<OrderProvider>().orders, context)
                            : const Center(child: Text("لايوجد طلبات")),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ShimmerData() {
    return Column(
      children: [
        ShimmerListView(),
        Container(height: 15),
        ShimmerListView(),
        Container(height: 15),
        ShimmerListView(),
        Container(height: 15),
      ],
    );
  }

  //Shimmer listview
  ShimmerListView() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //color: Colors.black12,
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(13),
      ),
      width: MediaQuery.of(context).size.width - 50,
      height: 95,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
          //Status Icon
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              alignment: Alignment.center,
              width: 65,
              height: 23,
              decoration: BoxDecoration(
                //    color: Color(0xffF9F1FD),
                color: Colors.black54,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Status Color Shimmer
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                        //color: Color(0xffF8F8F8),
                        color: Color(0xffa1a8a8),
                        shape: BoxShape.circle),
                  ),

                  //name Shimmer
                  Container(
                    height: 9,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffa1a8a8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Truck Name
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 10,
                width: 92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffcecece),
                ),
              ),
            ],
          ),

          //Status
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: 9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffcecece),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffcecece),
                  ),
                ),
              ),
            ],
          ),

          //Truck Icon
          trailing: Container(
            height: 49,
            width: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffcecece),
            ),
          ),
        ),
      ),
    );
  }
}