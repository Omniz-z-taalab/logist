import 'dart:async';
import 'dart:convert' as convert;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'PickupPlace2.dart';
import 'variables.dart';
import '../widgets/Location_service.dart';

class MapSample3 extends StatefulWidget {
  @override
  State<MapSample3> createState() => MapSample3State();
}

late GoogleMapController googleMapController;

class MapSample3State extends State<MapSample3> {
  final String key = 'AIzaSyAmvScp6-pEERvH5CjkLJwQG7cxUh30Vno';

  Future<List<String>> GetAddressName(double lat, double Long) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$Long&key=$key';
    try {
      var response = await http.get(Uri.parse(url));
      var json = convert.jsonDecode(response.body);
      print('Sent $lat , $Long');
      print('Received $json');
      var status = json['status'];

      if (status != 'ZERO_RESULTS') {
        var placeId = json['results'][0]['formatted_address'];
        var name = json['results'][0]['address_components'][2]['short_name'];
        var address = json['plus_code']['compound_code'];
        print(
            '===================================================================');
        print(name);
        print(address);
        print(
            '===================================================================');
        SubDest = placeId;
        //return [SubOrigin,SubOrigin];
        return [name, address];
      } else {
        var name = json['plus_code']['global_code'];
        var address = json['plus_code']['compound_code'];
        return [name, address];
      }
    } catch (exception) {
      var name = 'nothing';
      var address = 'مشكلة في الإتصال بالإنترنت';
      return [name, address];
    }
  }

  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  late LocationData currentLocation;

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

  BitmapDescriptor myIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor Myplace = BitmapDescriptor.defaultMarker;

  //Set Marker Picture
  Future<void> setMark() async {
    final Uint8List placeIcon =
        await getBytesFromAsset('assets/pics/marker.png', 60);
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/pics/Mark.png', 60);

    Myplace = BitmapDescriptor.fromBytes(placeIcon);
    myIcon = BitmapDescriptor.fromBytes(markerIcon);
  }

  //Request Parameters
  bool isLoading = false;
  bool neterror = false;

  //Waiting for Request
  Widget loadingLoader() {
    return SpinKitRing(
      lineWidth: 2.2,
      size: 20,
      color: Color(0xff1877F2),
    );
  }

  //Logo Position
  double mapBottomPadding = 125;

  double Camlat = 24.7136;
  double Camlng = 46.6753;

  String Dest = 'اختر مكان التسليم';
  String SubDest = 'يمكنك تحديد مكان التسليم يدوية أو البحث';
  List<String> Titles = [
    'اختر مكان التسليم',
    'يمكنك تحديد مكان التسليم يدوية أو البحث'
  ];
  bool DestSelected = false;
  double BarHeight = 125.0; //Bar height

  void getCurrentLocation() async {
    Location location = Location();

    var _serviceEnabled = await location.serviceEnabled();

    if (_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled) {
        final currentLocation = await location.getLocation();
        print(currentLocation.time);
        if (currentLocation != null) {
          final GoogleMapController controller = await _controller.future;
          print(
              '${currentLocation.longitude} AND ${currentLocation.latitude} Are So important');
          mylat = currentLocation.latitude;
          mylng = currentLocation.longitude;
          //Setting marker on mao
          _setMarker(
              LatLng(currentLocation.latitude!, currentLocation.longitude!));

          //Changing Camera Position
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(
                      currentLocation.latitude!, currentLocation.longitude!),
                  zoom: 15.5)));
        } else {
          print('Location Data is null');
        }
      }
    }
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(mylat!, mylng!),
    zoom: 15.4746,
  );

  @override
  void initState() {
    super.initState();
    setMark();
    //getCurrentLocation();

    // _setMarker(LatLng(32.294047, -6.709170));
    _originController.text = 'Casablanca';
    _destinationController.text = 'Rabat';
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('PickUp'),
          position: point,
          icon: Myplace,
        ),
      );
      print('Pointer 2 Set');
    });
  }

  void _setPlaceMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('location'),
          position: point,
          icon: myIcon,
        ),
      );
    });
  }

  void _setPolygon() {
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

  void _setPolyline(List<PointLatLng> points) {
    final String PolylineIdVal = 'polygon_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(Polyline(
      polylineId: PolylineId(PolylineIdVal),
      width: 3,
      color: Color(0xff015FF5),
      points: points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList(),
    ));
  }

  //Sets
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonslatlng = <LatLng>[];

  int _polygonsIdCounter = 1;
  int _polylineIdCounter = 1;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Widget Next(String par) => MaterialButton(
        disabledColor: Color(0xff42484F).withOpacity(0.90),
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
        onPressed: !neterror
            ? null
            : () async {
                //Button destination

                var directions =
                    await LocationService().getDirections(OrPoint, DesPoint);
                var state = directions['status'];

                if (state) {
                  // //Getting Route Info
                  Dummy = directions['popyline_decoded'];
                  dmlat = directions['start_location']['lat'];
                  dmlng = directions['start_location']['lng'];
                  bounds_sw = directions['bounds_sw'];
                  bounds_ne = directions['bounds_ne'];
                  distance = directions['distance'].toString();

                  Get.to(() => package_place2(),
                      transition: Transition.rightToLeft);
                } else {
                  // setState(() {
                  //   Titles[1] = "لم يتم العتور على أي مسار رحلة مناسب المرجو تغير نقاط الرحلة";
                  // });

                  Fluttertoast.showToast(
                    msg:
                        "لم يتم العتور على أي مسار رحلة مناسب المرجو تغير نقاط الرحلة",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 7,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  print('No valid trip found');
                }
              },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              padding: EdgeInsets.only(
                  bottom: mapBottomPadding, top: 0, right: 0, left: 0),
              zoomControlsEnabled: false,
              onTap: (point) async {
                setState(() {
                  Titles[0] = 'جاري تحديد مكان الشحنة';
                  isLoading = true;
                });

                Titles = await GetAddressName(point.latitude, point.longitude);

                if (Titles[0] != 'nothing') {
                  neterror = false;
                  isLoading = false;
                  DesPoint = point.latitude.toString() +
                      ',' +
                      point.longitude.toString();
                  print('Going to package place 2');
                  dslat = point.latitude;
                  dslng = point.longitude;
                  setState(() {
                    BarHeight = 210;
                    mapBottomPadding = BarHeight;

                    Destination = Titles;

                    DestSelected = true;
                    _setPlaceMarker(point);
                    // polygonslatlng.add(point);
                    // _setPolygon();
                    // _setMarker(point);
                  });
                } else {
                  setState(() {
                    Titles[0] = Titles[1];
                    Titles[1] = 'المرجو التحقق من جودة الأنترنت ';
                    isLoading = false;
                    neterror = true;
                  });
                }
              },
              polylines: _polylines,
              markers: _markers,
              polygons: _polygons,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                googleMapController = controller;

                setState(() {
                  mapBottomPadding = 126;
                });
              },
            ),

            AnimatedContainer(
              //Dimentions
              height: BarHeight,
              width: double.infinity,

              //Animations
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,

              decoration: BoxDecoration(

                  //Shadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )),

              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 33, right: 33, bottom: 21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // height: 77,
                      alignment: Alignment.centerLeft,

                      decoration: const BoxDecoration(
                        color: Color(0xffEEEEEE),
                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      ),

                      //ListTile
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 4),

                                    //Title
                                    Text(
                                      Titles[0],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff191F28),
                                      ),
                                    ),

                                    //To add Space
                                    const SizedBox(height: 4),

                                    //SubText
                                    Text(
                                      Titles[1],
                                      style: const TextStyle(
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
                                padding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 14.0,
                                    top: 14,
                                    bottom: 14),
                                child: isLoading
                                    ? loadingLoader()
                                    : Icon(
                                        Icons.location_on,
                                        size: 28,
                                        color: neterror
                                            ? Color(0xffc50e0e)
                                            : Color(0xff1877F2),
                                      ),
                              ),
                            ],
                          ),
                          // Container(
                          //     width: MediaQuery.of(context).size.width - 67)
                        ],
                      ),
                    ),

                    //Next Button
                    AnimatedOpacity(
                      // If the widget is visible, animate to 0.0 (invisible).
                      // If the widget is hidden, animate to 1.0 (fully visible).
                      opacity: !DestSelected ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      // The green box must be a child of the AnimatedOpacity widget.

                      child: !DestSelected
                          ? Next('أختر المكان')
                          : Container(height: 0, width: 0),
                    )
                  ],
                ),
              ),
            ),

            //Localisation Button
            Align(
                alignment: Alignment(0.9, -0.96),
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
                      'assets/pics/arrow.png',
                      scale: 2,
                    ),
                  ),
                  onTap: () async {
                    getCurrentLocation();
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: location_bool
          ? Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: FittedBox(
                child: FloatingActionButton(
                    onPressed: () {},
                    elevation: 0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/pics/arrow.png',
                      width: 16,
                    )),
              ),
            )
          : null,
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

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
          ),
          25),
    );
    _setMarker(LatLng(lat, lng));
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
    _setMarker(LatLng(lat, lng));
  }
}
