import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../others/variables.dart';

class LocationService {
  final String key = 'AIzaSyA8R2ZGRtTqb3ZaPFIGY2nxfWospmbfBTY';

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    print(url);
    print(input);
    print('inputinput');
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    //print(results);

    return results;
  }

  Future<List<dynamic>> getPlaceV2(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    //print(results);
    var name = results['address_components'][0]['long_name'];
    var FullName = results['address_components'][1]['long_name'];
    var Orlat = results['geometry']['location']['lat'];
    var Orlng = results['geometry']['location']['lng'];
    LatLng latlng = LatLng(Orlat, Orlng);

    return [name, FullName, latlng];
  }

  Future<List<String>> getPlaceNameFullName(String input) async {
    final placeId = await getPlaceId(input);
    print(placeId);
    print('youssef');
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    print(results);
    print('yyyyyyyyy');
    var name = results['address_components'][0]['short_name'];
    var FullName = results['address_components'][1]['long_name'];
    var lat = results['geometry']['location']['lat'];
    var lang = results['geometry']['location']['lng'];
    print(results['geometry']['location']);
    print(name);

    print('yyyyyyyyy');
    LatPoint = lat.toString() ;
        langPoint =  lang.toString();
        print(LatPoint);
    return [name, FullName,LatPoint,langPoint];
  }


  Future<Map<String, dynamic>> getPlace2(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    //print(results);

    return results;
  }

  Future<List<dynamic>> getPlaceV1(String input) async {
    final placeId = await getPlace2(input);
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    //print(results);
    var name = results['address_components'][0]['long_name'];
    var FullName = results['address_components'][1]['long_name'];
    var Orlat = results['geometry']['location']['lat'];
    var Orlng = results['geometry']['location']['lng'];
    LatLng latlng = LatLng(Orlat, Orlng);

    return [name, FullName, latlng];
  }

  Future<List<String>> getPlaceNameFullName2(String input) async {
    final placeId = await getPlaceId(input);
    print(placeId);
    print('youssef');
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    print(results);
    print('yyyyyyyyy');
    var name2 = results['address_components'][0]['short_name'];
    var FullName2 = results['address_components'][1]['long_name'];
    var lat2 = results['geometry']['location']['lat'];
    var lang2 = results['geometry']['location']['lng'];
    print(results['geometry']['location']);
    print(name);

    print('yyyyyyyyy');
    LatPoint2 = lat2.toString() ;
    langPoint2 =  lang2.toString();
    print(LatPoint);
    return [name2, FullName2,LatPoint,langPoint];
  }

  Future<Map<String, dynamic>> getDirections(
      String origin, String destination) async {
    final String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    print('Function Started');
    print('I Send origine = $origin and destination = $destination');

    print('=========================================================');
    print(json['status']);
    print('=========================================================');

    print(json);

    if (json['status'] != 'ZERO_RESULTS') {
      print('Journey full');
      var results = {
        //Setting journey parameters
        "status": true,
        "bounds_ne": json['routes'][0]['bounds']['northeast'],
        "distance": json['routes'][0]['legs'][0]['distance']['text'],
        "bounds_sw": json['routes'][0]['bounds']['southwest'],
        "start_location": json['routes'][0]['legs'][0]['start_location'],
        "end_location": json['routes'][0]['legs'][0]['end_location'],
        "polyline": json['routes'][0]['overview_polyline']['points'],
        "popyline_decoded": PolylinePoints()
            .decodePolyline(json['routes'][0]['overview_polyline']['points']),
      };

      return results;
    } else {
      print('journey Empty');
      var results = {
        //Setting journey parameters
        "status": false,
        "bounds_ne": '',
        "distance": 'notfound',
        "bounds_sw": '',
        "start_location": '',
        "end_location": '',
        "polyline": '',
        "popyline_decoded": '',
      };

      return results;
    }
  }
}
