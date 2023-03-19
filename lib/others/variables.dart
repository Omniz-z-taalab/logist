import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Colors

//Backgrounds Colors

Color background = const Color(0xffFFFFFF); // Main App background Color
Color Sbackground = const Color(0xffFFFFFF); // Setting background Color
Color Obackground = const Color(0xffFFFFFF); // Orders background Color
Color Pbackground = const Color(0xffF5F8FC); // Profile background Color
Color Cbackground = const Color(0xfffafbfb); // Conversations background Color
Color Lbackground = const Color(0xfffafbfb); // Languages background Color

Color On = const Color(0xff191F28); // Active Button Color

Color Off = const Color(0xff30363E); // Disabled Button Color

Color fill = const Color(0xffF3F3F3); //TextField Color

Color Cerror = const Color(0xffCC4F1E); //Text Error Color

Color Confirme = const Color(0xff1877F2); //Confirmation Button Color

Color Berror = const Color(0xffCC4F1E); // Border Error Color

Color Stext = const Color(0xff121212); // Settings font Color

Color ATcolor = const Color(0xff191F28); //Appbar text Color

Color PTcolor = const Color(0xff868686);

//Text
String Sname = '';

//Others
bool verife = false;

//TextStyles

//settings tabs Text
TextStyle settingstab = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 13,
  color: Stext,
  fontWeight: FontWeight.w400,
);

//Profile title Text
TextStyle PTstyle = TextStyle(
  fontSize: 12,
  fontFamily: 'Shamel',
  color: PTcolor,
);

//Floating button Parameter
bool location_bool = false;

double Distance = 0;

//Map
double dmlat = 0.0;
double dmlng = 0.0;
Map<String, dynamic> bounds_ne = {};
Map<String, dynamic> bounds_sw = {};

double Orlat = 0.0;
double Orlng = 0.0;

double dslat = 0.0;
double dslng = 0.0;

String Start = 'Royal mall ryadh';
String StartId = '';
String end = 'Ryadh Gallery Mall';
String endId = '';
List<PointLatLng> Dummy = [];

//Sliding Panel Param
int _currentid = 10;
double minHe = 0;
double maxHe = 0;

//Controllers
// final panelController = PanelController();

//Maps related functions/variables
Set<Marker> _markers = Set<Marker>();

//Origin Address
List<String> Origine = [];
List<String> Destination = [];

String LatPoint = '';
String LatPoint2 = '';
String langPoint = '';
String langPoint2= '';
String DesPoint = '';

//Distance
String distance = '';

//Location Variables

double? mylat = 24.79131;
double? mylng = 46.6753;

//storage variables
String? AppUserID = '';
String? phonenum = '';
String? name = 'A';

//Get User ID
void getUserID() {
  final box = GetStorage();
  AppUserID = box.read('UserID');
}

void getUsername() {
  final box = GetStorage();
  name = box.read('Username');
}

void getUserphone() {
  final box = GetStorage();
  phonenum = box.read('Userphone');
}

//Set User ID
void setUserID(value) {
  final box = GetStorage();
  box.write('UserID', value);
}

void setUsername(value) {
  final box = GetStorage();
  box.write('Username', value);
}

void setUserphone(value) {
  final box = GetStorage();
  box.write('Userphone', value);
}

//Delete User id

void deletUserID() {
  final box = GetStorage();
  box.remove('UserID');
}

void deletUsername() {
  final box = GetStorage();
  box.remove('Username');
}

void deletUserphone() {
  final box = GetStorage();
  box.remove('Userphone');
}

//Purchaces Class

class Cart {
  String? Type;
  int? Days;
  int? Validity;
  int? Price;
  Cart(this.Type, this.Days, this.Validity, this.Price);
}

//Credit card Class
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = new StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: new TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

//Order Related Variables

List<String> trShape = []; //Name + icon path
List<String> trType = []; //same
List<String> loadType = []; //same
String note = ''; //same
List<String> time = []; //'07.04.2022', '15:45', 'AM'

//For Demonstration (lkhdma lm3awda)

//Shape
List<String> trShape1 = ['شاحنه مفتوحة من جانب', 'trOPEN'];
List<String> trShape2 = ['شاحنه شبك', 'Bigtr'];
List<String> trShape3 = ['شاحنه مغلقة', 'trALX'];
//Type
List<String> trType1 = ['شاحنة جافة', 'Dry'];
List<String> trType2 = ['شاحنة مثلجة', 'Snow'];
List<String> trType3 = ['شاحنه مبردة', 'Aired'];
//LoadType
List<String> loadType1 = ['حمولة اطعمة', 'food'];
List<String> loadType2 = ['حمولة حديد ', 'metal'];
List<String> loadType3 = ['حمولة بضائع', 'package'];
List<String> loadType4 = ['حمولة مواشي', 'cattle'];
//Driver Details
List<String> driverData1 = [
  'محمد احمد',
  ' Ford F-Series Super Duty',
  'assets/pics/user5.png',
  '1.0',
  '71'
];
List<String> driverData2 = [
  'هيثم  بن الحسين',
  'Ford Ranger',
  'assets/pics/user6.png',
  '4.0',
  '310'
];
List<String> driverData3 = [
  'عبد المجيد سعيد',
  ' Ford F-150',
  'assets/pics/user2.png',
  ' 4.5',
  '61'
];
List<String> driverData4 = [
  'مصطفى نجيب',
  ' Chevrolet Silverado 1500',
  'assets/pics/user5.png',
  '4.3',
  '192'
];

//Order Driver Details
List<String> driverData =
    []; //Name + Description + pic name + rating + reviews num
List<String> Rating = []; //5 stars, 4 stars , 3 Stars , 2 Stars , 1 Star

