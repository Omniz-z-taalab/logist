import 'dart:async';
import 'dart:ui' as ui;

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logist/models/order_list.dart';
import 'package:logist/widgets/Widgets.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// import 'package:location/location.dart';
import '../../Classes/Order_Class.dart';
import '../../core/logic/layout/order/order_provider.dart';
import '../../others/variables.dart';
import 'DetailsV2.dart';

class orderMapv2 extends StatefulWidget {
  orderMapv2(this.order, this.orderRoute);

  @override
  State<orderMapv2> createState() => orderMapv2State(order, orderRoute);
  AllOrders order;
  OrderRoute orderRoute;
}

late GoogleMapController googleMapController;

class orderMapv2State extends State<orderMapv2> {
  AllOrders order;
  OrderRoute orderRoute;

  orderMapv2State(this.order, this.orderRoute);

  static const double fabHeightClosed = 10.0;
  double fabHeight = fabHeightClosed;

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  // LocationData? currentLocation;

  //Marker Variables
  //Marker function
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  BitmapDescriptor OriMar = BitmapDescriptor.defaultMarker;
  BitmapDescriptor DesMar = BitmapDescriptor.defaultMarker;

  //Set Marker Picture
  Future<void> setMark() async {
    final Uint8List OrimarkerIcon =
        await getBytesFromAsset('assets/pics/StartMar.png', 40);
    final Uint8List DesmarkerIcon =
        await getBytesFromAsset('assets/pics/DesMar.png', 60);
    OriMar = BitmapDescriptor.fromBytes(OrimarkerIcon);
    DesMar = BitmapDescriptor.fromBytes(DesmarkerIcon);
  }

  // void getCurrentLocation(){
  //   Location location = Location();
  //
  //   location.getLocation().then((location) {
  //     currentLocation = location;
  //   },);
  // }

  void MapInitFunctions() async {
    await setMark();
    await _setPolyline(orderRoute.Dummy);
    await _goToThePlace(
        orderRoute.dmlat, orderRoute.dmlng, bounds_nee, bounds_sww);

    setState(() {
      bounds_nee = {};
      bounds_sww = {};
    });
  }

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.79131, 46.6753),
    zoom: 13.4746,
  );

  //Variables to Extract Route Data

  Map<String, dynamic> bounds_ne = {};
  Map<String, dynamic> bounds_sw = {};
  double dmlat = 0.0;
  double dmlng = 0.0;
  String OrPoint = "";
  String DesPoint = "";

  @override
  void initState() {
    super.initState();
    MapInitFunctions();
  }

  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  void journeyInfo(point) {
    _customInfoWindowController.addInfoWindow!(
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 10),
              Text(
                'تم الوصول',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              Image.asset('assets/pics/Done.png', width: 28, height: 28),
            ],
          ),
        ),
        point);
  }

  Future<void> _setMarker(LatLng point, double lat, double lng) async {
    setState(() {
      //Destination Marker
      _markers.add(
        Marker(
            markerId: MarkerId('PickUp'),
            position: point,
            icon: DesMar,
            onTap: () {
              journeyInfo(point);
            }),
      );

      //Origin Marker
      _markers.add(
        Marker(
          markerId: MarkerId('PickDown'),
          position: LatLng(lat, lng),
          icon: OriMar,
        ),
      );
      print('Pointer 2 Set');
    });
  }

  Future<void> _setOrigineMarker(double lat, double lng) async {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('PickDown'),
            position: LatLng(lat, lng),
            icon: OriMar),
      );
      print('Origin Set');
    });
  }

  _setPolyline(List<PointLatLng> points) {
    final String PolylineIdVal = 'polygon_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(Polyline(
      polylineId: PolylineId(PolylineIdVal),
      width: 3,
      color: Color(0xff2FBF71),
      points: points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList(),
    ));

    print('This Happened');
  }

  //Sets
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonslatlng = <LatLng>[];

  int _polylineIdCounter = 1;

  double Height = 438.0;

  // Return Status Color Type Depending on the State
  Color StatColor(String State) {
    if (State == 'مكتملة') {
      return const Color(0xff2FBF71);
    } else if (State == 'تتبع') {
      return const Color(0xff015FF5);
    } else if (State == 'مقبولة') {
      return const Color(0xff191F28);
    } else {
      return Colors.red;
    }
  }

  final ApanelController = PanelController();

  Widget Next(String par) => MaterialButton(
        color: On,
        minWidth: double.infinity,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Container(
          child: Text(
            par,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        onPressed: () async {
          //Button destination
          // Navigator.push<void>( context,  MaterialPageRoute<void>( builder: (BuildContext context) => const s1() ));
          print(par);
          await Provider.of<OrderProvider>(context, listen: false)
              .getPlaces(order);
          Get.to(() => OrderDetailsV2(order: order),
              transition: Transition.rightToLeft);
          //Button Navigation Place
          print('Went to Map2');
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        controller: ApanelController,
        maxHeight: 438,
        minHeight: 40,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        onPanelSlide: (position) => setState(() {
          final panelMaxOpenPosition = 438 - 40;
          fabHeight = (position / 2 * panelMaxOpenPosition) + 10;
          print(position * panelMaxOpenPosition);
        }),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onCameraMove: (position) {
                  _customInfoWindowController.onCameraMove!();
                },
                onTap: (point) {
                  _customInfoWindowController.hideInfoWindow!();
                  setState(() {});
                },
                polylines: _polylines,
                markers: _markers,
                polygons: _polygons,
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) async {
                  _controller.complete(controller);
                  googleMapController = controller;
                  _customInfoWindowController.googleMapController = controller;
                  journeyInfo(
                      LatLng(order.distinationLat, order.distinationLong));
                  tooglePanel();
                },
              ),

              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 35,
                width: 115,
                offset: 25,
              ),

              //close Button
              Positioned(
                  right: 20,
                  top: fabHeight,
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
                        'assets/pics/close.png',
                        scale: 2,
                      ),
                    ),
                    onTap: () {
                      Get.back();

                      //Close Button Function
                    },
                  )),
            ],
          ),
        ),
        panel: Container(
          height: 438,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              )),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 33, right: 33, top: 33, bottom: 0),
                child: Column(
                  children: [
                    //ListTile
                    Container(
                      height: 77,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        //color: Color(0xffEEEEEE), //Original listtile Color
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 65,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    //    color: Color(0xffF9F1FD),
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 11,
                                        width: 11,
                                        decoration: BoxDecoration(
                                            color: SayColor(order.status),
                                            //   color: order.StatusColor(),
                                            shape: BoxShape.circle),
                                      ),
                                      Text(ConvertStatus(order.status!),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            color: SayColor(order.status),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   child: Column(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     crossAxisAlignment: CrossAxisAlignment.end,
                              //     children: [
                              //       //Title
                              //       // Text(order.,
                              //       //   style: TextStyle(
                              //       //     fontSize: 14,
                              //       //     fontFamily: 'Montserrat',
                              //       //     fontWeight: FontWeight.w300,
                              //       //     color: Color(0xff191F28),
                              //       //
                              //       //   ),
                              //       //
                              //       // ),
                              //
                              //       //SubText
                              //       // Text(order.Truck.loadtype,
                              //       //   textDirection: TextDirection.rtl,
                              //       //   style: TextStyle(
                              //       //     fontSize: 10,
                              //       //     fontFamily: 'Montserrat',
                              //       //     fontWeight: FontWeight.w300,
                              //       //     color: Color(0xff6C6C6C),
                              //       //
                              //       //   ),
                              //       // ),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Container(
                                  width: 55,
                                  height: 49,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  alignment: Alignment.center,

                                  //Image
                                  child: order.vehiclePic != null
                                      ? SimplePicNetwork(
                                          order.vehiclePic!, 40, 40)
                                      : Image.asset(
                                          'assets/pics/ALX.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width - 67)
                        ],
                      ),
                    ),

                    Container(height: 1, color: Color(0xffF2F1F4)),

                    //ListTile
                    Container(
                      height: 77,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        //color: Color(0xffEEEEEE), //Original listtile Color
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //Title
                                    Text(
                                      order.orderType!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff191F28),
                                      ),
                                    ),

                                    //SubText
                                    // Text(order.OrigineDesc,
                                    //   textDirection: TextDirection.rtl,
                                    //   style: TextStyle(
                                    //     fontSize: 10,
                                    //     fontFamily: 'Montserrat',
                                    //     fontWeight: FontWeight.w300,
                                    //     color: Color(0xff6C6C6C),
                                    //
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Container(
                                  width: 55,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  alignment: Alignment.center,

                                  //Image
                                  child: Image.asset(
                                    'assets/pics/depart.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width - 67)
                        ],
                      ),
                    ),

                    Container(height: 1, color: Color(0xffF2F1F4)),

                    //ListTile
                    Container(
                      height: 77,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        //color: Color(0xffEEEEEE), //Original listtile Color
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //Title
                                    Text(
                                      order.driverName!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff191F28),
                                      ),
                                    ),

                                    //SubText
                                    // Text(order.DestDesc,
                                    //   textDirection: TextDirection.rtl,
                                    //   style: TextStyle(
                                    //     fontSize: 10,
                                    //     fontFamily: 'Montserrat',
                                    //     fontWeight: FontWeight.w300,
                                    //     color: Color(0xff6C6C6C),
                                    //
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Container(
                                  width: 55,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  alignment: Alignment.center,

                                  //Image
                                  child: Image.asset(
                                    'assets/pics/arriving.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width - 67)
                        ],
                      ),
                    ),

                    Container(height: 1, color: Color(0xffF2F1F4)),

                    //ListTile
                    // Container(
                    //   height: 77,
                    //   alignment: Alignment.centerLeft,
                    //   decoration: BoxDecoration(
                    //     //color: Color(0xffEEEEEE), //Original listtile Color
                    //     color: Colors.transparent,
                    //     borderRadius: BorderRadius.all(Radius.circular(13.0)),
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     children: [
                    //       // Row(
                    //       //
                    //       //   children: [
                    //       //
                    //       //     Container(
                    //       //       alignment: Alignment.centerLeft,
                    //       //       width: 65,
                    //       //       child: RichText(
                    //       //           text: TextSpan(children: [
                    //       //             TextSpan(
                    //       //                 text: order.Distance.toString().replaceAll('km', ''), //Distance Number
                    //       //                 style: const TextStyle(
                    //       //                     fontFamily: 'visbydemibold',
                    //       //                     fontSize: 16,
                    //       //                     fontWeight: FontWeight.w600,
                    //       //                     color: Color(0xff191F28))),
                    //       //             TextSpan(
                    //       //                 text: 'km', //Distance Unit
                    //       //                 style: const TextStyle(
                    //       //                     fontFamily: 'visbylight',
                    //       //                     fontSize: 12,
                    //       //                     color: Color(0xff191F28)))
                    //       //           ])),
                    //       //     ),
                    //       //
                    //       //     Expanded(
                    //       //       child: Column(
                    //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       //         crossAxisAlignment: CrossAxisAlignment.end,
                    //       //         children: [
                    //       //
                    //       //           //Title
                    //       //           Text('مسافة نقل الشحنة',
                    //       //             style: TextStyle(
                    //       //               fontSize: 14,
                    //       //               fontFamily: 'Montserrat',
                    //       //               fontWeight: FontWeight.w300,
                    //       //               color: Color(0xff191F28),
                    //       //
                    //       //             ),
                    //       //
                    //       //           ),
                    //       //
                    //       //
                    //       //         ],
                    //       //       ),
                    //       //     ),
                    //       //
                    //       //     Padding(
                    //       //       padding: const EdgeInsets.all(14.0),
                    //       //       child: Container(
                    //       //         width: 55,
                    //       //         height: 49,
                    //       //         decoration: BoxDecoration(
                    //       //           color: Colors.transparent,
                    //       //           borderRadius: BorderRadius.all(
                    //       //             Radius.circular(100),
                    //       //           ),
                    //       //         ),
                    //       //         alignment: Alignment.center,
                    //       //
                    //       //         //Image
                    //       //         child: Image.asset('assets/pics/distance.png',width: 40,height: 40,),),
                    //       //     ),
                    //       //
                    //       //   ],
                    //       // ),
                    //
                    //       Container(
                    //           width: MediaQuery.of(context).size.width - 67)
                    //     ],
                    //   ),
                    // ),

                    SizedBox(height: 10),

                    Next('المزيد من التفاصيل'),
                  ],
                ),
              ),
              Positioned.fill(
                top: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        width: 58,
                        height: 4,
                        decoration: BoxDecoration(
                            color: Color(0xffEFEFEF),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onTap: () {
                        print('pressed');
                        ApanelController.isPanelOpen
                            ? ApanelController.close()
                            : ApanelController.open();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }

  Future<void> _goToThePlace(
    //Map<String,dynamic> place
    double lat,
    double lng,
    Map<String, dynamic> boundsNe,
    Map<String, dynamic> boundsSw,
  ) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );

    // _setOrigineMarker(Orlat,Orlng);
    _setMarker(LatLng(order.distinationLat, order.distinationLong),
        order.locationLat, order.locationLong);

    try {
      controller.animateCamera(
        CameraUpdate.newLatLngBounds(
            LatLngBounds(
              southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
              northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
            ),
            25),
      );
    } catch (e) {}
  }

  Future<void> _goToThePlaceBack(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
    // _setMarker(LatLng(lat, lng));
  }

  tooglePanel() {
    ApanelController.isPanelOpen
        ? ApanelController.close()
        : ApanelController.open();
  }
}
