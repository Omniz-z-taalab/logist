import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../others/TestPage3.dart';
import '../../others/variables.dart';
import '../MainHomePage.dart';
import 'Details.dart';
import 'OrderList.dart';
import '../../widgets/Location_service.dart';
import '../Home_and_location/PickupPlace.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';



class dummygoing extends StatefulWidget {
  @override
  State<dummygoing> createState() => dummygoingState();
}

late GoogleMapController googleMapController;

class dummygoingState extends State<dummygoing> {

  static const double fabHeightClosed = 10.0;
  double fabHeight = fabHeightClosed;
  double mapBottomPadding = fabHeightClosed;



  CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  LocationData? currentLocation;

  //Marker Variables
  //Marker function
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  BitmapDescriptor OriMar = BitmapDescriptor.defaultMarker;
  BitmapDescriptor DesMar = BitmapDescriptor.defaultMarker;

  //Set Marker Picture
  Future<void> setMark() async {
    final Uint8List OrimarkerIcon = await getBytesFromAsset('assets/pics/StartMar.png', 40);
    final Uint8List DesmarkerIcon = await getBytesFromAsset('assets/pics/DesMar.png', 60);
    OriMar = BitmapDescriptor.fromBytes(OrimarkerIcon);
    DesMar = BitmapDescriptor.fromBytes(DesmarkerIcon);
  }


  double Camlat = 24.7136;
  double Camlng = 46.6753;
  String LocalDistance = '';

  void getCurrentLocation(){
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    },);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 15.4746,
  );


  @override
  void initState(){
    super.initState();
    setMark();
    //getCurrentLocation();

    _originController.text = 'Riyadh Park';
    _destinationController.text = 'Makah Al Mukarama';
    _goToThePlace(dmlat,dmlng,bounds_ne,bounds_sw);
    _setPolyline(Dummy);

  }

  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  void journeyInfo(point){
    _customInfoWindowController.addInfoWindow!(
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 10),
              Text('الشحنة تتحرك',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500
                ),
              ),
              Image.asset('assets/pics/moving.png',width: 28,height: 28),
            ],
          ),

        ),
        point

    );
  }

  Future<void> _setMarker(LatLng point,double lat,double lng) async {


    setState(() {

      //Destination Marker
      _markers.add(
        Marker(
            markerId: MarkerId('PickUp'),
            position: point,
            icon: DesMar,

        ),
      );

      //Origin Marker
      _markers.add(
        Marker(
          markerId: MarkerId('PickDown'),
          position: LatLng(lat,lng),
          icon: OriMar,
            onTap: () {

              journeyInfo(point);
            }

        ),
      );
      print('Pointer 2 Set');
    });
  }

  Future<void> _setOrigineMarker(double lat,double lng) async {

    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('PickDown'),
            position: LatLng(lat,lng),
            icon: OriMar
        ),
      );
      print('Origin Set');
    });
  }




  void _setPolygon(){
    final String PolygonIdVal = 'polygon_$_polygonsIdCounter';
    _polygonsIdCounter++;

    _polygons.add(
      Polygon(
        polygonId: PolygonId('PolygonIdVal'),
        points: polygonslatlng,
        strokeWidth: 4,
        fillColor: Colors.transparent,
      ),
    );

  }

  void _setPolyline(List<PointLatLng>points){
    final String PolylineIdVal = 'polygon_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(
        Polyline(polylineId: PolylineId(PolylineIdVal),
          width: 3,
          color: Color(0xff015FF5),
          points: points.map((point) => LatLng(point.latitude, point.longitude)
          )
              .toList(),
        ));

    print('This Happened');
  }

  tooglePanel(){
    ApanelController.isPanelOpen ? ApanelController.close() : ApanelController.open();
  }

  //Sets
  Set<Marker> _markers =Set<Marker>();
  Set<Polygon> _polygons =Set<Polygon>();
  Set<Polyline> _polylines =Set<Polyline>();
  List<LatLng> polygonslatlng = <LatLng>[];

  int _polygonsIdCounter = 1;
  int _polylineIdCounter = 1;


  double Height = 438.0;



  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // Return Status Color Type Depending on the State
  Color StatColor(String State){

    if(State == 'مكتملة') {
      return const Color(0xff2FBF71);
    } else if(State == 'تتبع') {
      return const Color(0xff015FF5);
    } else if(State == 'مقبولة') {
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
    onPressed: () {
      //Button destination
      // Navigator.push<void>( context,  MaterialPageRoute<void>( builder: (BuildContext context) => const s1() ));
      print(par);
      Get.to(
          () => details(),
          transition: Transition.rightToLeft
      );
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
          fabHeight = (position/2 * panelMaxOpenPosition) + 10;
          mapBottomPadding = (position * 200) + 35;
        }),

        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [

              GoogleMap(
                padding: EdgeInsets.only(bottom: mapBottomPadding , top: 0, right: 0, left: 0),


                zoomControlsEnabled: false,
                onCameraMove: (position){
                  _customInfoWindowController.onCameraMove!();
                },
                onTap: (point){
                  _customInfoWindowController.hideInfoWindow!();
                  setState(() {
                    //Height = 400;
                    // polygonslatlng.add(point);
                    // _setPolygon();
                    // _setMarker(point);

                  });
                },

                polylines: _polylines,

                markers: _markers,

                polygons: _polygons,

                mapType: MapType.normal,


                initialCameraPosition: _kGooglePlex,

                onMapCreated: (GoogleMapController controller) async {
                  _controller.complete(controller);
                  googleMapController = controller ;
                  _customInfoWindowController.googleMapController = controller;
                  journeyInfo(LatLng(dslat, dslng));
                  tooglePanel();

                  setState(() {
                    mapBottomPadding = 40;
                  });
                },



              ),

              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 35,
                width: 115,
                offset: 25,

              ),

              //Localisation Button
              Positioned(
                  right: 20,
                  top: fabHeight,

                  child:
                  InkWell(
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

                      child: Image.asset('assets/pics/close.png',scale: 2,),
                    ),
                    onTap: () {
                      Get.offAll(mainHomePage());
                    },
                  )


              ),





            ],
          ),
        ),
        panel: Container(

          height: 438,
          width: double.infinity,

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft:  Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              )
          ),

          child:

          Stack(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 33,right: 33,top: 33,bottom: 0),
                child: Column(
                  children: [

                    //ListTile
                    Container(
                      height: 77,
                      alignment: Alignment.centerLeft,

                      decoration: BoxDecoration(
                        //color: Color(0xffEEEEEE), //Original listtile Color
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(13.0)),
                      ),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Row(

                            children: [

                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 11,
                                        width: 11,
                                        decoration: BoxDecoration(
                                          //color: Color(0xffF8F8F8),
                                            color: Color(0xff015FF5),
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                      Text(
                                          'تتبع',
                                          textAlign: TextAlign.left,
                                          style:  TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xffBCBCBC),

                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    //Title
                                    Text('شاحنة ALX',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff191F28),

                                      ),

                                    ),

                                    //SubText
                                    Text('10 دقائق للوصول إلى الشحنة',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff6C6C6C),

                                      ),
                                    ),
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
                                  child: Image.asset('assets/pics/trALX.png',width: 40,height: 40,),),
                              ),

                            ],
                          ),

                          Container(width: MediaQuery.of(context).size.width-67)

                        ],
                      ),
                    ),

                    Container(height: 1,color:Color(0xffF2F1F4)),

                    //ListTile
                    Container(
                      height: 77,
                      alignment: Alignment.centerLeft,

                      decoration: BoxDecoration(
                        //color: Color(0xffEEEEEE), //Original listtile Color
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(13.0)),
                      ),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Row(

                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    //Title
                                    Text(Origine[0],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff191F28),

                                      ),

                                    ),

                                    //SubText
                                    Text(Origine[1],
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff6C6C6C),

                                      ),
                                    ),
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
                                  child: Image.asset('assets/pics/origine.png',width: 40,height: 40,),),
                              ),

                            ],
                          ),

                          Container(width: MediaQuery.of(context).size.width-67)

                        ],
                      ),
                    ),

                    Container(height: 1,color:Color(0xffF2F1F4)),

                    //ListTile
                    Container(
                      height: 77,
                      alignment: Alignment.centerLeft,

                      decoration: BoxDecoration(
                        //color: Color(0xffEEEEEE), //Original listtile Color
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(13.0)),
                      ),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Row(

                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    //Title
                                    Text(Destination[0],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff191F28),

                                      ),

                                    ),

                                    //SubText
                                    Text(Destination[1],
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff6C6C6C),

                                      ),
                                    ),
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
                                  child: Image.asset('assets/pics/origine.png',width: 40,height: 40,),),
                              ),

                            ],
                          ),

                          Container(width: MediaQuery.of(context).size.width-67)

                        ],
                      ),
                    ),

                    Container(height: 1,color:Color(0xffF2F1F4)),

                    //ListTile
                    Container(
                      height: 77,
                      alignment: Alignment.centerLeft,

                      decoration: BoxDecoration(
                        //color: Color(0xffEEEEEE), //Original listtile Color
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(13.0)),
                      ),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Row(

                            children: [

                              Container(
                                alignment: Alignment.centerLeft,
                                width: 65,
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: distance.replaceAll('km', ''), //Distance Number
                                          style: const TextStyle(
                                              fontFamily: 'visbydemibold',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff191F28))),
                                      TextSpan(
                                          text: 'km', //Distance Unit
                                          style: const TextStyle(
                                              fontFamily: 'visbylight',
                                              fontSize: 12,
                                              color: Color(0xff191F28)))
                                    ])),
                              ),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    //Title
                                    Text('مسافة نقل الشحنة',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff191F28),

                                      ),

                                    ),


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
                                  child: Image.asset('assets/pics/distance.png',width: 40,height: 40,),),
                              ),

                            ],
                          ),

                          Container(width: MediaQuery.of(context).size.width-67)

                        ],
                      ),
                    ),

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
                            borderRadius: BorderRadius.circular(16)

                        ),
                      ),
                      onTap: (){
                        ApanelController.isPanelOpen ? ApanelController.close() : ApanelController.open();

                      },
                    ),
                  ),
                ),
              ),

            ],
          ),




        ),

      ),

      // floatingActionButton: location_bool ? Container(
      //   width: 52,
      //   height: 52,
      //   decoration: BoxDecoration(
      //     color: Colors.transparent,
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(100),
      //     ),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.1),
      //         spreadRadius: 1,
      //         blurRadius: 2,
      //       ),
      //     ],
      //   ),
      //   child: FittedBox(
      //     child: FloatingActionButton(
      //         onPressed: (){
      //           Get.to(pickupPlace());
      //         },
      //         elevation: 0,
      //         backgroundColor: Colors.white,
      //         child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)
      //     ),
      //   ),
      // ) : null,

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
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat,lng),zoom: 12),
    ),
    );

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(boundsSw['lat'],boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'],boundsNe['lng']),
          ),
          25
      ),
    );
    // _setOrigineMarker(Orlat,Orlng);
    _setMarker(LatLng(dslat, dslng),Orlat,Orlng);
  }

  Future<void> _goToThePlaceBack(Map<String,dynamic> place) async {

    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat,lng),zoom: 12),
    ),
    );
    // _setMarker(LatLng(lat, lng));
  }


}