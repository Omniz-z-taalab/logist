import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logist/others/location_user_2.dart';

import '../../others/PickupPlace2.dart';
import '../../others/variables.dart';
import '../../widgets/Location_service.dart';
import '../../widgets/SearchAPI.dart';

class pickdownPlace extends StatefulWidget {
  var Lat;
  var Lng;
  String noteText;
  int PayloadText;
  List<String> TimeNum;
  List<String> TimeEnd;
  String Trtext;
  int Typetext;
  String placeuserpick1;
  String placeuserdown1;
  int vicleId;
  int trilerId;

  pickdownPlace(
      this.Lat,
      this.Lng,
      this.noteText,
      this.PayloadText,
      this.TimeNum,
      this.TimeEnd,
      this.Trtext,
      this.Typetext,
      this.placeuserpick1,
      this.placeuserdown1,
      this.vicleId,
      this.trilerId);
  @override
  State<pickdownPlace> createState() => _pickdownPlaceState();
}

class _pickdownPlaceState extends State<pickdownPlace> {
  final String key = 'AIzaSyA8R2ZGRtTqb3ZaPFIGY2nxfWospmbfBTY';
  Future<List<place>> getUserSuggestions(String query) async {
    places.clear();
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&location=$mylat%2C$mylng&radius=8000&key=$key';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> all = json.decode(response.body);

      final List places = all['predictions'];

      //addPlace(places[0]['description'],places[0]['structured_formatting']['main_text']);

      int i = 0;

      places.forEach((element) {
        if (i < 7) {
          print(i);
          print(element['description']);
          addPlace(element['description'],
              element['structured_formatting']['main_text']);
        }
        i++;
      });
      i = 0;
      return places.map((json) => place.fromJson(json)).toList();
    } else
      throw Exception();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          'assets/pics/logo.png',
          width: 82,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                    bottom: 10,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Image.asset(
                          'assets/pics/powered.png',
                          width: 139,
                          height: 19,
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 258,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TypeAheadField<place?>(
                            minCharsForSuggestions: 3,
                            suggestionsCallback: getUserSuggestions,
                            itemBuilder: (context, place? suggestion) {
                              //clearList();
                              return Container(height: 0, width: 0);
                            },
                            onSuggestionSelected: (place? suggestion) async {
                              final place = suggestion!;

                              //Get name And Subtitle address
                              Origine = await LocationService()
                                  .getPlaceNameFullName(place.name);
                              //  OrPoint;
                              // Get.to(package_place());
                              //Go to the Second page
                            },
                            textFieldConfiguration: TextFieldConfiguration(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(46),
                                        borderSide: BorderSide.none),
                                    hintText: 'ادخل عنوان التحميل',
                                    hintTextDirection: TextDirection.rtl,
                                    hintStyle: TextStyle(
                                      color: Color(0xffC0C0C0),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffFBFBFB))),
                          ),
                          pickupMapButton(),
                          SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: Container(color: Color(0xffF1F1F1)),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  locationList(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  var place1;
  var place2;
  List<List<String>> places = [];

  Widget locationList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: places.length,
      itemBuilder: (context, i) {
        return places.length != 0
            ? ListTile(
                trailing: Image.asset(
                  'assets/pics/blackMarker.png',
                  width: 21,
                  height: 28,
                ),
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
                onTap: () async {
                  //print(places.length);
                  place1 = places[i][0];
                  place2 = places[i][1];
                  //Get name And Subtitle address
                  // var results = await LocationService()
                  //     .getPlaceNameFullName2(places[i][0]);
                  // setState(() {
                  //   Destination= results;
                  // });
                  var results = await LocationService()
                      .getPlaceNameFullName(places[i][0]);

                  Destination = [place1, place2];
                  // Destination = [results[0], results[1]];

                  Get.to(
                    () => package_place2(
                      widget.Lat,
                      widget.Lng,
                      results[2],
                      results[3],
                      widget.noteText,
                      widget.PayloadText,
                      widget.TimeNum,
                      widget.TimeEnd,
                      widget.Trtext,
                      widget.Typetext,
                      widget.placeuserpick1,
                      widget.placeuserdown1,
                      place1,
                      place2,
                      widget.vicleId,
                      widget.trilerId,
                    ),
                  ); //Go to the Second page

                  //print(places.length);
                },
              )
            : Container(height: 0, width: 0);
      },
    );
  }

  void addPlace(String city, String Local) {
    if (places.length < 7)
      setState(() {
        places.add([city, Local]);
      });
    else
      clearList();
  }

  void clearList() {
    setState(() {
      places.clear();
    });
  }

  //Pickup Map
  Widget pickupMapButton() {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              flex: 4,
              child: Text(
                'تحديد الموقع على الخريطة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'ArabotoFat',
                ),
              ),
            ),
            Expanded(
                child: Image.asset(
              'assets/pics/maps.png',
              width: 36,
              height: 36,
            )),
          ],
        ),
      ),
      onTap: () {
        //Use Map search Instead
        Get.to(
            () => LocationUser2(
                widget.Lat,
                widget.Lng,
                widget.noteText,
                widget.PayloadText,
                widget.TimeNum,
                widget.TimeEnd,
                widget.Trtext,
                widget.Typetext,
                widget.placeuserpick1,
                widget.placeuserdown1,
                widget.vicleId,
                widget.trilerId),
            transition: Transition.rightToLeft);
      },
    );
  }
}
