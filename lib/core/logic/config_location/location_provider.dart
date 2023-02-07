import 'package:flutter/material.dart';
 import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class LocationProvider extends ChangeNotifier {

  Position? currentLocation;
  LatLng ?myLocation ;




  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    currentLocation = await Geolocator.getCurrentPosition().then((value) async {
       myLocation = LatLng(value.latitude, value.longitude);
       print(myLocation);
       print(myLocation);
    });
    notifyListeners();
  }



//draw polygon
  Set<Polygon> polygonSet = {};
  List<LatLng> polygonCoords = [];


}
