import 'dart:convert';

import 'package:http/http.dart' as http;
import '../others/variables.dart';

class place {
  final String name;

  const place({
  required this.name,
});

  static place fromJson(Map<String,dynamic> json) => place(name: json['description'],);



}

class PlaceApi{
  final String key = 'AIzaSyA8R2ZGRtTqb3ZaPFIGY2nxfWospmbfBTY';
  clearList() {
    // TODO: implement clearList
    throw UnimplementedError();

  }
   Future<List<place>> getUserSuggestions(String query) async {


    final String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&location=$mylat%2C$mylng&radius=8000&key=$key';

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final Map<String, dynamic> all = json.decode(response.body);

      // print(places['predictions'][0]['description']);

      final List places = all['predictions'];

      print(places[0]['description']);
      print(places[0]['structured_formatting']['main_text']);


      return places.map((json) => place.fromJson(json)).toList();
    } else
      throw Exception();
   }
}