import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/logic/layout/order/order_provider.dart';
import '../../others/variables.dart';
import '../../widgets/Widgets.dart';

class Orders extends StatefulWidget {
  Orders({Key? key, this.isLoading = true}) : super(key: key);
  bool isLoading;

  @override
  State<Orders> createState() => _OrdersState(isLoading);
}

class _OrdersState extends State<Orders> {
  _OrdersState(this.isLoading);

  //PageView
  final controller = PageController(initialPage: 4);

  //Current Page
  int CurrentPage = 4;

  //is Data loading
  bool isLoading;

  // //Finish loading
  void done() async {
    Provider.of<OrderProvider>(context, listen: false)
        .getOrders()
        .then((value) => setState(() {
              isLoading = false;
            }));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      done();
    });
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<OrderProvider>(context, listen: false)
        .getOrders()
        .then((value) => _refreshController.refreshCompleted());
  }

  void _onLoading() async {
    Provider.of<OrderProvider>(context, listen: false)
        .getOrders()
        .then((value) => _refreshController.refreshCompleted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('طلباتي',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
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
      body: Column(
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
                        ? Color(0xFFBF2F2F)
                        : Colors.transparent,
                  ))),
                  child: TextButton(
                      onPressed: () {
                        controller.animateToPage(0,
                            duration: Duration(milliseconds: 750),
                            curve: Curves.easeOutQuart);
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'الملغية',
                          style: TextStyle(
                              color: CurrentPage == 0
                                  ? const Color(0xFFBF2F2F)
                                  : const Color(0xffB8BED3),
                              fontFamily: 'Madani',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
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
                        ? Color(0xff2FBF71)
                        : Colors.transparent,
                  ))),
                  child: TextButton(
                      onPressed: () {
                        controller.animateToPage(1,
                            duration: Duration(milliseconds: 750),
                            curve: Curves.easeOutQuart);
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'المنتهية',
                          style: TextStyle(
                              color: CurrentPage == 1
                                  ? const Color(0xff2FBF71)
                                  : const Color(0xffB8BED3),
                              fontFamily: 'Madani',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
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
                        ? Color(0xff2c55fb)
                        : Colors.transparent,
                  ))),
                  child: TextButton(
                      onPressed: () {
                        controller.animateToPage(2,
                            duration: Duration(milliseconds: 750),
                            curve: Curves.easeOutQuart);
                      },
                      child: Text(
                        'الحالية',
                        style: TextStyle(
                            color: CurrentPage == 2
                                ? const Color(0xff2c55fb)
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
                    color: CurrentPage == 3
                        ? Color(0xFF284166)
                        : Colors.transparent,
                  ))),
                  child: TextButton(
                      onPressed: () {
                        controller.animateToPage(3,
                            duration: Duration(milliseconds: 750),
                            curve: Curves.easeOutQuart);
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'المعلقة',
                          style: TextStyle(
                              color: CurrentPage == 3
                                  ? const Color(0xFF284166)
                                  : const Color(0xffB8BED3),
                              fontFamily: 'Madani',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
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
                    color: CurrentPage == 4
                        ? const Color(0xff191f28)
                        : Colors.transparent,
                  ))),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TextButton(
                        onPressed: () {
                          controller.animateToPage(4,
                              duration: Duration(milliseconds: 750),
                              curve: Curves.easeOutQuart);
                        },
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'الطلبات',
                            style: TextStyle(
                                color: CurrentPage == 4
                                    ? const Color(0xff191f28)
                                    : Color(0xffB8BED3),
                                fontFamily: 'Madani',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
          Vspace(28),
          Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: const WaterDropHeader(
                complete: Text("تم التحديث"),
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    CurrentPage = value;
                  });
                },
                controller: controller,
                children: [
                  //delivered
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Provider.of<OrderProvider>(context).isLoading
                          ? ShimmerData()
                          : context
                                  .watch<OrderProvider>()
                                  .myCanceldOrdersModel
                                  .isEmpty
                              ? const Center(child: Text("لايوجد طلبات"))
                              : DeliveredOrdersList(
                                  context
                                      .watch<OrderProvider>()
                                      .myCanceldOrdersModel,
                                  context)),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Provider.of<OrderProvider>(context).isLoading
                          ? ShimmerData()
                          : context
                                  .watch<OrderProvider>()
                                  .myDelivredOrdersModel
                                  .isEmpty
                              ? const Center(child: Text("لايوجد طلبات"))
                              : DeliveredOrdersList(
                                  context
                                      .watch<OrderProvider>()
                                      .myDelivredOrdersModel,
                                  context)),
                  //pending
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Provider.of<OrderProvider>(context).isLoading
                        ? ShimmerData()
                        : context
                                .watch<OrderProvider>()
                                .myAcceptedOrdersModel
                                .isEmpty
                            ? const Center(child: Text("لايوجد طلبات"))
                            : OrdersList(
                                context
                                    .watch<OrderProvider>()
                                    .myAcceptedOrdersModel,
                                context),
                  ),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Provider.of<OrderProvider>(context).isLoading
                          ? ShimmerData()
                          : context
                                  .watch<OrderProvider>()
                                  .myWaitingOrdersModel
                                  .isEmpty
                              ? const Center(child: Text("لايوجد طلبات"))
                              : OrdersList(
                                  context
                                      .watch<OrderProvider>()
                                      .myWaitingOrdersModel,
                                  context)),
                  //all orders
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Provider.of<OrderProvider>(context).isLoading
                          ? ShimmerData()
                          : context.watch<OrderProvider>().myOrdersModel.isEmpty
                              ? const Center(child: Text("لايوجد طلبات"))
                              : OrdersList(
                                  context.watch<OrderProvider>().myOrdersModel,
                                  context)),
                ],
              ),
            ),
          )
        ],
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
                    decoration: const BoxDecoration(
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
