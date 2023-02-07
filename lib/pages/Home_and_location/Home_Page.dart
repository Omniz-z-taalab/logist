import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../others/variables.dart';
import '../Order_Setup/ChooseExtentions.dart';
import '../Order_Setup/OrderMap.dart';
import '../../widgets/Location_service.dart';
import 'PickupPlace.dart';



class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

late GoogleMapController googleMapController;

class MapSampleState extends State<MapSample> {

  Completer<GoogleMapController> _controller = Completer();

  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  late LocationData currentLocation;

  double Camlat = 24.7136;
  double Camlng = 46.6753;

  void getCurrentLocation() async{

    Location location = Location();

    var _serviceEnabled = await location.serviceEnabled();

    if(_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(_serviceEnabled){
        final currentLocation = await location.getLocation();
        //print(currentLocation.time);
        if(currentLocation != null) {
          final GoogleMapController controller = await _controller.future;

          mylat = currentLocation.latitude;
          mylng = currentLocation.longitude;

          //Changing Camera Position
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(
                      currentLocation.latitude!, currentLocation.longitude!),
                  zoom: 15.5
              )
          ));
        } else {
          print('Location Data is null');
        }


      } else{
      }
    }



  }

  //Marker Variables
  //Marker function
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  BitmapDescriptor myIcon = BitmapDescriptor.defaultMarker;


  //Set Marker Picture
  Future<void> setMark() async {
    final Uint8List markerIcon = await getBytesFromAsset('assets/pics/marker.png', 70);
    myIcon = BitmapDescriptor.fromBytes(markerIcon);
  }



  static  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.79131, 46.6753),
    zoom: 15.4746,
  );


  @override
  void initState(){
    super.initState();
    print('Initialling');
    setMark();

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

  }

  //Sets
  Set<Marker> _markers =Set<Marker>();
  Set<Polygon> _polygons =Set<Polygon>();
  Set<Polyline> _polylines =Set<Polyline>();
  List<LatLng> polygonslatlng = <LatLng>[];

  int _polygonsIdCounter = 1;
  int _polylineIdCounter = 1;

  String distance = '0 KM';



  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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


            onTap: (point){
              setState(() {

              });
            },


            //mapToolbarEnabled: false,

            //polylines: _polylines,

            //markers: _markers,

            polygons: _polygons,

            mapType: MapType.terrain,



            initialCameraPosition: _kGooglePlex,

            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
               googleMapController = controller ;

            },



          ),

          // Localisation Button
          Align(
              alignment: const Alignment(0.9, -0.91),
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

                  child: Image.asset('assets/pics/arrow.png',scale: 2,),
                ),
                onTap: () async{
                  getCurrentLocation();

                },
              )


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
    _setMarker(LatLng(lat, lng));
  }

  Future<void> _goToThePlaceBack(Map<String,dynamic> place) async {

    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat,lng),zoom: 12),
    ),
    );
    _setMarker(LatLng(lat, lng));
  }


}