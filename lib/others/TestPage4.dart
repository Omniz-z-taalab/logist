import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'PickupPlace2.dart';
import 'variables.dart';
import '../widgets/Location_service.dart';
import '../pages/Home_and_location/PickupPlace.dart';



class MapSample3 extends StatefulWidget {
  @override
  State<MapSample3> createState() => MapSample3State();
}

late GoogleMapController googleMapController;

class MapSample3State extends State<MapSample3> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  // LocationData? currentLocation;
  double Camlat = 24.7136;
  double Camlng = 46.6753;

  // void getCurrentLocation(){
  //   Location location = Location();
  //
  //   location.getLocation().then((location) {
  //     currentLocation = location;
  //   },);
  // }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 15.4746,
  );


  @override
  void initState(){
    super.initState();
    //getCurrentLocation();

    _setMarker(LatLng(32.294047, -6.709170));
    _originController.text = 'Casablanca';
    _destinationController.text = 'Rabat';
  }


  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('PickUp'),
          position: point,
        ),
      );
      print('Pointer 2 Set');
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
      Get.to(package_place2());
      print('Went to Map2');

    },
  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //       child: Column(
            //         children: [
            //
            //           TextFormField(
            //             controller: _originController,
            //             decoration: InputDecoration(hintText: 'Origin'),
            //             onChanged: (value){
            //               print(value);
            //             },
            //           ),
            //
            //           TextFormField(
            //             controller: _destinationController,
            //             decoration: InputDecoration(hintText: 'Destination'),
            //             onChanged: (value){
            //               print(value);
            //             },
            //           ),
            //
            //           Text(distance,style: TextStyle(fontSize: 20),),
            //         ],
            //       ),
            //     ),
            //         IconButton(onPressed: () async {
            //           var directions = await LocationService().getDirections(_originController.text,_destinationController.text);
            //
            //           setState(() {
            //             _polylines.clear();
            //             _polygons.clear();
            //             distance = directions['distance'];
            //           });
            //
            //
            //          _goToThePlace(
            //              directions['start_location']['lat'],
            //              directions['start_location']['lng'],
            //              directions['bounds_ne'],
            //              directions['bounds_sw'],
            //          );
            //           LocationService().getDirections(_originController.text, _destinationController.text);
            //
            //           _setPolyline(
            //               directions['popyline_decoded']
            //           );
            //
            //         }, icon: Icon(Icons.search))
            //
            //   ],
            // ),

            GoogleMap(
              zoomControlsEnabled: false,
              onTap: (point){
                setState(() {
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

              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                googleMapController = controller ;

              },



            ),

            Container(
              height: 236,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )
              ),
              child:

              Padding(
                padding: const EdgeInsets.all(33.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 77,
                      alignment: Alignment.centerLeft,

                      decoration: BoxDecoration(
                        color: Color(0xffEEEEEE),
                        borderRadius: BorderRadius.all(
                            Radius.circular(13.0)),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    //Title
                                    Text('Makah Al Mukarama',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff191F28),

                                      ),

                                    ),

                                    //SubText
                                    Text('Northern Ring Road, Makah Al Mukarama',
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
                                padding: const EdgeInsets.only(left: 12.0,right: 14.0,top: 14,bottom: 14),
                                child: Icon(Icons.location_on,size: 28,color: Color(0xff1877F2),
                                ),
                              ),

                            ],
                          ),

                          Container(width: MediaQuery.of(context).size.width-67)

                        ],
                      ),
                    ),

                    //Next Button
                    Next('أختر المكان'),

                  ],
                ),
              ),




            ),



          ],
        ),
      ),
      floatingActionButton: location_bool ? Container(
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
              onPressed: (){
                Get.to(pickupPlace());
              },
              elevation: 0,
              backgroundColor: Colors.white,
              child: Image.asset('assets/pics/arrow.png',width: 16,)
          ),
        ),
      ) : null,

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