import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import '../create_order/location_user_1.dart';
import '../../others/variables.dart';
import '../create_order/Home_package_active.dart';
import '../../widgets/Location_service.dart';
import '../../widgets/SearchAPI.dart';

// import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as locate;
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

late GoogleMapController googleMapController;

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  var controller;
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  // late LocationData currentLocation;

  double Camlat = 24.7136;
  double Camlng = 46.6753;

// Future<List<Suggestion>> getSuggestions(String query) async{
//   PlacesAutocompleteResponse response = await places.autocomplete(query,tueps:['(cities'], component:[Component(Component.country, 'eg')])
// }


  late bool gpsEnabled;
  List<List<String>> places = [];

  String? kGoogleApiKey = "AIzaSyA8R2ZGRtTqb3ZaPFIGY2nxfWospmbfBTY";


  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        await openAppSettings();
      }
    }

    return await getLocation();
  }

  // final GoogleMapController controller = GoogleMapController();
  late double lat;
  late double lng;

  Future<Position> getLocation() async {
    await Geolocator.getCurrentPosition();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print('eeeeeeeeeeeeee=======================');
    print(position.longitude);
    lat = position.latitude;
    lng = position.longitude;
    return position;
    // Changing Camera Position
  }

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.421998333333335, -122.084),
    zoom: 15.4746,
  );

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

  //Set Marker Picture
  Future<void> setMark() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/pics/marker.png', 70);
    myIcon = BitmapDescriptor.fromBytes(markerIcon);
  }
  GoogleMapController? mapController; //contrller for Google map

  @override
  void initState() {
    super.initState();
    CameraPosition;
    print('Initialling');
    setMark();
    // getPer();
    getUsername();
    getUserphone();

    getCurrentLocation();
    //_setMarker(LatLng(32.294047, -6.709170));
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('Place'),
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

  String distance = '0 KM';
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  String location = "Search Location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,

            onTap: (point) {
              setState(() {});
            },

            //mapToolbarEnabled: false,

            //polylines: _polylines,

            //markers: _markers,

            polygons: _polygons,

            mapType: MapType.terrain,

            initialCameraPosition: kGooglePlex,

            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
              googleMapController = controller;
            },
          ),

          // Localisation Button

          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Align(
              alignment: const Alignment(0.9, -0.91),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
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
                child:
                 IconButton(onPressed:()

                      async {
                        var place = await PlacesAutocomplete.show(

                            context: context,
                            apiKey: kGoogleApiKey!,
                            mode: Mode.overlay,
                            types: [],
                            strictbounds: false,
                            components: [Component(Component.country, 'sa')],
                            //google_map_webservice package
                            onError: (err){
                              print(err);
                            }
                        );

                        if(place != null){
                          setState(() {
                            location = place.description.toString();
                          });

                          //form google_maps_webservice package
                          final plist = GoogleMapsPlaces(apiKey:kGoogleApiKey,
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
                          googleMapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 17)));
                    }
                    },
                   icon: Icon(Icons.search),
                  ),),
                  SizedBox(
                    height: 20,
                  ),
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
                      child: Image.asset(
                        'assets/pics/arrow.png',
                        scale: 2,
                      ),
                    ),
                    onTap: () async {
                      final GoogleMapController mapController =
                          await _controller.future;
                      mapController.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(target: LatLng(lat, lng), zoom: 15)));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

  Future<void> plaseId(String? placeId) async{
    GoogleMapsPlaces place = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detailsResponse= await place.getDetailsByPlaceId(placeId!);
    controller.animateCamera(LatLng(detailsResponse.result.geometry!.location!.lat, detailsResponse.result.geometry!.location!.lng));
  }
  Widget pickupMapButton(){
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex:4,
              child: Text(
                'تحديد الموقع على الخريطة',

                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'ArabotoFat',
                ),
              ),
            ),
            Expanded( child: Image.asset('assets/pics/maps.png',width: 36,height: 36,)),
          ],
        ),
      ),
      onTap: (){
        //Use Map search Instead
        // Get.to(
        //         ()=>LocationUser1(),
        //     transition: Transition.rightToLeft
        // );


      },
    );
  }
  Widget locationList(){
    return ListView.builder(

      shrinkWrap: true,
      itemCount: places.length,

      itemBuilder: (context, i) {

        return places.length != 0

            ? ListTile(
          trailing: Image.asset('assets/pics/blackMarker.png',width: 21,height: 28,),
          title: Text(
            places[i][0],
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Color(0xff191F28),
              fontFamily: 'Montserrat',
              fontSize: 14,

            ),
          ),
          subtitle: Text(
            places[i][1],
            textAlign: TextAlign.end,

            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Color(0xff6C6C6C),
              fontFamily: 'Montserrat',
              fontSize: 10,

            ),
          ),
          onTap: () async{
            print(places.length);
            print('--------------------');

            //Get name And Subtitle address
            var results = await LocationService().getPlaceV2(places[i][i]);

            print(results);
            print('32233223322');

            Origine = [results[1],results[2]];
            //  OrPoint;
            Get.to(MapSample());
            //Go to the Second page




            //print(places.length);

          },
        )

            : Container(height: 0, width: 0);

      },
    );
  }

}
