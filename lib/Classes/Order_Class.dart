//Orders Class

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Order{

  String ID;

  double Distance;
  double Price;

  Driver driver;
  String OrigineName;
  String OrigineDesc;

  String DestName;
  String DestDesc;

  String clientID;

  // 01/07/2022
  int Date;


  // id , name , trailer , trailer type , loadtype
  Ordertruck Truck;


  LatLng Originelatlng;
  LatLng Destilatlng;

  //Rating Data
  DriverRating driverRating;

  // Single Delivery A to B , MultiPickUp A , B , C to D , MultiDeliver A to B, C , D
  String Type;

  // انتظار الرد ,  مقبولة  ,   مرفوضة ,   مكتملة  ,   تتبع
  // Pending , Delivered , Canceled , Accepted , Waiting

  String Status; //(other options might be added later)

  Order(
      this.ID,this.Distance,this.clientID,this.OrigineName,this.OrigineDesc,
      this.DestName,this.DestDesc,this.Truck,this.Price,this.driver,
      this.driverRating,this.Date,this.Destilatlng,this.Originelatlng,this.Type,
      this.Status
      );

  //Say status In arabic
  String SayStatus(){
    switch(this.Status) {
      case "Pending": {  return"تتبع"; }

      case "Delivered": {  return"مكتملة"; }

      case "Canceled": {  return"مرفوضة"; }

      case "Accepted": {  return"مقبولة"; }

      case "Waiting": {  return"انتظار الرد"; }

      default: { return this.Status; }
    }
  }

  //Return Colors Depending on the status
  Color StatusColor(){
    switch(this.Status) {
      case "Pending": {  Color(0xff015FF5); }
      break;

      case "Delivered": {  Color(0xff2FBF71); }
      break;

      case "Canceled": {  Colors.red; }
      break;

      case "Accepted": {  Color(0xff191F28); }
      break;

      case "Waiting": {  Colors.purple; }
      break;

      default: { return Colors.black; }
    }

    return Colors.black;
  }

}


//Used In Orders
class Ordertruck{

  int id;

  String name;

  // ALX , AA19 , BIG
  String trailer;

  // ALX , AA19 , BIG for now
  String trailertype;

  // Liquid , Snow , Dry
  String loadtype;

  Ordertruck(this.id, this.name, this.trailer, this.trailertype, this.loadtype);
}

//Order used in the setup
class OrderSetup{
  String id;
  String Status;

  List<Place> places;

  double Price;
  double Distance;

  Driver driver;

  OrderSetup(this.id, this.Status, this.places, this.Price, this.Distance,
      this.driver);
}

//Places Class for order Setup
class Place{
  int Position;
  String Name;
  String Description;

  //Origine , Destination , PickUp, Delivery
  String Type;

  LatLng latlng;

  Place(this.Position,this.Name, this.Description, this.Type, this.latlng);
}

//
class Driver{
  String id;
  String name;
  String description;
  String picture;

  truck TruckInfo;

  Driver(this.id, this.name, this.description, this.picture, this.TruckInfo);
}

class truck{
  String pic;
  String name;
  String plate;
  String license;

  truck(this.pic, this.name, this.plate, this.license);
}

class DriverRating{
  String Total;
  String Base;

  double FiveStars;
  double FourStars;
  double ThreeStars;
  double TwoStars;
  double OneStar;

  DriverRating(this.Total, this.Base, this.FiveStars, this.FourStars,
      this.ThreeStars, this.TwoStars, this.OneStar);
}

//Route Data
class OrderRoute{

  List<PointLatLng> Dummy;
  Map<String, dynamic> bounds_ne;
  Map<String, dynamic> bounds_sw;
  double dmlat;
  double dmlng;
  String OrPoint;
  String DesPoint;

  OrderRoute(this.Dummy, this.bounds_ne, this.bounds_sw, this.dmlat, this.dmlng, this.OrPoint, this.DesPoint);
}

//Tmp fix for orderMapV2
Map<String, dynamic> bounds_nee = {};
Map<String, dynamic> bounds_sww = {};

