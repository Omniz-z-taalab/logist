import 'dart:async';
import 'dart:convert' as convert;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;

import '../../others/variables.dart';
import 'Home_package_active.dart';

class LocationUser1 extends StatefulWidget {
  String noteText;
  int PayloadText;
  List<String> TimeNum;
  String Trtext;
  int Typetext;
  int vicleId;
  int trilerId;

  // String place1;
  // String place2;
  LocationUser1(this.noteText, this.PayloadText, this.TimeNum, this.Trtext,
      this.Typetext, this.vicleId, this.trilerId);

  @override
  State<LocationUser1> createState() => LocationUser1State();
}

late GoogleMapController googleMapController;

class LocationUser1State extends State<LocationUser1> {
  //Loading
  bool isLoading = false;
  bool netError = false;
  double mapBottomPadding = 280;

  final String key = 'AIzaSyA8R2ZGRtTqb3ZaPFIGY2nxfWospmbfBTY';
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  // late LocationData currentLocation;

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
  var latt;
  var lngg;

  //Set Marker Picture
  Future<void> setMark() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/pics/Mark.png', 60);
    final Uint8List placeIcon =
        await getBytesFromAsset('assets/pics/marker.png', 60);
    myIcon = BitmapDescriptor.fromBytes(markerIcon);
    Myplace = BitmapDescriptor.fromBytes(placeIcon);
  }

  double Camlat = 24.7136;
  double Camlng = 46.6753;

  String Origin = 'اختر مكان الشحنة';
  String SubOrigin = 'يمكنك تحديد مكان الشحنة يدوية أو البحث';
  List<String> Titles = [
    'اختر مكان الشحنة',
    'يمكنك تحديد مكان الشحنة يدوية أو البحث'
  ];
  bool OriginSelected = false;
  double BarHeight = 125.0; //Bar height

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(mylat!, mylng!),
    zoom: 15.4746,
  );
  String SubDest = 'يمكنك تحديد مكان التسليم يدوية أو البحث';
  var Lat;
  var Lng;
  var placeUserpick1;
  var placeUserpick2;

  Future<List<String>> GetAddressName(double lat, double Long) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$Long&key=$key';
    try {
      var response = await http.get(Uri.parse(url));
      var json = convert.jsonDecode(response.body);
      print('Sent $lat , $Long');
      print('Received $json');
      var status = json['status'];
      Lat = lat;
      Lng = Long;
      print('lattttttttttt$Lat,longggggggggg$Lng');
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

  @override
  void initState() {
    super.initState();

    setMark();
    // getCurrentLocation();

    _originController.text = 'Casablanca';
    _destinationController.text = 'Rabat';
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

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('PickUp'),
          position: point,
          icon: Myplace,
        ),
      );
    });
  }

  Widget PlaceText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //Title
        Text(
          Titles[0],
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            color: Color(0xff191F28),
          ),
        ),

        SizedBox(height: 4),

        //SubText
        Text(
          Titles[1],
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w300,
            color: Color(0xff6C6C6C),
          ),
        ),
      ],
    );
  }

  Widget placeIcon() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: netError ? Color(0xffc50e0e) : Color(0xff1877F2),
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '',
        style: TextStyle(
            fontSize: 13,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w200,
            color: Color(0xffFFFFFF)),
      ),
    );
  }

  Widget loadingMessage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'جاري تحديد المكان',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            color: Color(0xff191F28),
          ),
        ),
      ],
    );
  }

  Widget loadingLoader() {
    return SpinKitRing(
      lineWidth: 2.2,
      size: 20,
      color: Color(0xff1877F2),
    );
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

    print('This Happened');
  }

  //Sets
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonslatlng = <LatLng>[];

  int _polygonsIdCounter = 1;
  int _polylineIdCounter = 1;

  String distance = '0 KM';

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
        child: Text(
          par,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: netError
            ? null
            : () {
                //Button destination
                // Navigator.push<void>( context,  MaterialPageRoute<void>( builder: (BuildContext context) => const s1() ));
                print(par);
                print('wwwwwwwww');
                Get.to(
                    () => package_place(
                        Lat,
                        Lng,
                        widget.noteText,
                        widget.PayloadText,
                        widget.TimeNum,
                        widget.Trtext,
                        widget.Typetext,
                        placeUserpick1,
                        placeUserpick2,
                        widget.vicleId,
                        widget.trilerId),
                    transition: Transition.rightToLeft);
                print('Went to Map2');
              },
      );

  String? kGoogleApiKey = "AIzaSyA8R2ZGRtTqb3ZaPFIGY2nxfWospmbfBTY";
  String location = "Search Location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(alignment: Alignment.bottomCenter, children: [
      GoogleMap(
        padding: EdgeInsets.only(
            bottom: mapBottomPadding, top: 0, right: 0, left: 0),
        zoomControlsEnabled: false,
        onTap: (point) async {
          if (true) {
            setState(() {
              Titles[0] = 'جاري تحديد مكان الشحنة';
              isLoading = true;
            });

            Titles = await GetAddressName(point.latitude, point.longitude);

            if (Titles[0] != 'nothing') {
              _setPlaceMarker(point);
              Orlat = point.latitude;
              Orlng = point.longitude;

              setState(() {
                BarHeight = 210;
                mapBottomPadding = BarHeight;

                //Origin = 'Riyadh Park';
                Origine = Titles;

                OriginSelected = true;

                LatPoint = point.latitude.toString() +
                    ',' +
                    point.longitude.toString();

                // polygonslatlng.add(point);
                // _setPolygon();
                // _setMarker(point);
                isLoading = false;
                netError = false;
              });
            } else {
              setState(() {
                Titles[0] = Titles[1];
                Titles[1] = 'المرجو التحقق من جودة الأنترنت ';
                isLoading = false;

                netError = true;
              });
            }
          }
          placeUserpick1 = Titles[0];
          placeUserpick2 = Titles[1];
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
            mapBottomPadding = 125;
          });
        },
      ),

      AnimatedContainer(
        height: BarHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 1,
              // changes position of shadow
            ),
          ],
        ),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 33, right: 33, top: 25, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // height: 77,
                alignment: Alignment.centerLeft,

                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffEEEEEE)),
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                ),

                //ListTile
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: PlaceText(),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: isLoading ? loadingLoader() : placeIcon(),
                        ),
                      ],
                    ),
                    Container(width: MediaQuery.of(context).size.width - 67)
                  ],
                ),
              ),

              //Next Button

              AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: OriginSelected ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                // The green box must be a child of the AnimatedOpacity widget.
                child: OriginSelected
                    ? Next('أختر المكان')
                    : Container(
                        height: 0,
                        width: 0,
                      ),
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
          child: IconButton(
            onPressed: () async {
              var place = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: kGoogleApiKey!,
                  mode: Mode.overlay,
                  types: [],
                  strictbounds: false,
                  components: [Component(Component.country, 'sa')],
                  //google_map_webservice package
                  onError: (err) {
                    print(err);
                  });

              if (place != null) {
                setState(() {
                  Titles[1] = place.description.toString();
                });

                //form google_maps_webservice package
                final plist = GoogleMapsPlaces(
                  apiKey: kGoogleApiKey,
                  apiHeaders: await GoogleApiHeaders().getHeaders(),
                  //from google_api_headers package
                );
                String placeid = place.placeId ?? "0";
                final detail = await plist.getDetailsByPlaceId(placeid);
                final geometry = detail.result.geometry!;
                final lat = geometry.location.lat;
                final lang = geometry.location.lng;
                var newlatlang = LatLng(lat, lang);

                //move map camera to selected place with animation
                googleMapController?.animateCamera(
                    CameraUpdate.newCameraPosition(
                        CameraPosition(target: newlatlang, zoom: 17)));
              }
            },
            icon: Icon(Icons.search),
          ),
        )),
      )
    ])));
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
