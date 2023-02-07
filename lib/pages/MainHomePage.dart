import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../others/variables.dart';
import 'Home_and_location/Home_Page.dart';
import 'Home_and_location/PickupPlace.dart';
import 'Menu_and_settings/Notification.dart';
import 'Menu_and_settings/Profile.dart';
import 'Menu_and_settings/Settings.dart';
import 'My_orders/ConversationsList.dart';
import 'My_orders/OrdersListV2.dart';
import '../widgets/Location_service.dart';

import 'Order_Setup/ChooseExtentions.dart';

class mainHomePage extends StatefulWidget {
  const mainHomePage({Key? key}) : super(key: key);

  @override
  State<mainHomePage> createState() => _mainHomePageState();
}

class _mainHomePageState extends State<mainHomePage> {
  //Icon Rotation
  double _counter = 0;

  //todo: Set Auto Start function To Dump Data
  //Alpha tools
  void SetDummyData() async {
    // var directions = await LocationService()
    //     .getDirections('24.7718399,46.7874393', '24.7474501,46.7274109');

    //Marker Dummy data
    dslat = 24.7474501;
    dslng = 46.7274109;

    Orlat = 24.7718399;
    Orlng = 46.7874393;

    Origine = [' Riyadh', ' Riyadh,Saudi Arabia'];
    Destination = ['Al Alamein, King Abdullah', 'Riyadh,Saudi Arabia'];

    // // //Getting Route Info
    // Dummy = directions['popyline_decoded'];
    // dmlat = directions['start_location']['lat'];
    // dmlng = directions['start_location']['lng'];
    // bounds_sw = directions['bounds_sw'];
    // bounds_ne = directions['bounds_ne'];
    // distance = directions['distance'].toString();
  }

  //Animation variables
  bool Clicked = false;
  double ContHeight = 0;

  //Nav bar Variables
  int _pageIndex = 4;
  final List<Widget> _tablist = [
    profile(),
    MapSample(),
    MapSample(),
    MapSample(),
    MapSample(),
  ];

  void Change() {
    setState(() {
      if (Clicked) {
        Clicked = false;
        ContHeight = 0;
        _counter = 0;
      } else {
        Clicked = true;
        _counter = 1.5 / 4;
        ContHeight = 270;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tablist.elementAt(_pageIndex),

          //Delivery methodes  + Box
          Padding(
            padding: const EdgeInsets.only(
                top: 33.0, left: 33.0, right: 33.0, bottom: 20),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    opacity: Clicked ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 750),
                    child: AnimatedContainer(
                      //Animation functions
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn,

                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.5,
                              blurRadius: 1,
                              // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: Clicked
                          ? Column(
                              children: [
                                const SizedBox(height: 7),
                                InkWell(
                                  child: Container(
                                    height: 77,
                                    width: MediaQuery.of(context).size.width -
                                        66 -
                                        18,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      //Tile Color
                                      color: const Color(
                                          0xffFAFAFA), //Original listtile Color
                                      //color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12.0)),

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 0.5,
                                          blurRadius: 1,
                                          // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14, bottom: 14),
                                              child: Container(
                                                width: 55,
                                                height: 49,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                alignment: Alignment.center,

                                                //Image
                                                child: Image.asset(
                                                  'assets/pics/leftarrow.png',
                                                  width: 17,
                                                  height: 17,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: const [
                                                  //Title
                                                  Text(
                                                    'توصيل عادي',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff191F28),
                                                    ),
                                                  ),

                                                  SizedBox(height: 5),

                                                  //SubText
                                                  Text(
                                                    'توصيل الشحنة بشكل عادي من نقطة A إلى B',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color(0xff6C6C6C),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14, bottom: 14),
                                              child: Container(
                                                width: 55,
                                                height: 49,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                alignment: Alignment.center,

                                                //Image
                                                child: Image.asset(
                                                  'assets/pics/sologeo.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                67)
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    Change();

                                    // Get.to(const pickupPlace());
                                    Get.to(const chooseExtentions());
                                  },
                                ),
                                const SizedBox(height: 7),
                                InkWell(
                                  child: Container(
                                    height: 77,
                                    width: MediaQuery.of(context).size.width -
                                        66 -
                                        18,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      //Tile Color
                                      color: const Color(
                                          0xffFAFAFA), //Original listtile Color
                                      //color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12.0)),

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 0.5,
                                          blurRadius: 1,
                                          // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14, bottom: 14),
                                              child: Container(
                                                width: 55,
                                                height: 49,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                alignment: Alignment.center,

                                                //Image
                                                child: Image.asset(
                                                  'assets/pics/leftarrow.png',
                                                  width: 17,
                                                  height: 17,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: const [
                                                  //Title
                                                  Text(
                                                    'نقاط إستلام متعددة',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff191F28),
                                                    ),
                                                  ),

                                                  SizedBox(height: 5),

                                                  //SubText
                                                  Text(
                                                    'توصيل عدة شحن لنقطة توصيل واحدة A',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color(0xff6C6C6C),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14, bottom: 14),
                                              child: Container(
                                                width: 55,
                                                height: 49,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                alignment: Alignment.center,

                                                //Image
                                                child: Image.asset(
                                                  'assets/pics/multiget.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                67)
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    Change();
                                    //Get.to(pickupPlace());
                                  },
                                ),
                                const SizedBox(height: 7),
                                InkWell(
                                  child: Container(
                                    height: 77,
                                    width: MediaQuery.of(context).size.width -
                                        66 -
                                        18,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      //Tile Color
                                      color: const Color(
                                          0xffFAFAFA), //Original listtile Color
                                      //color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12.0)),

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 0.5,
                                          blurRadius: 1,
                                          // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14, bottom: 14),
                                              child: Container(
                                                width: 55,
                                                height: 49,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                alignment: Alignment.center,

                                                //Image
                                                child: Image.asset(
                                                  'assets/pics/leftarrow.png',
                                                  width: 17,
                                                  height: 17,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: const [
                                                  //Title
                                                  Text(
                                                    'نقاط تسليم متعددة',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff191F28),
                                                    ),
                                                  ),

                                                  SizedBox(height: 5),

                                                  //SubText
                                                  Text(
                                                    'توصيل شحنة واحدة لعدة نقاط توصيل مختلفة A, C وأكثر',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color(0xff6C6C6C),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14, bottom: 14),
                                              child: Container(
                                                width: 55,
                                                height: 49,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                alignment: Alignment.center,

                                                //Image
                                                child: Image.asset(
                                                  'assets/pics/multideliver.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                67)
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    Change();
                                    //Get.to(pickupPlace());
                                  },
                                ),
                                const SizedBox(height: 7),
                              ],
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 77,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Bottom navigation bar
          Padding(
            padding: const EdgeInsets.only(
                top: 33.0, left: 50.0, right: 50.0, bottom: 20),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: SizedBox(
                      height: 77,
                      child: BottomNavigationBar(
                        selectedItemColor: Color(0xff323232),
                        unselectedItemColor: Color(0xffADB3C2),
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        backgroundColor: Color(0xffFFFFFF),
                        currentIndex: _pageIndex,
                        type: BottomNavigationBarType.fixed,
                        onTap: (int index) {
                          // setState(() {
                          if (index == 0) {
                            Get.to(const settings());
                          } else if (index == 3) {
                            Get.to(const conversationsList());
                          } else if (index == 1) {
                            // SetDummyData();
                            Get.to(
                              () => ordersListv2(),
                            );
                          } else if (index == 2) {
                            Change();
                          } else {
                            // setState(() {
                            _pageIndex = index;
                            // });
                          }

                          // });
                        },
                        items: [
                          BottomNavigationBarItem(
                            label: 'Profile',
                            icon: Image.asset(
                              'assets/pics/BottomIcons/profile.png',
                              height: 24,
                              width: 24,
                            ),
                            activeIcon: Image.asset(
                              'assets/pics/BottomIcons/profile_outlined.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: 'Shop',
                            // icon: Icon(BottomBarIcons.home),
                            icon: Image.asset(
                              'assets/pics/shop.png',
                              height: 24,
                              width: 24,
                            ),
                            activeIcon: Image.asset(
                              'assets/pics/BottomIcons/shop_outlined.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: 'Home',
                            icon: AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: _counter == 0
                                      ? const Color(0xff1877F2)
                                      : const Color(0xff2E2E2E),
                                  borderRadius: BorderRadius.circular(100)),
                              child: AnimatedRotation(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeOutQuart,
                                  filterQuality: FilterQuality.high,
                                  turns: _counter,
                                  child: const Icon(Icons.add,
                                      color: Colors.white, size: 27)),
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: 'Messages',
                            icon: Image.asset(
                              'assets/pics/messagesoff.png',
                              height: 24,
                              width: 24,
                            ),
                            activeIcon: Image.asset(
                              'assets/pics/BottomIcons/messagesoff_outlined.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: 'Home',
                            icon: Image.asset(
                              'assets/pics/home.png',
                              height: 24,
                              width: 24,
                            ),
                            activeIcon: Image.asset(
                              'assets/pics/home_outlined.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Notification Button
          Align(
              alignment: const Alignment(-0.9, -0.90),
              child: InkWell(
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 1,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/pics/Bell.png',
                    scale: 2,
                  ),
                ),
                onTap: () {
                  //print(AppUserID);
                  //Get.to(() =>notification());
                  Get.to(() => const notification());
                },
              )),
        ],
      ),
    );
  }
}
