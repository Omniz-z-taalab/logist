// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart' as itl;
// import 'package:provider/provider.dart';
// import '../../core/logic/viecles/viecles_provider.dart';
// import '../../models/viecelModel/viecleModel.dart';
// import '../../models/viecle_model.dart';
// import '../../others/variables.dart';
// import 'package:flutter/cupertino.dart';
// import '../My_orders/ChooseDriver.dart';
// import '../My_orders/Details.dart';
// import '../Navigation_bar/PickupPlace.dart';
// import '../Payments/PaymentSucess.dart';
// import '../../widgets/PanelWidget.dart';
// import 'package:numberpicker/numberpicker.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// class chooseExtentions extends StatefulWidget {
//   Viecle data;
//   // var latU1;
//   // var lngU1;
//   // var latU2;
//   // var lngU2;
//   chooseExtentions(this.data);
//
//   @override
//   State<chooseExtentions> createState() => _chooseExtentionsState();
// }
//
// class _chooseExtentionsState extends State<chooseExtentions> {
//   List<viecleModel>? viecle;
// int? trilerId;
//   @override
//   void initState() {
//     Provider.of<VieclesProvider>(context, listen: false)
//         .getViecle(); // TODO: implement initState
//     viecle = context.read<VieclesProvider>().viecles;
//     super.initState();
//     trilerId = widget.data.id;
//     print(widget.data.id);
//     // latU1 = widget.latU1;
//   }
//       String? vicle;
//       int? vicleId;
//   double HeadOpacity = 0;
//
//   final formKey = GlobalKey<FormState>();
//
//   DateRangePickerController _datePickerController = DateRangePickerController();
//
//   //Functions
//
//   //Last Height Function
//   double lastButtonHeight() {
//     if (MediaQuery.of(context).size.height > 828) {
//       return MediaQuery.of(context).size.height * 0.14;
//     } else if (MediaQuery.of(context).size.height > 700) {
//       return MediaQuery.of(context).size.height * 0.05;
//     } else {
//       return MediaQuery.of(context).size.height * 0.02;
//     }
//   }
//
//   //Last Height Function
//   double timeButtonHeight() {
//     if (MediaQuery.of(context).size.height > 800) {
//       return MediaQuery.of(context).size.height * 0.1;
//     } else if (MediaQuery.of(context).size.height > 700) {
//       return MediaQuery.of(context).size.height * 0.04;
//     } else {
//       return MediaQuery.of(context).size.height * 0.00;
//     }
//   }
//
//   //Last Height Function
//   double typeButtonHeight() {
//     if (MediaQuery.of(context).size.height > 800) {
//       return MediaQuery.of(context).size.height * 0.03;
//     } else if (MediaQuery.of(context).size.height > 700) {
//       return MediaQuery.of(context).size.height * 0.01;
//     } else {
//       return MediaQuery.of(context).size.height * 0.02;
//     }
//   }
//
//   final _noteText = TextEditingController();
//
//   //Variables
//   int _trShape = 10;
//   int _trType = 10;
//   int _payload = 10;
//   int _time = 10;
//   int _date = 10;
//   int _note = 10;
//   String TheNote = '';
//   bool AllSelected = false;
//   bool TextError = false;
//
//   final now = new DateTime.now();
//
//   late int Currenthour = int.parse(itl.DateFormat('H').format(now));
//   late int Currentminute = int.parse(itl.DateFormat('m').format(now));
//
//   late int hour = int.parse(itl.DateFormat('H').format(now));
//   late int minute = int.parse(itl.DateFormat('m').format(now));
//
//   late String year = now.year.toString();
//   late int month = now.month;
//   late int day = now.day;
//
//   double MaxHe = 450;
//   String ParaType = '';
//   final panelController = PanelController();
//   bool isfull = false;
// int? VecleId;
//   String TitleNote(String note, {int limit = 30}) {
//     return note.length >= limit ? note.substring(0, limit) + '...' : note;
//   }
//
//   //Truck Shape Functions
//   String Tricon(int choice) {
//     if (choice == 0) {
//       return viecle![0].sPic!;
//     } else if (choice == 1) {
//       return viecle![1].sPic!;
//     } else if (choice == 2) {
//       return viecle![2].sPic!;
//     } else {
//       return 'IconTruck';
//     }
//   }
//
//   int num = 0;
//
//   String Trtext(int choice) {
//     if (choice == 0) {
//       setState(() {
//         num = 1;
//       });
//
//       return viecle![0].sName!;
//     } else if (choice == 1) {
//       setState(() {
//         num = 2;
//       });
//       return viecle![1].sName!;
//     } else if (choice == 2) {
//       setState(() {
//         num = 3;
//       });
//       return viecle![2].sName!;
//     } else {
//       return 'شكل الشاحنة';
//     }
//   }
//
//   //Truck type funtcionts
//   String TypeIcon(int choice) {
//     if (choice == 0) {
//       return 'Aired';
//     } else if (choice == 1) {
//       return 'Snow';
//     } else if (choice == 2) {
//       return 'Dry';
//     } else {
//       return 'IconTruCkFront';
//     }
//   }
//
//   String Typetext(int choice) {
//     if (choice == 0) {
//       return 'شاحنه مبردة';
//     } else if (choice == 1) {
//       return 'شاحنة مثلجة';
//     } else if (choice == 2) {
//       return 'شاحنة جافة';
//     } else {
//       return 'نوع الشاحنة';
//     }
//   }
//
//   //Payload Type funtions
//   String payloadIcon(int choice) {
//     if (choice == 0) {
//       return 'med';
//     } else if (choice == 1) {
//       return 'food';
//     } else if (choice == 2) {
//       return 'metal';
//     } else if (choice == 3) {
//       return 'package';
//     } else if (choice == 4) {
//       return 'cattle';
//     } else if (choice == 5) {
//       return 'others';
//     } else {
//       return 'IconOrder';
//     }
//   }
//
//   String PayloadText(int choice) {
//     if (choice == 0) {
//       return 'حمولة أدوية';
//     } else if (choice == 1) {
//       return 'حمولة اطعمة';
//     } else if (choice == 2) {
//       return 'حمولة حديد ';
//     } else if (choice == 3) {
//       return 'حمولة بضائع';
//     } else if (choice == 4) {
//       return 'حمولة مواشي';
//     } else if (choice == 5) {
//       return 'خاص (أخرى)';
//     } else {
//       return 'نوع الحمولة';
//     }
//   }
//
//   //Time Functions
//   Object TimeText(int choice) {
//     if (choice == 10) {
//       return 'التوقيت';
//     } else {
//       return '';
//     }
//   }
//
//   String TimeIcon(int choice) {
//     if (choice == 10) {
//       return 'IconTime';
//     } else {
//       return 'StrongTime';
//     }
//   }
//
//   bool TimeNum(int choice) {
//     if (choice == 10) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   //Note Functions
//   String NoteText(int choice) {
//     if (choice == 10 || TheNote.isEmpty) {
//       return 'ملاحظة للسائق';
//     } else if (choice == 3) {
//       setState(() {
//         botton = true;
//       });
//       return TheNote;
//     }
//     setState(() {
//       botton = true;
//     });
//     print(botton);
//     print('eeeeeeeeeee');
//     return TheNote;
//   }
//
//   String NoteIcon(int choice) {
//     if (choice == 10 || TheNote.isEmpty) {
//       return 'IconTime';
//     } else {
//       return 'StrongTime';
//     }
//   }
//
//   bool Notearrow(int choice) {
//     if (choice == 10) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   bool? botton = false;
//
//   //Arrow Option
//   bool Trarrow(int choice) {
//     if (choice == 10) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   //Time Correction function
//   String Fhour(int hour) {
//     if (hour < 10) {
//       return '0' + hour.toString();
//     } else {
//       return hour.toString();
//     }
//   }
//
//   String Fminute(int minute) {
//     if (minute < 10) {
//       return '0' + minute.toString();
//     } else {
//       return minute.toString();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //Time Selection Option
//     void pickValue() {
//       showDialog<int>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(21.0))),
//               content: StatefulBuilder(builder: (context, SBsetState) {
//                 return Container(
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(21)),
//                   alignment: Alignment.center,
//                   height: 290,
//                   width: 378,
//                   child: InkWell(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         //Hour - minute text
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             const Text(
//                               'الساعة',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'Araboto',
//                                 color: Color(0xff868686),
//                               ),
//                             ),
//                             const Text(
//                               'الدقيقة',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'Araboto',
//                                 color: Color(0xff868686),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         //Hour - minute Slider
//                         Row(
//                           children: [
//                             //Hour Slider
//                             Expanded(
//                               child: NumberPicker(
//                                   selectedTextStyle: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 76,
//                                       fontFamily: 'circular std'),
//                                   textStyle: const TextStyle(
//                                       color: Color(0xffB9B9B9),
//                                       fontSize: 64,
//                                       fontFamily: 'circular std'),
//                                   value: hour,
//                                   minValue: 00,
//                                   maxValue: 23,
//                                   step: 1,
//                                   zeroPad: true,
//                                   infiniteLoop: true,
//                                   itemHeight: 80,
//                                   itemWidth: double.infinity,
//                                   itemCount: 3,
//                                   onChanged: (value) {
//                                     setState(() => hour =
//                                         value); // to change on widget level state
//                                     SBsetState(() => hour =
//                                         value); //* to change on dialog state
//                                   }),
//                             ),
//
//                             //Minute Slider
//                             Expanded(
//                               child: NumberPicker(
//                                   selectedTextStyle: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 76,
//                                       fontFamily: 'circular std'),
//                                   textStyle: const TextStyle(
//                                       color: Color(0xffB9B9B9),
//                                       fontSize: 64,
//                                       fontFamily: 'circular std'),
//                                   value: minute,
//                                   minValue: 00,
//                                   maxValue: 59,
//                                   step: 1,
//                                   zeroPad: true,
//                                   infiniteLoop: true,
//                                   itemHeight: 80,
//                                   itemWidth: double.infinity,
//                                   itemCount: 3,
//                                   onChanged: (value) {
//                                     setState(() => minute =
//                                         value); // to change on widget level state
//                                     SBsetState(() => minute =
//                                         value); //* to change on dialog state
//                                   }),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     onTap: () {
//                       Get.back();
//                     },
//                   ),
//                 );
//               }),
//               actions: [],
//             );
//           });
//     }
//
//     //Date Selection Function
//     void _onDateSelectionChanged(
//         DateRangePickerSelectionChangedArgs
//             dateRangePickerSelectionChangedArgs) {
//       setState(() {
//         year = dateRangePickerSelectionChangedArgs.value.year.toString();
//         month = dateRangePickerSelectionChangedArgs.value.month;
//         day = dateRangePickerSelectionChangedArgs.value.day;
//       });
//       print(year + ',' + month.toString() + ',' + day.toString());
//     }
//
//     //Options Tab
//     Widget Options(String title, String Icon, bool selected) {
//       return Container(
//         width: double.infinity,
//         height: 54,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//                 height: 24,
//                 width: 24,
//                 alignment: Alignment.center,
//                 child: Container()),
//             Expanded(
//                 child: Text(
//               title,
//               textAlign: TextAlign.end,
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w300,
//                   color: Color(0xff191F28)),
//             )),
//             // Padding(
//             //   padding: const EdgeInsets.only(right: 9, left: 16),
//             //   child:
//             //       Image.asset( 'assets/pics/$Icon.png', width: 24, height: 24),
//             // ),
//           ],
//         ),
//       );
//     }
//     Widget vicles(List<viecleModel> vicle) {
//       return Column(
//         children: [
//           SizedBox(
//             height: 900,
//             child: ListView.builder(
//               itemCount: vicle!.length,
//               itemBuilder:(context,index) =>     Container(
//                 width: double.infinity,
//                 height: 54,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                         height: 24,
//                         width: 24,
//                         alignment: Alignment.center,
//                         child: Container()),
//                     Expanded(
//                         child: Text(   viecle![index].sName! ,
//                           textAlign: TextAlign.end,
//                           style: const TextStyle(
//                               fontSize: 14,
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.w300,
//                               color: Color(0xff191F28)),
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 9, left: 16),
//                       child:
//                           Image.network( vicle![index].sPic!, width: 24, height: 24),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(25.0),
//           //   child: MaterialButton(
//           //     color: Color(0xff42484F),
//           //     minWidth: double.infinity,
//           //     height: 60,
//           //     shape: RoundedRectangleBorder(
//           //       borderRadius: BorderRadius.circular(100.0),
//           //     ),
//           //     child: Container(
//           //       child: Text(
//           //         'متابعه',
//           //         style: const TextStyle(
//           //           fontSize: 16,
//           //           color: Colors.white,
//           //           fontFamily: 'Montserrat',
//           //           fontWeight: FontWeight.w500,
//           //         ),
//           //       ),
//           //     ),
//           //     onPressed: () {
//           //       //Button destination
//           //       // vicle = Trtext(_trShape) as List<viecleModel>;
//           //       // if(vicle! == 'v-one'){
//           //       //   vicleId = 1;
//           //       // }else if(vicle! == 'v-tow'){
//           //       //   vicleId = 3;
//           //       // }else{
//           //       //   vicleId = 4;
//           //
//           //       // }
//           //       print(vicle);
//           //       print(vicleId.toString());
//           //       print('[][][[][][[]][[][][][][]][');
//           //       setState(() {
//           //         if (ParaType == 'time') {
//           //           _time = 1;
//           //           time = [
//           //             '${Fhour(day)}.${Fhour(month)}.$year',
//           //             '${Fhour(hour)}:${Fminute(minute)}',
//           //             ''
//           //           ];
//           //         } else if (ParaType == 'trShape') {
//           //           trShape = [Trtext(_trShape), Tricon(_trShape)];
//           //         } else if (ParaType == 'TRtype') {
//           //           trType = [Typetext(_trType), TypeIcon(_trType)];
//           //         } else if (ParaType == 'payload') {
//           //           loadType = [PayloadText(_payload), payloadIcon(_payload)];
//           //         } else if (ParaType == 'note') {
//           //           if (formKey.currentState!.validate()) {
//           //             note = _noteText.text;
//           //             //Test
//           //             TheNote = TitleNote(note, limit: 35);
//           //             //print('All good');
//           //           } else {
//           //             //print('Something Wrong');
//           //             return null;
//           //           }
//           //         }
//           //         panelController.isPanelOpen ? panelController.close() : null;
//           //       });
//           //     },
//           //   ),
//           // )
//         ],
//       );
//     }
//
//     //Time Options Tab
//     Widget OptionsTime(
//         Object title, String Icon, bool selected, DateTime date) {
//       return Container(
//         width: double.infinity,
//         height: 54,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//                 height: selected ? 24 : 60,
//                 width: selected ? 24 : 60,
//                 alignment: Alignment.center,
//                 child: selected
//                     ? Image.asset(
//                         'assets/pics/SmallLeftArrow.png',
//                         width: 12,
//                         height: 12,
//                       )
//                     : Text(
//                         '${Fhour(hour)}:${Fminute(minute)}',
//                         style: const TextStyle(
//                             fontSize: 14, fontFamily: 'visbydemibold'),
//                       )),
//             selected
//                 ? Container()
//                 : Text('/${Fhour(day)}.${Fhour(month)}.$year',
//                     style: const TextStyle(
//                         fontSize: 14, fontFamily: 'visbydemibold')),
//             Expanded(
//                 child: Text(
//               title.toString(),
//               textAlign: TextAlign.end,
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w300,
//                   color: Color(0xff191F28)),
//             )),
//             Padding(
//               padding: const EdgeInsets.only(right: 9, left: 16),
//               child:
//                   Image.asset('assets/pics/$Icon.png', width: 24, height: 24),
//             ),
//           ],
//         ),
//       );
//     }
//
//     //Button
//     Widget Next(String par) => MaterialButton(
//           color: Color(0xff42484F),
//           minWidth: double.infinity,
//           height: 60,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100.0),
//           ),
//           child: Container(
//             child: Text(
//               par,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           onPressed: () {
//             //Button destination
//             vicle = Trtext(_trShape);
//             if(vicle! == 'v-one'){
//               vicleId = 1;
//             }else if(vicle! == 'v-tow'){
//               vicleId = 3;
//             }else{
//               vicleId = 4;
//
//             }
//             print(vicle);
//             print(vicleId.toString());
//             print('[][][[][][[]][[][][][][]][');
//             setState(() {
//               if (ParaType == 'time') {
//                 _time = 1;
//                 time = [
//                   '${Fhour(day)}.${Fhour(month)}.$year',
//                   '${Fhour(hour)}:${Fminute(minute)}',
//                   ''
//                 ];
//               } else if (ParaType == 'trShape') {
//                 trShape = [Trtext(_trShape), Tricon(_trShape)];
//               } else if (ParaType == 'TRtype') {
//                 trType = [Typetext(_trType), TypeIcon(_trType)];
//               } else if (ParaType == 'payload') {
//                 loadType = [PayloadText(_payload), payloadIcon(_payload)];
//               } else if (ParaType == 'note') {
//                 if (formKey.currentState!.validate()) {
//                   note = _noteText.text;
//                   //Test
//                   TheNote = TitleNote(note, limit: 35);
//                   //print('All good');
//                 } else {
//                   //print('Something Wrong');
//                   return null;
//                 }
//               }
//               panelController.isPanelOpen ? panelController.close() : null;
//             });
//           },
//         );
//
//     Widget Confirm(String par) => MaterialButton(
//           color: botton == true ? On : Color(0xff42484F),
//           minWidth: double.infinity,
//           height: 60,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100.0),
//           ),
//           child: Container(
//             child: Text(
//               par,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           onPressed: () {
//             //Button destination
//
//             print(MediaQuery.of(context).size.height);
//             print(MediaQuery.of(context).size.width);
//             if (_time != 10 &&
//                 _payload != 10 &&
//                 _trType != 10 &&
//                 _trShape != 10) {
//               Get.to(
//                 () => pickupPlace(TheNote, time, _payload, _trType, vicle!,vicleId!,trilerId!),
//                 transition: Transition.rightToLeft,
//               );
//             }
//           },
//         );
//
//     //Slide Up panel content
//     Widget Type(String type) {
//       if (type == 'trShape') {
//         return ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 33,
//                 right: 33,
//                   top:10,
//                   bottom: 20
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10,bottom: 9),
//                     child: Container(
//                       width: 55,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Column(
//                         children: [
//                           //ListTile
//                           InkWell(
//                             child: AnimatedContainer(
//                               height: 80,
//                               alignment: Alignment.centerLeft,
//                               duration: const Duration(milliseconds: 250),
//                               decoration: BoxDecoration(
//                                 color: _trShape == 0
//                                     ? const Color(0xffEEEEEE)
//                                     : const Color(
//                                         0xffFFFFFF), //Original listtile Color
//                                 //color: Colors.transparent,
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(13.0)),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             //Title
//                                             Text(
//                                               viecle![0].sName! ?? '',
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 fontFamily: 'Montserrat',
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Color(0xff191F28),
//                                               ),
//                                             ),
//
//                                             //SizedBox
//                                             const SizedBox(height: 5),
//
//                                             //SubText
//                                             Text(
//                                               viecle![0].sDesc! ?? '',
//                                               textDirection: TextDirection.rtl,
//                                               style: TextStyle(
//                                                 fontSize: 10,
//                                                 fontFamily: 'Montserrat',
//                                                 fontWeight: FontWeight.w300,
//                                                 color: Color(0xff6C6C6C),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(14.0),
//                                         child: Container(
//                                           width: 55,
//                                           height: 49,
//                                           decoration: const BoxDecoration(
//                                             //color: Colors.transparent,
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(100),
//                                             ),
//                                           ),
//                                           alignment: Alignment.center,
//
//                                           //Image
//                                           child: Image.network(
//                                             viecle![0].sPic!,
//                                             width: 40,
//                                             height: 40,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                       width: MediaQuery.of(context).size.width -
//                                           67)
//                                 ],
//                               ),
//                             ),
//
//
//                             onTap: () {
//                               vicle = Trtext(_trShape);
//                               print(vicle);
//                               setState(() {
//                                 _trShape = 0;
//                               });
//                             },
//                           ),
//
//                           //ListTile
//                           InkWell(
//                             child: AnimatedContainer(
//                               height: 80,
//                               alignment: Alignment.centerLeft,
//                               duration: const Duration(milliseconds: 250),
//                               decoration: BoxDecoration(
//                                 color: _trShape == 1
//                                     ? const Color(0xffEEEEEE)
//                                     : const Color(
//                                         0xffFFFFFF), //Original listtile Color
//                                 //color: Colors.transparent,
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(13.0)),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             //Title
//                                             Text(
//                                               viecle![1].sName! ?? '',
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 fontFamily: 'Montserrat',
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Color(0xff191F28),
//                                               ),
//                                             ),
//
//                                             //SizedBox
//                                             const SizedBox(height: 5),
//
//                                             //SubText
//                                             Text(
//                                               viecle![1].sDesc! ?? '',
//                                               textDirection: TextDirection.rtl,
//                                               style: TextStyle(
//                                                 fontSize: 10,
//                                                 fontFamily: 'Montserrat',
//                                                 fontWeight: FontWeight.w300,
//                                                 color: Color(0xff6C6C6C),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(14.0),
//                                         child: Container(
//                                           width: 55,
//                                           height: 49,
//                                           decoration: const BoxDecoration(
//                                             //color: Colors.transparent,
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(100),
//                                             ),
//                                           ),
//                                           alignment: Alignment.center,
//
//                                           //Image
//                                           child: Image.network(
//                                             viecle![1].sPic!,
//                                             width: 40,
//                                             height: 40,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                       width: MediaQuery.of(context)
//                                           .size
//                                           .width -
//                                           67)
//                                 ],
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 _trShape = 1;
//                               });
//                             },
//                           ),
//
//                           //ListTile
//                           InkWell(
//                             child: AnimatedContainer(
//                               height: 80,
//                               duration: const Duration(milliseconds: 250),
//                               alignment: Alignment.centerLeft,
//                               decoration: BoxDecoration(
//                                 color: _trShape == 2
//                                     ? const Color(0xffEEEEEE)
//                                     : const Color(
//                                         0xffFFFFFF), //Original listtile Color
//                                 //color: Colors.transparent,
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(13.0)),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             //Title
//                                             Text(
//                                               viecle![2].sName! ?? '',
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 fontFamily: 'Montserrat',
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Color(0xff191F28),
//                                               ),
//                                             ),
//
//                                             //SizedBox
//                                             const SizedBox(height: 5),
//
//                                             //SubText
//                                             Text(
//                                               viecle![2].sDesc! ?? '',
//                                               textDirection: TextDirection.rtl,
//                                               style: TextStyle(
//                                                 fontSize: 10,
//                                                 fontFamily: 'Montserrat',
//                                                 fontWeight: FontWeight.w300,
//                                                 color: Color(0xff6C6C6C),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(14.0),
//                                         child: Container(
//                                           width: 55,
//                                           height: 49,
//                                           decoration: const BoxDecoration(
//                                             //color: Colors.transparent,
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(100),
//                                             ),
//                                           ),
//                                           alignment: Alignment.center,
//
//                                           //Image
//                                           child: Image.network(
//                                             viecle![2].sPic!,
//                                             width: 40,
//                                             height: 40,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                       width: MediaQuery.of(context).size.width -
//                                           67)
//                                 ],
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 _trShape = 2;
//                               });
//                             },
//                           ),
//
//                           // const SizedBox(height: 36),
//                         ],
//                       ),
//                       Next('متابعة')
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       } else if (type == 'TRtype') {
//         return ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 33,
//                 right: 33,
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 9, bottom: 6),
//                     child: Container(
//                       width: 50,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                   ),
//                   num == 1
//                       ? Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 //Cold Truck
//                                 //ListTile
//                                 InkWell(
//                                   child: AnimatedContainer(
//                                     duration: const Duration(milliseconds: 250),
//                                     height: 91,
//                                     alignment: Alignment.centerLeft,
//                                     decoration: BoxDecoration(
//                                       color: _trType == 0
//                                           ? const Color(0xffEEEEEE)
//                                           : const Color(
//                                               0xffFFFFFF), //Original listtile Color
//                                       //color: Colors.transparent,
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(13.0)),
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   //Title
//                                                   const Text(
//                                                     'شاحنه مبردة',
//                                                     style: TextStyle(
//                                                       fontSize: 14,
//                                                       fontFamily: 'Montserrat',
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       color: Color(0xff191F28),
//                                                     ),
//                                                   ),
//
//                                                   //SizedBox
//                                                   const SizedBox(height: 5),
//
//                                                   //SubText
//                                                   const Text(
//                                                     'غالبا ما تستخدم لنقل (الطعام)',
//                                                     textDirection:
//                                                         TextDirection.rtl,
//                                                     style: TextStyle(
//                                                       fontSize: 10,
//                                                       fontFamily: 'Montserrat',
//                                                       fontWeight:
//                                                           FontWeight.w300,
//                                                       color: Color(0xff6C6C6C),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(14.0),
//                                               child: Container(
//                                                 width: 55,
//                                                 height: 49,
//                                                 decoration: const BoxDecoration(
//                                                   //color: Colors.transparent,
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                     Radius.circular(100),
//                                                   ),
//                                                 ),
//                                                 alignment: Alignment.center,
//
//                                                 //Image
//                                                 child: Image.asset(
//                                                   'assets/pics/Aired.png',
//                                                   width: 40,
//                                                   height: 40,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Container(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width -
//                                                 67)
//                                       ],
//                                     ),
//                                   ),
//                                   onTap: () {
//                                     setState(() {
//                                       _trType = 0;
//                                     });
//                                   },
//                                 ),
//
//                                 //Snow Truck
//                                 //ListTile
//                                 InkWell(
//                                   child: AnimatedContainer(
//                                     duration: const Duration(milliseconds: 250),
//                                     height: 91,
//                                     alignment: Alignment.centerLeft,
//                                     decoration: BoxDecoration(
//                                       color: _trType == 1
//                                           ? const Color(0xffEEEEEE)
//                                           : const Color(0xffFFFFFF),
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(13.0)),
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   //Title
//                                                   const Text(
//                                                     'شاحنة مثلجة',
//                                                     style: TextStyle(
//                                                       fontSize: 14,
//                                                       fontFamily: 'Montserrat',
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       color: Color(0xff191F28),
//                                                     ),
//                                                   ),
//
//                                                   //SizedBox
//                                                   const SizedBox(height: 5),
//
//                                                   //SubText
//                                                   const Text(
//                                                     'غالبا ما تستخدم لنقل (الطعام)',
//                                                     textDirection:
//                                                         TextDirection.rtl,
//                                                     style: TextStyle(
//                                                       fontSize: 10,
//                                                       fontFamily: 'Montserrat',
//                                                       fontWeight:
//                                                           FontWeight.w300,
//                                                       color: Color(0xff6C6C6C),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(14.0),
//                                               child: Container(
//                                                 width: 55,
//                                                 height: 49,
//                                                 decoration: const BoxDecoration(
//                                                   //color: Colors.transparent,
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                     Radius.circular(100),
//                                                   ),
//                                                 ),
//                                                 alignment: Alignment.center,
//
//                                                 //Image
//                                                 child: Image.asset(
//                                                   'assets/pics/Snow.png',
//                                                   width: 40,
//                                                   height: 40,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Container(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width -
//                                                 67)
//                                       ],
//                                     ),
//                                   ),
//                                   onTap: () {
//                                     setState(() {
//                                       _trType = 1;
//                                     });
//                                   },
//                                 ),
//
//                                 const SizedBox(height: 20),
//                               ],
//                             ),
//                             Next('متابعة')
//                           ],
//                         )
//                       : num == 2
//                           ? Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     //Cold Truck
//                                     //ListTile
//
//                                     InkWell(
//                                       child: AnimatedContainer(
//                                         duration:
//                                             const Duration(milliseconds: 250),
//                                         height: 91,
//                                         alignment: Alignment.centerLeft,
//                                         decoration: BoxDecoration(
//                                           color: _trType == 2
//                                               ? const Color(0xffEEEEEE)
//                                               : const Color(0xffFFFFFF),
//                                           //color: Colors.transparent,
//                                           borderRadius: const BorderRadius.all(
//                                               Radius.circular(13.0)),
//                                         ),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment.end,
//                                                     children: [
//                                                       //Title
//                                                       const Text(
//                                                         'شاحنة جافة',
//                                                         style: TextStyle(
//                                                           fontSize: 14,
//                                                           fontFamily:
//                                                               'Montserrat',
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                           color:
//                                                               Color(0xff191F28),
//                                                         ),
//                                                       ),
//
//                                                       //SizedBox
//                                                       const SizedBox(height: 5),
//
//                                                       //SubText
//                                                       const Text(
//                                                         'غالبا ما تستخدم لنقل (مواد)',
//                                                         textDirection:
//                                                             TextDirection.rtl,
//                                                         style: TextStyle(
//                                                           fontSize: 10,
//                                                           fontFamily:
//                                                               'Montserrat',
//                                                           fontWeight:
//                                                               FontWeight.w300,
//                                                           color:
//                                                               Color(0xff6C6C6C),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Padding(
//                                                   padding: const EdgeInsets.all(
//                                                       7.0),
//                                                   child: Container(
//                                                     width: 55,
//                                                     height: 49,
//                                                     decoration:
//                                                         const BoxDecoration(
//                                                       //color: Colors.transparent,
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                         Radius.circular(100),
//                                                       ),
//                                                     ),
//                                                     alignment: Alignment.center,
//
//                                                     //Image
//                                                     child: Image.asset(
//                                                       'assets/pics/Dry.png',
//                                                       width: 40,
//                                                       height: 40,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width -
//                                                     67)
//                                           ],
//                                         ),
//                                       ),
//                                       onTap: () {
//                                         setState(() {
//                                           _trType = 2;
//                                         });
//                                       },
//                                     ),
//                                     const SizedBox(height: 3),
//                                   ],
//                                 ),
//                                 Next('متابعة')
//                               ],
//                             )
//                           : num == 3
//                               ? Column(
//
//                                   children: [
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         //Cold Truck
//                                         //ListTile
//                                         InkWell(
//                                           child: AnimatedContainer(
//                                             duration: const Duration(
//                                                 milliseconds: 250),
//                                             height: 91,
//                                             alignment: Alignment.centerLeft,
//                                             decoration: BoxDecoration(
//                                               color: _trType == 0
//                                                   ? const Color(0xffEEEEEE)
//                                                   : const Color(
//                                                       0xffFFFFFF), //Original listtile Color
//                                               //color: Colors.transparent,
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(13.0)),
//                                             ),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Expanded(
//                                                       child: Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .end,
//                                                         children: [
//                                                           //Title
//                                                           const Text(
//                                                             'شاحنه مبردة',
//                                                             style: TextStyle(
//                                                               fontSize: 14,
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               color: Color(
//                                                                   0xff191F28),
//                                                             ),
//                                                           ),
//
//                                                           //SizedBox
//                                                           const SizedBox(
//                                                               height: 5),
//
//                                                           //SubText
//                                                           const Text(
//                                                             'غالبا ما تستخدم لنقل (الطعام)',
//                                                             textDirection:
//                                                                 TextDirection
//                                                                     .rtl,
//                                                             style: TextStyle(
//                                                               fontSize: 10,
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w300,
//                                                               color: Color(
//                                                                   0xff6C6C6C),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               14.0),
//                                                       child: Container(
//                                                         width: 55,
//                                                         height: 49,
//                                                         decoration:
//                                                             const BoxDecoration(
//                                                           //color: Colors.transparent,
//                                                           borderRadius:
//                                                               BorderRadius.all(
//                                                             Radius.circular(
//                                                                 100),
//                                                           ),
//                                                         ),
//                                                         alignment:
//                                                             Alignment.center,
//
//                                                         //Image
//                                                         child: Image.asset(
//                                                           'assets/pics/Aired.png',
//                                                           width: 40,
//                                                           height: 40,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // Container(
//                                                 //     width:
//                                                 //         MediaQuery.of(context)
//                                                 //                 .size
//                                                 //                 .width -
//                                                 //             67)
//                                               ],
//                                             ),
//                                           ),
//                                           onTap: () {
//                                             setState(() {
//                                               _trType = 0;
//                                             });
//                                           },
//                                         ),
//
//                                         //Snow Truck
//                                         //ListTile
//                                         InkWell(
//                                           child: AnimatedContainer(
//                                             duration: const Duration(
//                                                 milliseconds: 250),
//                                             height: 91,
//                                             alignment: Alignment.centerLeft,
//                                             decoration: BoxDecoration(
//                                               color: _trType == 1
//                                                   ? const Color(0xffEEEEEE)
//                                                   : const Color(0xffFFFFFF),
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(13.0)),
//                                             ),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Expanded(
//                                                       child: Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .end,
//                                                         children: [
//                                                           //Title
//                                                           const Text(
//                                                             'شاحنة مثلجة',
//                                                             style: TextStyle(
//                                                               fontSize: 14,
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               color: Color(
//                                                                   0xff191F28),
//                                                             ),
//                                                           ),
//
//                                                           //SizedBox
//                                                           const SizedBox(
//                                                               height: 5),
//
//                                                           //SubText
//                                                           const Text(
//                                                             'غالبا ما تستخدم لنقل (الطعام)',
//                                                             textDirection:
//                                                                 TextDirection
//                                                                     .rtl,
//                                                             style: TextStyle(
//                                                               fontSize: 10,
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w300,
//                                                               color: Color(
//                                                                   0xff6C6C6C),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               14.0),
//                                                       child: Container(
//                                                         width: 55,
//                                                         height: 49,
//                                                         decoration:
//                                                             const BoxDecoration(
//                                                           //color: Colors.transparent,
//                                                           borderRadius:
//                                                               BorderRadius.all(
//                                                             Radius.circular(
//                                                                 100),
//                                                           ),
//                                                         ),
//                                                         alignment:
//                                                             Alignment.center,
//
//                                                         //Image
//                                                         child: Image.asset(
//                                                           'assets/pics/Snow.png',
//                                                           width: 40,
//                                                           height: 40,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Container(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width -
//                                                             67)
//                                               ],
//                                             ),
//                                           ),
//                                           onTap: () {
//                                             setState(() {
//                                               _trType = 1;
//                                             });
//                                           },
//                                         ),
//
//                                         InkWell(
//                                           child: AnimatedContainer(
//                                             duration: const Duration(
//                                                 milliseconds: 250),
//                                             height: 91,
//                                             alignment: Alignment.centerLeft,
//                                             decoration: BoxDecoration(
//                                               color: _trType == 2
//                                                   ? const Color(0xffEEEEEE)
//                                                   : const Color(0xffFFFFFF),
//                                               //color: Colors.transparent,
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(13.0)),
//                                             ),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Expanded(
//                                                       child: Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .end,
//                                                         children: [
//                                                           //Title
//                                                           const Text(
//                                                             'شاحنة جافة',
//                                                             style: TextStyle(
//                                                               fontSize: 14,
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               color: Color(
//                                                                   0xff191F28),
//                                                             ),
//                                                           ),
//
//                                                           //SizedBox
//                                                           const SizedBox(
//                                                               height: 5),
//
//                                                           //SubText
//                                                           const Text(
//                                                             'غالبا ما تستخدم لنقل (مواد)',
//                                                             textDirection:
//                                                                 TextDirection
//                                                                     .rtl,
//                                                             style: TextStyle(
//                                                               fontSize: 10,
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w300,
//                                                               color: Color(
//                                                                   0xff6C6C6C),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               14.0),
//                                                       child: Container(
//                                                         width: 55,
//                                                         height: 49,
//                                                         decoration:
//                                                             const BoxDecoration(
//                                                           //color: Colors.transparent,
//                                                           borderRadius:
//                                                               BorderRadius.all(
//                                                             Radius.circular(
//                                                                 100),
//                                                           ),
//                                                         ),
//                                                         alignment:
//                                                             Alignment.center,
//
//                                                         //Image
//                                                         child: Image.asset(
//                                                           'assets/pics/Dry.png',
//                                                           width: 40,
//                                                           height: 40,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Container(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width -
//                                                             67)
//                                               ],
//                                             ),
//                                           ),
//                                           onTap: () {
//                                             setState(() {
//                                               _trType = 2;
//                                             });
//                                           },
//                                         ),
//                                         const SizedBox(height: 3),
//                                       ],
//                                     ),
//                                     Next('متابعة')
//                                   ],
//                                 )
//                               : Container(
//                                   color: Colors.red,
//                                   height: 100,
//                                 )
//                 ],
//               ),
//             ),
//           ],
//         );
//       } else if (type == 'payload') {
//         return ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 33,
//                 right: 33,
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 9, bottom: 26),
//                     child: Container(
//                       width: 58,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                   ),
//                   num == 1
//                       ? SingleChildScrollView(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   //Meds payload
//                                   //ListTile
//                                   //ادويه
//                                   InkWell(
//                                     child: AnimatedContainer(
//                                       duration:
//                                           const Duration(milliseconds: 250),
//                                       height:
//                                           MediaQuery.of(context).size.height ==
//                                                   667
//                                               ? 70 * 0
//                                               : 91,
//                                       alignment: Alignment.centerLeft,
//                                       decoration: BoxDecoration(
//                                         color: _payload == 0
//                                             ? const Color(0xffEEEEEE)
//                                             : const Color(
//                                                 0xffFFFFFF), //Original listtile Color
//                                         //color: Colors.transparent,
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(13.0)),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Expanded(
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.end,
//                                                   children: [
//                                                     //Title
//                                                     const Text(
//                                                       'حولة أدوية',
//                                                       style: TextStyle(
//                                                         fontSize: 14,
//                                                         fontFamily:
//                                                             'Montserrat',
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color:
//                                                             Color(0xff191F28),
//                                                       ),
//                                                     ),
//
//                                                     //SizedBox
//                                                     const SizedBox(height: 5),
//
//                                                     //SubText
//                                                     const Text(
//                                                       'غالبا ما تستخدم لنقل (الطعام)',
//                                                       textDirection:
//                                                           TextDirection.rtl,
//                                                       style: TextStyle(
//                                                         fontSize: 10,
//                                                         fontFamily:
//                                                             'Montserrat',
//                                                         fontWeight:
//                                                             FontWeight.w300,
//                                                         color:
//                                                             Color(0xff6C6C6C),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(14.0),
//                                                 child: Container(
//                                                   width: 55,
//                                                   height: 49,
//                                                   decoration:
//                                                       const BoxDecoration(
//                                                     //color: Colors.transparent,
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                       Radius.circular(100),
//                                                     ),
//                                                   ),
//                                                   alignment: Alignment.center,
//
//                                                   //Image
//                                                   child: Image.asset(
//                                                     'assets/pics/med.png',
//                                                     width: 40,
//                                                     height: 40,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Container(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width -
//                                                   67)
//                                         ],
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         _payload = 0;
//                                       });
//                                     },
//                                   ),
//
//                                   //Food payload
//                                   //ListTile
//                                   //اطعمه
//                                   InkWell(
//                                     child: AnimatedContainer(
//                                       duration:
//                                           const Duration(milliseconds: 250),
//                                       height: 91,
//                                       alignment: Alignment.centerLeft,
//                                       decoration: BoxDecoration(
//                                         color: _payload == 1
//                                             ? const Color(0xffEEEEEE)
//                                             : const Color(
//                                                 0xffFFFFFF), //Original listtile Color
//                                         //color: Colors.transparent,
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(13.0)),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Expanded(
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.end,
//                                                   children: [
//                                                     //Title
//                                                     const Text(
//                                                       'حمولة اطعمة',
//                                                       style: TextStyle(
//                                                         fontSize: 14,
//                                                         fontFamily:
//                                                             'Montserrat',
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color:
//                                                             Color(0xff191F28),
//                                                       ),
//                                                     ),
//
//                                                     //SizedBox
//                                                     const SizedBox(height: 5),
//
//                                                     //SubText
//                                                     const Text(
//                                                       'غالبا ما تستخدم لنقل (الطعام)',
//                                                       textDirection:
//                                                           TextDirection.rtl,
//                                                       style: TextStyle(
//                                                         fontSize: 10,
//                                                         fontFamily:
//                                                             'Montserrat',
//                                                         fontWeight:
//                                                             FontWeight.w300,
//                                                         color:
//                                                             Color(0xff6C6C6C),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(14.0),
//                                                 child: Container(
//                                                   width: 55,
//                                                   height: 49,
//                                                   decoration:
//                                                       const BoxDecoration(
//                                                     //color: Colors.transparent,
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                       Radius.circular(100),
//                                                     ),
//                                                   ),
//                                                   alignment: Alignment.center,
//
//                                                   //Image
//                                                   child: Image.asset(
//                                                     'assets/pics/food.png',
//                                                     width: 40,
//                                                     height: 40,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Container(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width -
//                                                   67)
//                                         ],
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         _payload = 1;
//                                       });
//                                     },
//                                   ),
//
//                                   //Metal Payload
//                                   //ListTile
//                                   //حديد
//                                   // InkWell(
//                                   //   child: AnimatedContainer(
//                                   //     duration: const Duration(milliseconds: 250),
//                                   //     height: 91,
//                                   //     alignment: Alignment.centerLeft,
//                                   //     decoration: BoxDecoration(
//                                   //       color: _payload == 2
//                                   //           ? const Color(0xffEEEEEE)
//                                   //           : const Color(
//                                   //           0xffFFFFFF), //Original listtile Color
//                                   //       //color: Colors.transparent,
//                                   //       borderRadius: const BorderRadius.all(
//                                   //           Radius.circular(13.0)),
//                                   //     ),
//                                   //     child: Column(
//                                   //       mainAxisAlignment:
//                                   //       MainAxisAlignment.spaceEvenly,
//                                   //       crossAxisAlignment: CrossAxisAlignment.end,
//                                   //       children: [
//                                   //         Row(
//                                   //           children: [
//                                   //             Expanded(
//                                   //               child: Column(
//                                   //                 mainAxisAlignment:
//                                   //                 MainAxisAlignment.spaceBetween,
//                                   //                 crossAxisAlignment:
//                                   //                 CrossAxisAlignment.end,
//                                   //                 children: [
//                                   //                   //Title
//                                   //                   const Text(
//                                   //                     'حمولة حديد',
//                                   //                     style: TextStyle(
//                                   //                       fontSize: 14,
//                                   //                       fontFamily: 'Montserrat',
//                                   //                       fontWeight: FontWeight.w500,
//                                   //                       color: Color(0xff191F28),
//                                   //                     ),
//                                   //                   ),
//                                   //
//                                   //                   //SizedBox
//                                   //                   const SizedBox(height: 5),
//                                   //
//                                   //                   //SubText
//                                   //                   const Text(
//                                   //                     'غالبا ما تستخدم لنقل (مواد)',
//                                   //                     textDirection:
//                                   //                     TextDirection.rtl,
//                                   //                     style: TextStyle(
//                                   //                       fontSize: 10,
//                                   //                       fontFamily: 'Montserrat',
//                                   //                       fontWeight: FontWeight.w300,
//                                   //                       color: Color(0xff6C6C6C),
//                                   //                     ),
//                                   //                   ),
//                                   //                 ],
//                                   //               ),
//                                   //             ),
//                                   //             Padding(
//                                   //               padding: const EdgeInsets.all(14.0),
//                                   //               child: Container(
//                                   //                 width: 55,
//                                   //                 height: 49,
//                                   //                 decoration: const BoxDecoration(
//                                   //                   //color: Colors.transparent,
//                                   //                   borderRadius: BorderRadius.all(
//                                   //                     Radius.circular(100),
//                                   //                   ),
//                                   //                 ),
//                                   //                 alignment: Alignment.center,
//                                   //
//                                   //                 //Image
//                                   //                 child: Image.asset(
//                                   //                   'assets/pics/metal.png',
//                                   //                   width: 40,
//                                   //                   height: 40,
//                                   //                 ),
//                                   //               ),
//                                   //             ),
//                                   //           ],
//                                   //         ),
//                                   //         Container(
//                                   //             width:
//                                   //             MediaQuery.of(context).size.width -
//                                   //                 67)
//                                   //       ],
//                                   //     ),
//                                   //   ),
//                                   //   onTap: () {
//                                   //     setState(() {
//                                   //       _payload = 2;
//                                   //     });
//                                   //   },
//                                   // ),
//
//                                   //package payload
//                                   //ListTile
//                                   //بضائع
//                                   InkWell(
//                                     child: AnimatedContainer(
//                                       duration:
//                                           const Duration(milliseconds: 250),
//                                       height: 91,
//                                       alignment: Alignment.centerLeft,
//                                       decoration: BoxDecoration(
//                                         color: _payload == 3
//                                             ? const Color(0xffEEEEEE)
//                                             : const Color(
//                                                 0xffFFFFFF), //Original listtile Color
//                                         //color: Colors.transparent,
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(13.0)),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Expanded(
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.end,
//                                                   children: const [
//                                                     //Title
//                                                     Text(
//                                                       'حمولة بضائع',
//                                                       style: TextStyle(
//                                                         fontSize: 14,
//                                                         fontFamily:
//                                                             'Montserrat',
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color:
//                                                             Color(0xff191F28),
//                                                       ),
//                                                     ),
//
//                                                     //SizedBox
//                                                     SizedBox(height: 5),
//
//                                                     //SubText
//                                                     Text(
//                                                       'غالبا ما تستخدم لنقل (الطعام)',
//                                                       textDirection:
//                                                           TextDirection.rtl,
//                                                       style: TextStyle(
//                                                         fontSize: 10,
//                                                         fontFamily:
//                                                             'Montserrat',
//                                                         fontWeight:
//                                                             FontWeight.w300,
//                                                         color:
//                                                             Color(0xff6C6C6C),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(14.0),
//                                                 child: Container(
//                                                   width: 55,
//                                                   height: 49,
//                                                   decoration:
//                                                       const BoxDecoration(
//                                                     //color: Colors.transparent,
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                       Radius.circular(100),
//                                                     ),
//                                                   ),
//                                                   alignment: Alignment.center,
//
//                                                   //Image
//                                                   child: Image.asset(
//                                                     'assets/pics/package.png',
//                                                     width: 40,
//                                                     height: 40,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Container(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width -
//                                                   67)
//                                         ],
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         _payload = 3;
//                                       });
//                                     },
//                                   ),
//
//                                   //cattle payload
//                                   //ListTile
//                                   //مواشي
//                                   // InkWell(
//                                   //   child: AnimatedContainer(
//                                   //     duration: const Duration(milliseconds: 250),
//                                   //     height: 91,
//                                   //     alignment: Alignment.centerLeft,
//                                   //     decoration: BoxDecoration(
//                                   //       color: _payload == 4
//                                   //           ? const Color(0xffEEEEEE)
//                                   //           : const Color(
//                                   //               0xffFFFFFF), //Original listtile Color
//                                   //       //color: Colors.transparent,
//                                   //       borderRadius: const BorderRadius.all(
//                                   //           Radius.circular(13.0)),
//                                   //     ),
//                                   //     child: Column(
//                                   //       mainAxisAlignment:
//                                   //           MainAxisAlignment.spaceEvenly,
//                                   //       crossAxisAlignment: CrossAxisAlignment.end,
//                                   //       children: [
//                                   //         Row(
//                                   //           children: [
//                                   //             Expanded(
//                                   //               child: Column(
//                                   //                 mainAxisAlignment:
//                                   //                     MainAxisAlignment.spaceBetween,
//                                   //                 crossAxisAlignment:
//                                   //                     CrossAxisAlignment.end,
//                                   //                 children: const [
//                                   //                   //Title
//                                   //                   Text(
//                                   //                     'حمولة مواشي',
//                                   //                     style: TextStyle(
//                                   //                       fontSize: 14,
//                                   //                       fontFamily: 'Montserrat',
//                                   //                       fontWeight: FontWeight.w500,
//                                   //                       color: Color(0xff191F28),
//                                   //                     ),
//                                   //                   ),
//                                   //
//                                   //                   //SizedBox
//                                   //                   SizedBox(height: 5),
//                                   //
//                                   //                   //SubText
//                                   //                   Text(
//                                   //                     'غالبا ما تستخدم لنقل (الطعام)',
//                                   //                     textDirection:
//                                   //                         TextDirection.rtl,
//                                   //                     style: TextStyle(
//                                   //                       fontSize: 10,
//                                   //                       fontFamily: 'Montserrat',
//                                   //                       fontWeight: FontWeight.w300,
//                                   //                       color: Color(0xff6C6C6C),
//                                   //                     ),
//                                   //                   ),
//                                   //                 ],
//                                   //               ),
//                                   //             ),
//                                   //             Padding(
//                                   //               padding: const EdgeInsets.all(14.0),
//                                   //               child: Container(
//                                   //                 width: 55,
//                                   //                 height: 49,
//                                   //                 decoration: const BoxDecoration(
//                                   //                   //color: Colors.transparent,
//                                   //                   borderRadius: BorderRadius.all(
//                                   //                     Radius.circular(100),
//                                   //                   ),
//                                   //                 ),
//                                   //                 alignment: Alignment.center,
//                                   //
//                                   //                 //Image
//                                   //                 child: Image.asset(
//                                   //                   'assets/pics/cattle.png',
//                                   //                   width: 40,
//                                   //                   height: 40,
//                                   //                 ),
//                                   //               ),
//                                   //             ),
//                                   //           ],
//                                   //         ),
//                                   //         Container(
//                                   //             width:
//                                   //                 MediaQuery.of(context).size.width -
//                                   //                     67)
//                                   //       ],
//                                   //     ),
//                                   //   ),
//                                   //   onTap: () {
//                                   //     setState(() {
//                                   //       _payload = 4;
//                                   //     });
//                                   //   },
//                                   // ),
//
//                                   //Others (Special)
//                                   //ListTile
//                                   InkWell(
//                                     child: AnimatedContainer(
//                                       duration:
//                                           const Duration(milliseconds: 250),
//                                       height: 91,
//                                       alignment: Alignment.centerLeft,
//                                       decoration: BoxDecoration(
//                                         color: _payload == 5
//                                             ? const Color(0xffEEEEEE)
//                                             : const Color(
//                                                 0xffFFFFFF), //Original listtile Color
//                                         //color: Colors.transparent,
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(13.0)),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Expanded(
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.end,
//                                                   // ignore: prefer_const_literals_to_create_immutables
//                                                   children: [
//                                                     //Title
//                                                     const Text(
//                                                       'خاص (أخرى)',
//                                                       style: TextStyle(
//                                                         fontSize: 14,
//                                                         fontFamily:
//                                                             'Montserrat',
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color:
//                                                             Color(0xff191F28),
//                                                       ),
//                                                     ),
//
//                                                     //SizedBox
//                                                     const SizedBox(height: 5),
//
//                                                     //SubText
//                                                     const Text(
//                                                       'غالبا ما تستخدم لنقل (مواد)',
//                                                       textDirection:
//                                                           TextDirection.rtl,
//                                                       style: TextStyle(
//                                                         fontSize: 10,
//                                                         fontFamily:
//                                                             'Montserrat',
//                                                         fontWeight:
//                                                             FontWeight.w300,
//                                                         color:
//                                                             Color(0xff6C6C6C),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(14.0),
//                                                 child: Container(
//                                                   width: 55,
//                                                   height: 49,
//                                                   decoration:
//                                                       const BoxDecoration(
//                                                     //color: Colors.transparent,
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                       Radius.circular(100),
//                                                     ),
//                                                   ),
//                                                   alignment: Alignment.center,
//
//                                                   //Image
//                                                   child: Image.asset(
//                                                     'assets/pics/others.png',
//                                                     width: 40,
//                                                     height: 40,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Container(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width -
//                                                   67)
//                                         ],
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         _payload = 5;
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: typeButtonHeight()),
//                               Next('متابعة')
//                             ],
//                           ),
//                         )
//                       : num == 2
//                           ? SingleChildScrollView(
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       //Metal Payload
//                                       //ListTile
//                                       //حديد
//                                       InkWell(
//                                         child: AnimatedContainer(
//                                           duration:
//                                               const Duration(milliseconds: 250),
//                                           height: 91,
//                                           alignment: Alignment.centerLeft,
//                                           decoration: BoxDecoration(
//                                             color: _payload == 2
//                                                 ? const Color(0xffEEEEEE)
//                                                 : const Color(
//                                                     0xffFFFFFF), //Original listtile Color
//                                             //color: Colors.transparent,
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(13.0)),
//                                           ),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .end,
//                                                       children: [
//                                                         //Title
//                                                         const Text(
//                                                           'حمولة حديد',
//                                                           style: TextStyle(
//                                                             fontSize: 14,
//                                                             fontFamily:
//                                                                 'Montserrat',
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             color: Color(
//                                                                 0xff191F28),
//                                                           ),
//                                                         ),
//
//                                                         //SizedBox
//                                                         const SizedBox(
//                                                             height: 5),
//
//                                                         //SubText
//                                                         const Text(
//                                                           'غالبا ما تستخدم لنقل (مواد)',
//                                                           textDirection:
//                                                               TextDirection.rtl,
//                                                           style: TextStyle(
//                                                             fontSize: 10,
//                                                             fontFamily:
//                                                                 'Montserrat',
//                                                             fontWeight:
//                                                                 FontWeight.w300,
//                                                             color: Color(
//                                                                 0xff6C6C6C),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             14.0),
//                                                     child: Container(
//                                                       width: 55,
//                                                       height: 49,
//                                                       decoration:
//                                                           const BoxDecoration(
//                                                         //color: Colors.transparent,
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                           Radius.circular(100),
//                                                         ),
//                                                       ),
//                                                       alignment:
//                                                           Alignment.center,
//
//                                                       //Image
//                                                       child: Image.asset(
//                                                         'assets/pics/metal.png',
//                                                         width: 40,
//                                                         height: 40,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Container(
//                                                   width: MediaQuery.of(context)
//                                                           .size
//                                                           .width -
//                                                       67)
//                                             ],
//                                           ),
//                                         ),
//                                         onTap: () {
//                                           setState(() {
//                                             _payload = 2;
//                                           });
//                                         },
//                                       ),
//
//                                       //package payload
//                                       //ListTile
//                                       //بضائع
//                                       InkWell(
//                                         child: AnimatedContainer(
//                                           duration:
//                                               const Duration(milliseconds: 250),
//                                           height: 91,
//                                           alignment: Alignment.centerLeft,
//                                           decoration: BoxDecoration(
//                                             color: _payload == 3
//                                                 ? const Color(0xffEEEEEE)
//                                                 : const Color(
//                                                     0xffFFFFFF), //Original listtile Color
//                                             //color: Colors.transparent,
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(13.0)),
//                                           ),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .end,
//                                                       children: const [
//                                                         //Title
//                                                         Text(
//                                                           'حمولة بضائع',
//                                                           style: TextStyle(
//                                                             fontSize: 14,
//                                                             fontFamily:
//                                                                 'Montserrat',
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             color: Color(
//                                                                 0xff191F28),
//                                                           ),
//                                                         ),
//
//                                                         //SizedBox
//                                                         SizedBox(height: 5),
//
//                                                         //SubText
//                                                         Text(
//                                                           'غالبا ما تستخدم لنقل (الطعام)',
//                                                           textDirection:
//                                                               TextDirection.rtl,
//                                                           style: TextStyle(
//                                                             fontSize: 10,
//                                                             fontFamily:
//                                                                 'Montserrat',
//                                                             fontWeight:
//                                                                 FontWeight.w300,
//                                                             color: Color(
//                                                                 0xff6C6C6C),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             14.0),
//                                                     child: Container(
//                                                       width: 55,
//                                                       height: 49,
//                                                       decoration:
//                                                           const BoxDecoration(
//                                                         //color: Colors.transparent,
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                           Radius.circular(100),
//                                                         ),
//                                                       ),
//                                                       alignment:
//                                                           Alignment.center,
//
//                                                       //Image
//                                                       child: Image.asset(
//                                                         'assets/pics/package.png',
//                                                         width: 40,
//                                                         height: 40,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Container(
//                                                   width: MediaQuery.of(context)
//                                                           .size
//                                                           .width -
//                                                       67)
//                                             ],
//                                           ),
//                                         ),
//                                         onTap: () {
//                                           setState(() {
//                                             _payload = 3;
//                                           });
//                                         },
//                                       ),
//
//                                       //cattle payload
//                                       //ListTile
//                                       //مواشي
//                                       // InkWell(
//                                       //   child: AnimatedContainer(
//                                       //     duration: const Duration(milliseconds: 250),
//                                       //     height: 91,
//                                       //     alignment: Alignment.centerLeft,
//                                       //     decoration: BoxDecoration(
//                                       //       color: _payload == 4
//                                       //           ? const Color(0xffEEEEEE)
//                                       //           : const Color(
//                                       //               0xffFFFFFF), //Original listtile Color
//                                       //       //color: Colors.transparent,
//                                       //       borderRadius: const BorderRadius.all(
//                                       //           Radius.circular(13.0)),
//                                       //     ),
//                                       //     child: Column(
//                                       //       mainAxisAlignment:
//                                       //           MainAxisAlignment.spaceEvenly,
//                                       //       crossAxisAlignment: CrossAxisAlignment.end,
//                                       //       children: [
//                                       //         Row(
//                                       //           children: [
//                                       //             Expanded(
//                                       //               child: Column(
//                                       //                 mainAxisAlignment:
//                                       //                     MainAxisAlignment.spaceBetween,
//                                       //                 crossAxisAlignment:
//                                       //                     CrossAxisAlignment.end,
//                                       //                 children: const [
//                                       //                   //Title
//                                       //                   Text(
//                                       //                     'حمولة مواشي',
//                                       //                     style: TextStyle(
//                                       //                       fontSize: 14,
//                                       //                       fontFamily: 'Montserrat',
//                                       //                       fontWeight: FontWeight.w500,
//                                       //                       color: Color(0xff191F28),
//                                       //                     ),
//                                       //                   ),
//                                       //
//                                       //                   //SizedBox
//                                       //                   SizedBox(height: 5),
//                                       //
//                                       //                   //SubText
//                                       //                   Text(
//                                       //                     'غالبا ما تستخدم لنقل (الطعام)',
//                                       //                     textDirection:
//                                       //                         TextDirection.rtl,
//                                       //                     style: TextStyle(
//                                       //                       fontSize: 10,
//                                       //                       fontFamily: 'Montserrat',
//                                       //                       fontWeight: FontWeight.w300,
//                                       //                       color: Color(0xff6C6C6C),
//                                       //                     ),
//                                       //                   ),
//                                       //                 ],
//                                       //               ),
//                                       //             ),
//                                       //             Padding(
//                                       //               padding: const EdgeInsets.all(14.0),
//                                       //               child: Container(
//                                       //                 width: 55,
//                                       //                 height: 49,
//                                       //                 decoration: const BoxDecoration(
//                                       //                   //color: Colors.transparent,
//                                       //                   borderRadius: BorderRadius.all(
//                                       //                     Radius.circular(100),
//                                       //                   ),
//                                       //                 ),
//                                       //                 alignment: Alignment.center,
//                                       //
//                                       //                 //Image
//                                       //                 child: Image.asset(
//                                       //                   'assets/pics/cattle.png',
//                                       //                   width: 40,
//                                       //                   height: 40,
//                                       //                 ),
//                                       //               ),
//                                       //             ),
//                                       //           ],
//                                       //         ),
//                                       //         Container(
//                                       //             width:
//                                       //                 MediaQuery.of(context).size.width -
//                                       //                     67)
//                                       //       ],
//                                       //     ),
//                                       //   ),
//                                       //   onTap: () {
//                                       //     setState(() {
//                                       //       _payload = 4;
//                                       //     });
//                                       //   },
//                                       // ),
//
//                                       //Others (Special)
//                                       //ListTile
//                                       InkWell(
//                                         child: AnimatedContainer(
//                                           duration:
//                                               const Duration(milliseconds: 250),
//                                           height: 91,
//                                           alignment: Alignment.centerLeft,
//                                           decoration: BoxDecoration(
//                                             color: _payload == 5
//                                                 ? const Color(0xffEEEEEE)
//                                                 : const Color(
//                                                     0xffFFFFFF), //Original listtile Color
//                                             //color: Colors.transparent,
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(13.0)),
//                                           ),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .end,
//                                                       // ignore: prefer_const_literals_to_create_immutables
//                                                       children: [
//                                                         //Title
//                                                         const Text(
//                                                           'خاص (أخرى)',
//                                                           style: TextStyle(
//                                                             fontSize: 14,
//                                                             fontFamily:
//                                                                 'Montserrat',
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             color: Color(
//                                                                 0xff191F28),
//                                                           ),
//                                                         ),
//
//                                                         //SizedBox
//                                                         const SizedBox(
//                                                             height: 5),
//
//                                                         //SubText
//                                                         const Text(
//                                                           'غالبا ما تستخدم لنقل (مواد)',
//                                                           textDirection:
//                                                               TextDirection.rtl,
//                                                           style: TextStyle(
//                                                             fontSize: 10,
//                                                             fontFamily:
//                                                                 'Montserrat',
//                                                             fontWeight:
//                                                                 FontWeight.w300,
//                                                             color: Color(
//                                                                 0xff6C6C6C),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             14.0),
//                                                     child: Container(
//                                                       width: 55,
//                                                       height: 49,
//                                                       decoration:
//                                                           const BoxDecoration(
//                                                         //color: Colors.transparent,
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                           Radius.circular(100),
//                                                         ),
//                                                       ),
//                                                       alignment:
//                                                           Alignment.center,
//
//                                                       //Image
//                                                       child: Image.asset(
//                                                         'assets/pics/others.png',
//                                                         width: 40,
//                                                         height: 40,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Container(
//                                                   width: MediaQuery.of(context)
//                                                           .size
//                                                           .width -
//                                                       67)
//                                             ],
//                                           ),
//                                         ),
//                                         onTap: () {
//                                           setState(() {
//                                             _payload = 5;
//                                           });
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: typeButtonHeight()),
//                                   Next('متابعة')
//                                 ],
//                               ),
//                             )
//                           : num == 3
//                               ? SingleChildScrollView(
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           //Metal Payload
//                                           //ListTile
//                                           //حديد
//                                           InkWell(
//                                             child: AnimatedContainer(
//                                               duration: const Duration(
//                                                   milliseconds: 250),
//                                               height: 91,
//                                               alignment: Alignment.centerLeft,
//                                               decoration: BoxDecoration(
//                                                 color: _payload == 2
//                                                     ? const Color(0xffEEEEEE)
//                                                     : const Color(
//                                                         0xffFFFFFF), //Original listtile Color
//                                                 //color: Colors.transparent,
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(13.0)),
//                                               ),
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: Column(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .end,
//                                                           children: [
//                                                             //Title
//                                                             const Text(
//                                                               'حمولة حديد',
//                                                               style: TextStyle(
//                                                                 fontSize: 14,
//                                                                 fontFamily:
//                                                                     'Montserrat',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500,
//                                                                 color: Color(
//                                                                     0xff191F28),
//                                                               ),
//                                                             ),
//
//                                                             //SizedBox
//                                                             const SizedBox(
//                                                                 height: 5),
//
//                                                             //SubText
//                                                             const Text(
//                                                               'غالبا ما تستخدم لنقل (مواد)',
//                                                               textDirection:
//                                                                   TextDirection
//                                                                       .rtl,
//                                                               style: TextStyle(
//                                                                 fontSize: 10,
//                                                                 fontFamily:
//                                                                     'Montserrat',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w300,
//                                                                 color: Color(
//                                                                     0xff6C6C6C),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(14.0),
//                                                         child: Container(
//                                                           width: 55,
//                                                           height: 49,
//                                                           decoration:
//                                                               const BoxDecoration(
//                                                             //color: Colors.transparent,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(
//                                                               Radius.circular(
//                                                                   100),
//                                                             ),
//                                                           ),
//                                                           alignment:
//                                                               Alignment.center,
//
//                                                           //Image
//                                                           child: Image.asset(
//                                                             'assets/pics/metal.png',
//                                                             width: 40,
//                                                             height: 40,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Container(
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width -
//                                                               67)
//                                                 ],
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               setState(() {
//                                                 _payload = 2;
//                                               });
//                                             },
//                                           ),
//
//                                           //package payload
//                                           //ListTile
//                                           //بضائع
//                                           InkWell(
//                                             child: AnimatedContainer(
//                                               duration: const Duration(
//                                                   milliseconds: 250),
//                                               height: 91,
//                                               alignment: Alignment.centerLeft,
//                                               decoration: BoxDecoration(
//                                                 color: _payload == 3
//                                                     ? const Color(0xffEEEEEE)
//                                                     : const Color(
//                                                         0xffFFFFFF), //Original listtile Color
//                                                 //color: Colors.transparent,
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(13.0)),
//                                               ),
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: Column(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .end,
//                                                           children: const [
//                                                             //Title
//                                                             Text(
//                                                               'حمولة بضائع',
//                                                               style: TextStyle(
//                                                                 fontSize: 14,
//                                                                 fontFamily:
//                                                                     'Montserrat',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500,
//                                                                 color: Color(
//                                                                     0xff191F28),
//                                                               ),
//                                                             ),
//
//                                                             //SizedBox
//                                                             SizedBox(height: 5),
//
//                                                             //SubText
//                                                             Text(
//                                                               'غالبا ما تستخدم لنقل (الطعام)',
//                                                               textDirection:
//                                                                   TextDirection
//                                                                       .rtl,
//                                                               style: TextStyle(
//                                                                 fontSize: 10,
//                                                                 fontFamily:
//                                                                     'Montserrat',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w300,
//                                                                 color: Color(
//                                                                     0xff6C6C6C),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(14.0),
//                                                         child: Container(
//                                                           width: 55,
//                                                           height: 49,
//                                                           decoration:
//                                                               const BoxDecoration(
//                                                             //color: Colors.transparent,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(
//                                                               Radius.circular(
//                                                                   100),
//                                                             ),
//                                                           ),
//                                                           alignment:
//                                                               Alignment.center,
//
//                                                           //Image
//                                                           child: Image.asset(
//                                                             'assets/pics/package.png',
//                                                             width: 40,
//                                                             height: 40,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Container(
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width -
//                                                               67)
//                                                 ],
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               setState(() {
//                                                 _payload = 3;
//                                               });
//                                             },
//                                           ),
//
//                                           //cattle payload
//                                           //ListTile
//                                           //مواشي
//                                           InkWell(
//                                             child: AnimatedContainer(
//                                               duration: const Duration(
//                                                   milliseconds: 250),
//                                               height: 91,
//                                               alignment: Alignment.centerLeft,
//                                               decoration: BoxDecoration(
//                                                 color: _payload == 4
//                                                     ? const Color(0xffEEEEEE)
//                                                     : const Color(
//                                                         0xffFFFFFF), //Original listtile Color
//                                                 //color: Colors.transparent,
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(13.0)),
//                                               ),
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: Column(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .end,
//                                                           children: const [
//                                                             //Title
//                                                             Text(
//                                                               'حمولة مواشي',
//                                                               style: TextStyle(
//                                                                 fontSize: 14,
//                                                                 fontFamily:
//                                                                     'Montserrat',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500,
//                                                                 color: Color(
//                                                                     0xff191F28),
//                                                               ),
//                                                             ),
//
//                                                             //SizedBox
//                                                             SizedBox(height: 5),
//
//                                                             //SubText
//                                                             Text(
//                                                               'غالبا ما تستخدم لنقل (الطعام)',
//                                                               textDirection:
//                                                                   TextDirection
//                                                                       .rtl,
//                                                               style: TextStyle(
//                                                                 fontSize: 10,
//                                                                 fontFamily:
//                                                                     'Montserrat',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w300,
//                                                                 color: Color(
//                                                                     0xff6C6C6C),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(14.0),
//                                                         child: Container(
//                                                           width: 55,
//                                                           height: 49,
//                                                           decoration:
//                                                               const BoxDecoration(
//                                                             //color: Colors.transparent,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(
//                                                               Radius.circular(
//                                                                   100),
//                                                             ),
//                                                           ),
//                                                           alignment:
//                                                               Alignment.center,
//
//                                                           //Image
//                                                           child: Image.asset(
//                                                             'assets/pics/cattle.png',
//                                                             width: 40,
//                                                             height: 40,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Container(
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width -
//                                                               67)
//                                                 ],
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               setState(() {
//                                                 _payload = 4;
//                                               });
//                                             },
//                                           ),
//
//                                           //Others (Special)
//                                           //ListTile
//                                           InkWell(
//                                             child: AnimatedContainer(
//                                               duration: const Duration(
//                                                   milliseconds: 250),
//                                               height: 91,
//                                               alignment: Alignment.centerLeft,
//                                               decoration: BoxDecoration(
//                                                 color: _payload == 5
//                                                     ? const Color(0xffEEEEEE)
//                                                     : const Color(
//                                                         0xffFFFFFF), //Original listtile Color
//                                                 //color: Colors.transparent,
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(13.0)),
//                                               ),
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: Column(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .end,
//                                                           // ignore: prefer_const_literals_to_create_immutables
//                                                           children: [
//                                                             //Title
//                                                             const Text(
//                                                               'خاص (أخرى)',
//                                                               style: TextStyle(
//                                                                 fontSize: 14,
//                                                                 fontFamily:
//                                                                     'Montserrat',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500,
//                                                                 color: Color(
//                                                                     0xff191F28),
//                                                               ),
//                                                             ),
//
//                                                             //SizedBox
//                                                             const SizedBox(
//                                                                 height: 5),
//
//                                                             //SubText
//                                                             const Text(
//                                                               'غالبا ما تستخدم لنقل (مواد)',
//                                                               textDirection:
//                                                                   TextDirection
//                                                                       .rtl,
//                                                               style: TextStyle(
//                                                                 fontSize: 10,
//                                                                 fontFamily:
//                                                                     'Montserrat',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w300,
//                                                                 color: Color(
//                                                                     0xff6C6C6C),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(14.0),
//                                                         child: Container(
//                                                           width: 55,
//                                                           height: 49,
//                                                           decoration:
//                                                               const BoxDecoration(
//                                                             //color: Colors.transparent,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(
//                                                               Radius.circular(
//                                                                   100),
//                                                             ),
//                                                           ),
//                                                           alignment:
//                                                               Alignment.center,
//
//                                                           //Image
//                                                           child: Image.asset(
//                                                             'assets/pics/others.png',
//                                                             width: 40,
//                                                             height: 40,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Container(
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width -
//                                                               67)
//                                                 ],
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               setState(() {
//                                                 _payload = 5;
//                                               });
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: typeButtonHeight()),
//                                       Next('متابعة')
//                                     ],
//                                   ),
//                                 )
//                               : Container()
//                 ],
//               ),
//             ),
//           ],
//         );
//       } else if (type == 'time') {
//         return ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 33,
//                 right: 33,
//               ),
//               child: Column(
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(
//                                 top: MediaQuery.of(context).size.height == 667
//                                     ? 0
//                                     : 9,
//                                 bottom: 26),
//                             child: Container(
//                               width: 58,
//                               height: 4,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                             ),
//                           ),
//
//                           //title
//                           Container(
//                             width: double.infinity,
//                             child: const Text(
//                               'التوقيت',
//                               textAlign: TextAlign.end,
//                               style: TextStyle(
//                                   fontSize: 24, fontFamily: 'ArabotoFat'),
//                             ),
//                           ),
//
//                           const SizedBox(height: 5),
//
//                           //Subtitle
//                           Container(
//                             width: double.infinity,
//                             child: const Text(
//                               'اختر توقيت الشحنة الخاصة بك متى تريد أن تؤخد لنقل',
//                               textAlign: TextAlign.end,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: 'Araboto',
//                                 color: Color(0xff868686),
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(height: 10),
//
//                           //Calendar Screen
//                           Container(
//                             alignment: Alignment.center,
//                             height: 69,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(14),
//                               border: Border.all(
//                                 color: const Color(0xffC3CAD3),
//                                 width: 2,
//                               ),
//                             ),
//                             child: ListTile(
//                               contentPadding:
//                                   const EdgeInsets.only(right: 17, bottom: 30),
//                               title: const Text(
//                                 'اختر توقيت الشحن',
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   fontFamily: 'Araboto',
//                                   color: Color(0xff868686),
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 '${Fhour(day)}.${Fhour(month)}.$year',
//                                 textAlign: TextAlign.end,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: 'ArabotoFat',
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               trailing: const Icon(
//                                 Icons.calendar_today_outlined,
//                                 color: Color(0xffA7AFBA),
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(height: 10),
//
//                           //Calendar
//                           Container(
//                             alignment: Alignment.center,
//                             height: MediaQuery.of(context).size.height * 0.35,
//                             width: 317,
//                             decoration: BoxDecoration(
//                               color: const Color(0xffF5F5F5),
//                               borderRadius: BorderRadius.circular(12.8),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: SfDateRangePicker(
//                                 initialSelectedDate: DateTime.now(),
//                                 minDate: DateTime.now(),
//                                 initialDisplayDate: DateTime.now(),
//                                 selectionShape:
//                                     DateRangePickerSelectionShape.rectangle,
//                                 showNavigationArrow: true,
//                                 headerStyle: const DateRangePickerHeaderStyle(
//                                   textAlign: TextAlign.center,
//                                   textStyle: TextStyle(
//                                     color: Color(0xff141414),
//                                     fontFamily: 'lexend',
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 19.2,
//                                   ),
//                                 ),
//                                 monthViewSettings:
//                                     const DateRangePickerMonthViewSettings(
//                                         showTrailingAndLeadingDates: true,
//                                         firstDayOfWeek: 7,
//                                         numberOfWeeksInView: 6,
//                                         dayFormat: 'E',
//                                         viewHeaderStyle:
//                                             DateRangePickerViewHeaderStyle(
//                                                 textStyle: TextStyle(
//                                           color: Color(0xff141414),
//                                           fontFamily: 'lexend',
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14.4,
//                                         ))),
//                                 monthCellStyle: DateRangePickerMonthCellStyle(
//                                     trailingDatesTextStyle: TextStyle(
//                                       fontFamily: 'lexend',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14.4,
//                                       color: const Color(0xff001754)
//                                           .withOpacity(0.15),
//                                     ),
//                                     trailingDatesDecoration: BoxDecoration(
//                                       color: Colors.transparent,
//                                       borderRadius: BorderRadius.circular(4.8),
//                                     ),
//                                     leadingDatesDecoration: BoxDecoration(
//                                       color: Colors.transparent,
//                                       borderRadius: BorderRadius.circular(4.8),
//                                     ),
//                                     leadingDatesTextStyle: TextStyle(
//                                       fontFamily: 'lexend',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14.4,
//                                       color: const Color(0xff001754)
//                                           .withOpacity(0.15),
//                                     ),
//                                     cellDecoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(4.8),
//                                     ),
//                                     selectionTextStyle: const TextStyle(
//                                       fontFamily: 'lexend',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14.4,
//                                       color: Colors.white,
//                                     ),
//                                     todayTextStyle: const TextStyle(
//                                       fontFamily: 'lexend',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14.4,
//                                       color: Color(0xff1F1F1F),
//                                     ),
//                                     textStyle: const TextStyle(
//                                       fontFamily: 'lexend',
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14.4,
//                                       color: Color(0xff1F1F1F),
//                                     )),
//                                 backgroundColor: const Color(0xffF5F5F5),
//                                 controller: _datePickerController,
//                                 onSelectionChanged: _onDateSelectionChanged,
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(height: 14),
//
//                           InkWell(
//                             child: Container(
//                               alignment: Alignment.center,
//                               height: 69,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(14),
//                                 border: Border.all(
//                                   color: const Color(0xffC3CAD3),
//                                   width: 2,
//                                 ),
//                               ),
//                               child: ListTile(
//                                 contentPadding: const EdgeInsets.only(
//                                     right: 17, bottom: 30),
//                                 title: const Text(
//                                   'اختر الساعة',
//                                   textAlign: TextAlign.end,
//                                   style: TextStyle(
//                                     fontSize: 10,
//                                     fontFamily: 'Araboto',
//                                     color: Color(0xff868686),
//                                   ),
//                                 ),
//                                 subtitle: Text(
//                                   '${Fhour(hour)}:${Fminute(minute)}',
//                                   textAlign: TextAlign.end,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: 'ArabotoFat',
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 trailing: const Icon(
//                                   Icons.access_alarm_outlined,
//                                   color: Color(0xffA7AFBA),
//                                   size: 20,
//                                 ),
//                               ),
//                             ),
//                             onTap: () {
//                               pickValue();
//                             },
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   ),
//
//                   SizedBox(height: timeButtonHeight()),
//                   //todo:make sure to check this when u go to android
//
//                   Next('متابعة'),
//                 ],
//               ),
//             ),
//           ],
//         );
//       } else if (type == 'note') {
//         _note = 1;
//         return ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 33,
//                 right: 33,
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 9, bottom: 26),
//                     child: Container(
//                       width: 58,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const SizedBox(height: 20),
//
//                             Container(
//                               width: double.infinity,
//                               child: const Text(
//                                 'أكتب تفاصيل طلبك (اختياري)',
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: 'Madani',
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//
//                             const SizedBox(height: 5),
//
//                             Container(
//                               width: double.infinity,
//                               child: const Text(
//                                 'تفاصيل الطلب تساعد السائق على فهم دوره بشكل دقيق أثناء عملية التوصيل و العناية بالطلبية بشكل أفضل أثناء الشحن.',
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(
//                                     fontSize: 11,
//                                     fontFamily: 'Madani',
//                                     //fontWeight: FontWeight.w600,
//                                     color: Color(0xffA1A1A1)),
//                               ),
//                             ),
//
//                             const SizedBox(height: 12),
//
//                             //Context Input
//                             Container(
//                                 height: 197,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       width: TextError ? 1.5 : 1,
//                                       color: TextError
//                                           ? Colors.red
//                                           : const Color(0x1a000000)),
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: const Color(0xffF8F8F8),
//                                 ),
//                                 child: Form(
//                                   key: formKey,
//                                   child: TextFormField(
//                                     controller: _noteText,
//                                     decoration: const InputDecoration(
//                                       border: InputBorder.none,
//                                       contentPadding:
//                                           EdgeInsets.fromLTRB(10, 10, 10, 0),
//                                       hintText: 'أكتب شيئا',
//                                       hintStyle: TextStyle(
//                                           fontFamily: 'Montserrat',
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w200),
//                                       hintTextDirection: TextDirection.rtl,
//                                     ),
//                                     maxLines: 11,
//                                     textDirection: TextDirection.rtl,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.w300,
//                                         fontSize: 12,
//                                         fontFamily: 'Montserrat'),
//
//                                     //Note is Optional so no need to check
//
//                                     validator: (value) {
//                                       if (value!.isEmpty || value == null) {
//                                         setState(() {
//                                           TextError = false;
//                                         });
//                                         return 'اكتب شيئا';
//                                       } else
//                                         setState(() {
//                                           TextError = false;
//                                         });
//                                     },
//                                   ),
//                                 )),
//
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                         SizedBox(height: typeButtonHeight()),
//                         Next('متابعة')
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       } else {
//         return const Text('Nothing more to Show');
//       }
//     }
//
//     return Scaffold(
//       backgroundColor: Obackground,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.black.withOpacity(HeadOpacity),
//         centerTitle: true,
//         elevation: 0,
//         title: Text(
//           'أسلوب الشحن',
//           style: TextStyle(
//               fontSize: 18,
//               fontFamily: 'Montserrat',
//               color: ATcolor,
//               fontWeight: FontWeight.w400),
//         ),
//         actions: [
//           SizedBox(
//             height: 52,
//             width: 52,
//             child: Container(
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: HeadOpacity == 0
//                       ? Colors.white
//                       : Colors.black
//                           .withOpacity(HeadOpacity * 0.00000000000000001)),
//               child: IconButton(
//                 color: const Color(0xff323232),
//                 icon: const Icon(CupertinoIcons.chevron_forward),
//                 iconSize: 25,
//                 onPressed: () {
//                   HeadOpacity == 0 ? Get.back() : null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(width: 20),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: SlidingUpPanel(
//           controller: panelController,
//           minHeight: 0,
//           maxHeight: MaxHe,
//           backdropEnabled: true,
//           backdropOpacity: 0.3,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
//           backdropTapClosesPanel: true,
//           isDraggable: true,
//           onPanelSlide: (value) {
//             setState(() {
//               HeadOpacity = value * 0.3;
//             });
//           },
//           body: Padding(
//             padding: const EdgeInsets.only(left: 37, right: 37),
//             child: SizedBox(
//               width: double.infinity,
//               child: Stack(
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       //Truck Image
//                       Container(
//                           alignment: Alignment.center,
//                           child: Image.network(widget!.data!.sPic!,
//                               height:
//                                   MediaQuery.of(context).size.height * 0.25)),
//
//                       //Truck name
//                        Text(
//                         widget!.data!.sName!,
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             fontSize: 22,
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black),
//                       ),
//
//                       //Truck text
//                       Padding(
//                         padding: const EdgeInsets.only(top: 16, bottom: 24),
//                         child: Container(
//                             width:
//                                 MediaQuery.of(context).size.width - (70 + 33),
//                             child:  Text(
//                               widget!.data!.sDesc!,
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontFamily: 'Montserrat',
//                                   fontWeight: FontWeight.w200,
//                                   color: Color(0xff868686)),
//                               textAlign: TextAlign.end,
//                             )),
//                       ),
//
//                       //Thin line
//                       // Container(
//                       //   width: double.infinity,
//                       //   height: 2,
//                       //   color: const Color(0xffF2F1F4),
//                       // ),
//
//                       //شكل الشاحنة
//                       // InkWell(
//                       //   child: Options(Trtext(_trShape), Tricon(_trShape),
//                       //       Trarrow(_trShape)),
//                       //   onTap: () {
//                       //     vicle = Trtext(_trShape);
//                       //     setState(() {
//                       //       MaxHe = 400;
//                       //       panelController.open();
//                       //       ParaType = "trShape";
//                       //     });
//                       //   },
//                       // ),
//
//                       Container(
//                         width: double.infinity,
//                         height: 2,
//                         color: const Color(0xffF2F1F4),
//                       ),
//
//                       //نوع الشاحنة
//                       Container(
//                         height: 50,
//                         width: MediaQuery.of(context).size.width,
//                         child: InkWell(
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 15.0),
//                             child: Text('شكل الشاحنه',
//                                 style: const TextStyle(
//                                     fontSize: 14,
//                                     fontFamily: 'Montserrat',
//                                     fontWeight: FontWeight.w300,
//                                     color: Color(0xff191F28)),
//                               textAlign: TextAlign.end,),
//                           ),
//                           onTap: () {
//    showCupertinoModalPopup(
//     context: context,
//     builder: (BuildContext builder){
//     return CupertinoPopupSurface(
//     isSurfacePainted: false,
//     child: Material(
//     child:vicles(viecle!)));});
//                             setState(() {
//                               MaxHe = 450;
//                               // panelController.open();
//                                ParaType = "TRtype";
//                             });
//                           },
//                         ),
//                       ),
//
//                       Container(
//                         width: double.infinity,
//                         height: 2,
//                         color: const Color(0xffF2F1F4),
//                       ),
//
//                       //نوع الحمولة
//                       InkWell(
//                         child: Options(PayloadText(_payload),
//                             payloadIcon(_payload), Trarrow(_payload)),
//                         onTap: () {
//                           setState(() {
//                             MaxHe = 700;
//                             panelController.open();
//                             ParaType = "payload";
//                           });
//                         },
//                       ),
//
//                       Container(
//                         width: double.infinity,
//                         height: 2,
//                         color: const Color(0xffF2F1F4),
//                       ),
//
//                       //التوقيت
//                       InkWell(
//                         child: OptionsTime(TimeText(_time), TimeIcon(_time),
//                             TimeNum(_time), DateTime(_date)),
//                         onTap: () {
//                           setState(() {
//                             MaxHe = 780;
//                             panelController.open();
//                             ParaType = "time";
//                           });
//                         },
//                       ),
//
//                       Container(
//                         width: double.infinity,
//                         height: 2,
//                         color: const Color(0xffF2F1F4),
//                       ),
//
//                       //Note to the Driver
//                       InkWell(
//                         child: Options(
//                             NoteText(_note), NoteIcon(_note), Notearrow(_note)),
//                         onTap: () {
//                           setState(() {
//                             MaxHe = 500;
//                             panelController.open();
//                             ParaType = "note";
//                           });
//                         },
//                       ),
//
//                       Container(
//                         width: double.infinity,
//                         height: 2,
//                         color: const Color(0xffF2F1F4),
//                       ),
//
//                       SizedBox(
//                         height: lastButtonHeight(),
//                       ),
//
//                       Confirm('متابعة'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           panel: Type(ParaType),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as itl;
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/logic/viecles/viecles_provider.dart';
import '../../models/viecelModel/viecleModel.dart';
import '../../models/viecle_model.dart';
import '../../others/variables.dart';
import '../Navigation_bar/PickupPlace.dart';

class chooseExtentions extends StatefulWidget {
  Viecle data;

  // var latU1;
  // var lngU1;
  // var latU2;
  // var lngU2;
  chooseExtentions(this.data);

  @override
  State<chooseExtentions> createState() => _chooseExtentionsState();
}

class _chooseExtentionsState extends State<chooseExtentions> {
  List<viecleModel>? viecle;
  int? trilerId;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VieclesProvider>(context, listen: false).getViecle();
      Provider.of<VieclesProvider>(context, listen: false).getVieclesTypes();
      Provider.of<VieclesProvider>(context, listen: false).getTrailersTypes();
    });
    // TODO: implement initState

    super.initState();
    trilerId = widget.data.id;
    // latU1 = widget.latU1;
  }

  String? vicle;
  int? vicleId;
  double HeadOpacity = 0;

  final formKey = GlobalKey<FormState>();

  DateRangePickerController _datePickerController = DateRangePickerController();

  //Functions

  //Last Height Function
  double lastButtonHeight() {
    if (MediaQuery.of(context).size.height > 828) {
      return MediaQuery.of(context).size.height * 0.14;
    } else if (MediaQuery.of(context).size.height > 700) {
      return MediaQuery.of(context).size.height * 0.05;
    } else {
      return MediaQuery.of(context).size.height * 0.02;
    }
  }

  //Last Height Function
  double timeButtonHeight() {
    if (MediaQuery.of(context).size.height > 800) {
      return MediaQuery.of(context).size.height * 0.1;
    } else if (MediaQuery.of(context).size.height > 700) {
      return MediaQuery.of(context).size.height * 0.04;
    } else {
      return MediaQuery.of(context).size.height * 0.00;
    }
  }

  //Last Height Function
  double typeButtonHeight() {
    if (MediaQuery.of(context).size.height > 800) {
      return MediaQuery.of(context).size.height * 0.03;
    } else if (MediaQuery.of(context).size.height > 700) {
      return MediaQuery.of(context).size.height * 0.01;
    } else {
      return MediaQuery.of(context).size.height * 0.02;
    }
  }

  final _noteText = TextEditingController();

  //Variables
  int _time = 10;
  int _date = 10;
  int _note = 10;
  String TheNote = '';
  bool AllSelected = false;
  bool TextError = false;

  final now = new DateTime.now();

  late int Currenthour = int.parse(itl.DateFormat('H').format(now));
  late int Currentminute = int.parse(itl.DateFormat('m').format(now));

  late int hour = int.parse(itl.DateFormat('H').format(now));
  late int minute = int.parse(itl.DateFormat('m').format(now));

  late String year = now.year.toString();
  late int month = now.month;
  late int day = now.day;

  double MaxHe = 450;
  String ParaType = '';
  final panelController = PanelController();
  bool isfull = false;
  int? VecleId;

  String TitleNote(String note, {int limit = 30}) {
    return note.length >= limit ? note.substring(0, limit) + '...' : note;
  }

  // //Truck Shape Functions
  // String Tricon(int choice) {
  //   if (choice == 0) {
  //     return viecle![0].sPic!;
  //   } else if (choice == 1) {
  //     return viecle![1].sPic!;
  //   } else if (choice == 2) {
  //     return viecle![2].sPic!;
  //   } else {
  //     return 'IconTruck';
  //   }
  // }
  //
  // int num = 0;

  // String Trtext(int choice) {
  //   if (choice == 0) {
  //     setState(() {
  //       num = 1;
  //     });
  //
  //     return viecle![0].sName!;
  //   } else if (choice == 1) {
  //     setState(() {
  //       num = 2;
  //     });
  //     return viecle![1].sName!;
  //   } else if (choice == 2) {
  //     setState(() {
  //       num = 3;
  //     });
  //     return viecle![2].sName!;
  //   } else {
  //     return 'شكل الشاحنة';
  //   }
  // }
  //
  // //Truck type
  // // funtcionts
  // String TypeIcon(int choice) {
  //   if (choice == 0) {
  //     return 'Aired';
  //   } else if (choice == 1) {
  //     return 'Snow';
  //   } else if (choice == 2) {
  //     return 'Dry';
  //   } else {
  //     return 'IconTruCkFront';
  //   }
  // }
  //
  // String Typetext(int choice) {
  //   if (choice == 0) {
  //     return 'شاحنه مبردة';
  //   } else if (choice == 1) {
  //     return 'شاحنة مثلجة';
  //   } else if (choice == 2) {
  //     return 'شاحنة جافة';
  //   } else {
  //     return 'نوع الشاحنة';
  //   }
  // }

  //Payload Type funtions
  String payloadIcon(int choice) {
    if (choice == 0) {
      return 'med';
    } else if (choice == 1) {
      return 'food';
    } else if (choice == 2) {
      return 'metal';
    } else if (choice == 3) {
      return 'package';
    } else if (choice == 4) {
      return 'cattle';
    } else if (choice == 5) {
      return 'others';
    } else {
      return 'IconOrder';
    }
  }

  String PayloadText(int choice) {
    if (choice == 0) {
      return 'حمولة أدوية';
    } else if (choice == 1) {
      return 'حمولة اطعمة';
    } else if (choice == 2) {
      return 'حمولة حديد ';
    } else if (choice == 3) {
      return 'حمولة بضائع';
    } else if (choice == 4) {
      return 'حمولة مواشي';
    } else if (choice == 5) {
      return 'خاص (أخرى)';
    } else {
      return 'نوع الحمولة';
    }
  }

  //Time Functions
  Object TimeText(int choice) {
    if (choice == 10) {
      return 'التوقيت';
    } else {
      return '';
    }
  }

  String TimeIcon(int choice) {
    if (choice == 10) {
      return 'IconTime';
    } else {
      return 'StrongTime';
    }
  }

  bool TimeNum(int choice) {
    if (choice == 10) {
      return true;
    } else {
      return false;
    }
  }

  //Note Functions
  String NoteText(int choice) {
    if (choice == 10 || TheNote.isEmpty) {
      return 'ملاحظة للسائق';
    } else if (choice == 3) {
      setState(() {
        botton = true;
      });
      return TheNote;
    }
    setState(() {
      botton = true;
    });
    print(botton);
    return TheNote;
  }

  String NoteIcon(int choice) {
    if (choice == 10 || TheNote.isEmpty) {
      return 'IconTime';
    } else {
      return 'StrongTime';
    }
  }

  bool Notearrow(int choice) {
    if (choice == 10) {
      return true;
    } else {
      return false;
    }
  }

  bool? botton = false;

  //Arrow Option
  bool Trarrow(int choice) {
    if (choice == 10) {
      return true;
    } else {
      return false;
    }
  }

  //Time Correction function
  String Fhour(int hour) {
    if (hour < 10) {
      return '0' + hour.toString();
    } else {
      return hour.toString();
    }
  }

  String Fminute(int minute) {
    if (minute < 10) {
      return '0' + minute.toString();
    } else {
      return minute.toString();
    }
  }

  //Time Selection Option
  void pickValue() {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(21.0))),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(21)),
                alignment: Alignment.center,
                height: 290,
                width: 378,
                child: InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Hour - minute text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'الساعة',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Araboto',
                              color: Color(0xff868686),
                            ),
                          ),
                          const Text(
                            'الدقيقة',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Araboto',
                              color: Color(0xff868686),
                            ),
                          ),
                        ],
                      ),

                      //Hour - minute Slider
                      Row(
                        children: [
                          //Hour Slider
                          Expanded(
                            child: NumberPicker(
                                selectedTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 76,
                                    fontFamily: 'circular std'),
                                textStyle: const TextStyle(
                                    color: Color(0xffB9B9B9),
                                    fontSize: 64,
                                    fontFamily: 'circular std'),
                                value: hour,
                                minValue: 00,
                                maxValue: 23,
                                step: 1,
                                zeroPad: true,
                                infiniteLoop: true,
                                itemHeight: 80,
                                itemWidth: double.infinity,
                                itemCount: 3,
                                onChanged: (value) {
                                  setState(() => hour =
                                      value); // to change on widget level state
                                  SBsetState(() => hour =
                                      value); //* to change on dialog state
                                }),
                          ),

                          //Minute Slider
                          Expanded(
                            child: NumberPicker(
                                selectedTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 76,
                                    fontFamily: 'circular std'),
                                textStyle: const TextStyle(
                                    color: Color(0xffB9B9B9),
                                    fontSize: 64,
                                    fontFamily: 'circular std'),
                                value: minute,
                                minValue: 00,
                                maxValue: 59,
                                step: 1,
                                zeroPad: true,
                                infiniteLoop: true,
                                itemHeight: 80,
                                itemWidth: double.infinity,
                                itemCount: 3,
                                onChanged: (value) {
                                  setState(() => minute =
                                      value); // to change on widget level state
                                  SBsetState(() => minute =
                                      value); //* to change on dialog state
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              );
            }),
            actions: [],
          );
        });
  }

  //Date Selection Function
  void _onDateSelectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    setState(() {
      year = dateRangePickerSelectionChangedArgs.value.year.toString();
      month = dateRangePickerSelectionChangedArgs.value.month;
      day = dateRangePickerSelectionChangedArgs.value.day;
    });
    print(year + ',' + month.toString() + ',' + day.toString());
  }

  //Options Tab
  Widget Options(String title) {
    return Container(
      width: double.infinity,
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 24,
              width: 24,
              alignment: Alignment.center,
              child: Container()),
          Expanded(
              child: Text(
            title,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                color: Color(0xff191F28)),
          )),
          // Padding(
          //   padding: const EdgeInsets.only(right: 9, left: 16),
          //   child:
          //       Image.asset( 'assets/pics/$Icon.png', width: 24, height: 24),
          // ),
        ],
      ),
    );
  }

  String SayDate(String day, String month, String year) {
    if (day != '' && month != '' && year != '')
      return year + '-' + month + '-' + day;
    else
      return '';
  }

  //Time Options Tab
  Widget OptionsTime(Object title, String Icon, bool selected, DateTime date) {
    return Container(
      width: double.infinity,
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: selected ? 24 : 60,
              width: selected ? 24 : 60,
              alignment: Alignment.center,
              child: selected
                  ? Image.asset(
                      'assets/pics/SmallLeftArrow.png',
                      width: 12,
                      height: 12,
                    )
                  : Text(
                      '${Fhour(hour)}:${Fminute(minute)}',
                      style: const TextStyle(
                          fontSize: 12, fontFamily: 'visbydemibold'),
                    )),
          selected
              ? Container()
              : Text('/${Fhour(day)}.${Fhour(month)}.$year',
                  style: const TextStyle(
                      fontSize: 12, fontFamily: 'visbydemibold')),
          Expanded(
              child: Text(
            title.toString(),
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                color: Color(0xff191F28)),
          )),
          Padding(
            padding: const EdgeInsets.only(right: 9, left: 2),
            child: Image.asset('assets/pics/$Icon.png', width: 24, height: 24),
          ),
        ],
      ),
    );
  }

  //Button
  Widget Next(String par) => MaterialButton(
        color: Color(0xff42484F),
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

          setState(() {
            if (ParaType == 'time') {
              _time = 1;
              time = [
                '$year-${Fhour(month)}-${Fhour(day)}',
                '${Fhour(hour)}:${Fminute(minute)}',
                ''
              ];
            } else if (ParaType == 'note') {
              if (formKey.currentState!.validate()) {
                note = _noteText.text;
                //Test
                TheNote = TitleNote(note, limit: 35);
                //print('All good');
              } else {
                //print('Something Wrong');
                return null;
              }
            }
            panelController.isPanelOpen ? panelController.close() : null;
          });
        },
      );

  Widget Confirm(String par) => MaterialButton(
        color: botton == true ? On : Color(0xff42484F),
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

          if (_time != 10 &&
              selectedTrillaTypeId != 0 &&
              selectedTruckTypeId != 0 &&
              selectedTruckId != 0) {
            Get.to(
              () => pickupPlace(
                  TheNote,
                  time,
                  selectedTrillaTypeId,
                  selectedTruckId,
                  selectedTruckName,
                  selectedTruckId,
                  trilerId!),
              transition: Transition.rightToLeft,
            );
          }
        },
      );
  int selectedTruckId = 0;
  String selectedTruckName = "شكل الشاحنه";
  int selectedTruckTypeId = 0;
  String selectedTruckTypeName = "نوع الشاحنة";
  int selectedTrillaTypeId = 0;
  String selectedTrillaTypeName = "نوع الحموله";

  //Slide Up panel content
  Widget Type(String type) {
    if (type == 'trShape') {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        child: AnimatedContainer(
                          height: 80,
                          alignment: Alignment.centerLeft,
                          duration: const Duration(milliseconds: 250),
                          decoration: BoxDecoration(
                            color: Provider.of<VieclesProvider>(context)
                                        .viecles[index]
                                        .id ==
                                    selectedTruckId
                                ? const Color(0xffEEEEEE)
                                : const Color(
                                    0xffFFFFFF), //Original listtile Color
                            //color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(13.0)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  // mainAxisAlignment:
                                  // MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //Title
                                    Text(
                                      Provider.of<VieclesProvider>(context)
                                              .viecles[index]
                                              .sName ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff191F28),
                                      ),
                                    ),

                                    //SizedBox
                                    const SizedBox(height: 5),

                                    //SubText
                                    Text(
                                      Provider.of<VieclesProvider>(context)
                                              .viecles[index]
                                              .sDesc! ??
                                          '',
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
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
                                padding: const EdgeInsets.all(14.0),
                                child: Container(
                                  width: 55,
                                  height: 49,
                                  decoration: const BoxDecoration(
                                    //color: Colors.transparent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  alignment: Alignment.center,

                                  //Image
                                  child: Image.network(
                                    Provider.of<VieclesProvider>(context)
                                        .viecles[index]
                                        .sPic!,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTruckName = Provider.of<VieclesProvider>(
                                    context,
                                    listen: false)
                                .viecles[index]
                                .sName!;
                            selectedTruckId = Provider.of<VieclesProvider>(
                                    context,
                                    listen: false)
                                .viecles[index]
                                .id!;
                          });
                        },
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemCount:
                      Provider.of<VieclesProvider>(context).viecles.length),
            ),
            const SizedBox(
              height: 20,
            ),
            Next('متابعة'),
          ],
        ),
      );
    } else if (type == 'TRtype') {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        child: AnimatedContainer(
                          height: 80,
                          alignment: Alignment.centerRight,
                          duration: const Duration(milliseconds: 250),
                          decoration: BoxDecoration(
                            color: Provider.of<VieclesProvider>(context)
                                        .vieclesTypes[index]
                                        .id ==
                                    selectedTruckTypeId
                                ? const Color(0xffEEEEEE)
                                : const Color(
                                    0xffFFFFFF), //Original listtile Color
                            //color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(13.0)),
                          ),
                          child: //Title
                              Text(
                            Provider.of<VieclesProvider>(context)
                                    .vieclesTypes[index]
                                    .sName ??
                                '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191F28),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTruckTypeName =
                                Provider.of<VieclesProvider>(context,
                                        listen: false)
                                    .vieclesTypes[index]
                                    .sName!;
                            selectedTruckTypeId = Provider.of<VieclesProvider>(
                                    context,
                                    listen: false)
                                .vieclesTypes[index]
                                .id!;
                          });
                        },
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemCount: Provider.of<VieclesProvider>(context)
                      .vieclesTypes
                      .length),
            ),
            const SizedBox(
              height: 20,
            ),
            Next('متابعة'),
          ],
        ),
      );
    } else if (type == 'payload') {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        child: AnimatedContainer(
                          height: 80,
                          alignment: Alignment.centerLeft,
                          duration: const Duration(milliseconds: 250),
                          decoration: BoxDecoration(
                            color: Provider.of<VieclesProvider>(context)
                                        .trailersTypes[index]
                                        .id ==
                                    selectedTrillaTypeId
                                ? const Color(0xffEEEEEE)
                                : const Color(
                                    0xffFFFFFF), //Original listtile Color
                            //color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(13.0)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  // mainAxisAlignment:
                                  // MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //Title
                                    Text(
                                      Provider.of<VieclesProvider>(context)
                                              .trailersTypes[index]
                                              .sName ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff191F28),
                                      ),
                                    ),

                                    //SizedBox
                                    const SizedBox(height: 5),

                                    //SubText
                                    Text(
                                      Provider.of<VieclesProvider>(context)
                                              .trailersTypes[index]
                                              .sDesc! ??
                                          '',
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
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
                                padding: const EdgeInsets.all(14.0),
                                child: Container(
                                  width: 55,
                                  height: 49,
                                  decoration: const BoxDecoration(
                                    //color: Colors.transparent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  alignment: Alignment.center,

                                  //Image
                                  child: Image.network(
                                    Provider.of<VieclesProvider>(context)
                                        .trailersTypes[index]
                                        .sPic!,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTrillaTypeName =
                                Provider.of<VieclesProvider>(context,
                                        listen: false)
                                    .trailersTypes[index]
                                    .sName!;
                            selectedTrillaTypeId = Provider.of<VieclesProvider>(
                                    context,
                                    listen: false)
                                .trailersTypes[index]
                                .id!;
                          });
                        },
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemCount: Provider.of<VieclesProvider>(context)
                      .trailersTypes
                      .length),
            ),
            const SizedBox(
              height: 20,
            ),
            Next('متابعة'),
          ],
        ),
      );
    } else if (type == 'time') {
      return ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 33,
              right: 33,
            ),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height == 667
                                  ? 0
                                  : 9,
                              bottom: 26),
                          child: Container(
                            width: 58,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),

                        //title
                        Container(
                          width: double.infinity,
                          child: const Text(
                            'التوقيت',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 24, fontFamily: 'ArabotoFat'),
                          ),
                        ),

                        const SizedBox(height: 5),

                        //Subtitle
                        Container(
                          width: double.infinity,
                          child: const Text(
                            'اختر توقيت الشحنة الخاصة بك متى تريد أن تؤخد لنقل',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Araboto',
                              color: Color(0xff868686),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        //Calendar Screen
                        Container(
                          alignment: Alignment.center,
                          height: 69,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xffC3CAD3),
                              width: 2,
                            ),
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.only(right: 17, bottom: 30),
                            title: const Text(
                              'اختر توقيت الشحن',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Araboto',
                                color: Color(0xff868686),
                              ),
                            ),
                            subtitle: Text(
                              '${Fhour(day)}.${Fhour(month)}.$year',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'ArabotoFat',
                                color: Colors.black,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xffA7AFBA),
                              size: 20,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        //Calendar
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: 317,
                          decoration: BoxDecoration(
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(12.8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SfDateRangePicker(
                              initialSelectedDate: DateTime.now(),
                              minDate: DateTime.now(),
                              initialDisplayDate: DateTime.now(),
                              selectionShape:
                                  DateRangePickerSelectionShape.rectangle,
                              showNavigationArrow: true,
                              headerStyle: const DateRangePickerHeaderStyle(
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  color: Color(0xff141414),
                                  fontFamily: 'lexend',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19.2,
                                ),
                              ),
                              monthViewSettings:
                                  const DateRangePickerMonthViewSettings(
                                      showTrailingAndLeadingDates: true,
                                      firstDayOfWeek: 7,
                                      numberOfWeeksInView: 6,
                                      dayFormat: 'E',
                                      viewHeaderStyle:
                                          DateRangePickerViewHeaderStyle(
                                              textStyle: TextStyle(
                                        color: Color(0xff141414),
                                        fontFamily: 'lexend',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.4,
                                      ))),
                              monthCellStyle: DateRangePickerMonthCellStyle(
                                  trailingDatesTextStyle: TextStyle(
                                    fontFamily: 'lexend',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.4,
                                    color: const Color(0xff001754)
                                        .withOpacity(0.15),
                                  ),
                                  trailingDatesDecoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(4.8),
                                  ),
                                  leadingDatesDecoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(4.8),
                                  ),
                                  leadingDatesTextStyle: TextStyle(
                                    fontFamily: 'lexend',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.4,
                                    color: const Color(0xff001754)
                                        .withOpacity(0.15),
                                  ),
                                  cellDecoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.8),
                                  ),
                                  selectionTextStyle: const TextStyle(
                                    fontFamily: 'lexend',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.4,
                                    color: Colors.white,
                                  ),
                                  todayTextStyle: const TextStyle(
                                    fontFamily: 'lexend',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.4,
                                    color: Color(0xff1F1F1F),
                                  ),
                                  textStyle: const TextStyle(
                                    fontFamily: 'lexend',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.4,
                                    color: Color(0xff1F1F1F),
                                  )),
                              backgroundColor: const Color(0xffF5F5F5),
                              controller: _datePickerController,
                              onSelectionChanged: _onDateSelectionChanged,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 69,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: const Color(0xffC3CAD3),
                                width: 2,
                              ),
                            ),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.only(right: 17, bottom: 30),
                              title: const Text(
                                'اختر الساعة',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Araboto',
                                  color: Color(0xff868686),
                                ),
                              ),
                              subtitle: Text(
                                '${Fhour(hour)}:${Fminute(minute)}',
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'ArabotoFat',
                                  color: Colors.black,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.access_alarm_outlined,
                                color: Color(0xffA7AFBA),
                                size: 20,
                              ),
                            ),
                          ),
                          onTap: () {
                            pickValue();
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),

                SizedBox(height: timeButtonHeight()),
                //todo:make sure to check this when u go to android

                Next('متابعة'),
              ],
            ),
          ),
        ],
      );
    } else if (type == 'note') {
      _note = 1;
      return ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 33,
              right: 33,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9, bottom: 10),
                  child: Container(
                    width: 58,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: const Text(
                          'أكتب تفاصيل طلبك (اختياري)',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Madani',
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Container(
                        width: double.infinity,
                        child: const Text(
                          'تفاصيل الطلب تساعد السائق على فهم دوره بشكل دقيق أثناء عملية التوصيل و العناية بالطلبية بشكل أفضل أثناء الشحن.',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Madani',
                              //fontWeight: FontWeight.w600,
                              color: Color(0xffA1A1A1)),
                        ),
                      ),

                      const SizedBox(height: 12),

                      //Context Input
                      Container(
                          height: 197,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: TextError ? 1.5 : 1,
                                color: TextError
                                    ? Colors.red
                                    : const Color(0x1a000000)),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffF8F8F8),
                          ),
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                              controller: _noteText,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 10, 10, 0),
                                hintText: 'أكتب شيئا',
                                hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w200),
                                hintTextDirection: TextDirection.rtl,
                              ),
                              maxLines: 11,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat'),

                              //Note is Optional so no need to check

                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  setState(() {
                                    TextError = false;
                                  });
                                  return 'اكتب شيئا';
                                } else
                                  setState(() {
                                    TextError = false;
                                  });
                              },
                            ),
                          )),

                      const SizedBox(height: 20),
                      SizedBox(height: typeButtonHeight()),
                      Next('متابعة')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return const Text('Nothing more to Show');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Obackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(HeadOpacity),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'أسلوب الشحن',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              color: ATcolor,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          SizedBox(
            height: 52,
            width: 52,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HeadOpacity == 0
                      ? Colors.white
                      : Colors.black
                          .withOpacity(HeadOpacity * 0.00000000000000001)),
              child: IconButton(
                color: const Color(0xff323232),
                icon: const Icon(CupertinoIcons.chevron_forward),
                iconSize: 25,
                onPressed: () {
                  HeadOpacity == 0 ? Get.back() : null;
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SlidingUpPanel(
            controller: panelController,
            minHeight: 0,
            maxHeight: MaxHe,
            backdropEnabled: true,
            backdropOpacity: 0.3,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            backdropTapClosesPanel: true,
            isDraggable: true,
            onPanelSlide: (value) {
              setState(() {
                HeadOpacity = value * 0.3;
              });
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 37, right: 37),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Truck Image
                    Container(
                        alignment: Alignment.center,
                        child: Image.network(widget.data.sPic!,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.car_crash),
                            height: MediaQuery.of(context).size.height * 0.25)),

                    //Truck name
                    Text(
                      widget.data.sName!,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),

                    //Truck text
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 24),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width - (70 + 33),
                          child: Text(
                            widget.data.sDesc!,
                            style: const TextStyle(
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w200,
                                color: Color(0xff868686)),
                            textAlign: TextAlign.end,
                          )),
                    ),

                    //Thin line
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: const Color(0xffF2F1F4),
                    ),

                    //شكل الشاحنة
                    InkWell(
                      child: Options(selectedTruckName),
                      onTap: () {
                        setState(() {
                          MaxHe = 570;
                          panelController.open();
                          ParaType = "trShape";
                        });
                      },
                    ),

                    Container(
                      width: double.infinity,
                      height: 2,
                      color: const Color(0xffF2F1F4),
                    ),

                    //نوع الشاحنة
                    InkWell(
                      child: Options(selectedTruckTypeName),
                      onTap: () {
                        setState(() {
                          MaxHe = 570;
                          panelController.open();
                          ParaType = "TRtype";
                        });
                      },
                    ),

                    Container(
                      width: double.infinity,
                      height: 2,
                      color: const Color(0xffF2F1F4),
                    ),

                    //نوع الحمولة
                    InkWell(
                      child: Options(selectedTrillaTypeName),
                      onTap: () {
                        setState(() {
                          MaxHe = 570;
                          panelController.open();
                          ParaType = "payload";
                        });
                      },
                    ),

                    Container(
                      width: double.infinity,
                      height: 2,
                      color: const Color(0xffF2F1F4),
                    ),

                    //التوقيت
                    InkWell(
                      child: OptionsTime(TimeText(_time), TimeIcon(_time),
                          TimeNum(_time), DateTime(_date)),
                      onTap: () {
                        setState(() {
                          MaxHe = 780;
                          panelController.open();
                          ParaType = "time";
                        });
                      },
                    ),

                    Container(
                      width: double.infinity,
                      height: 2,
                      color: const Color(0xffF2F1F4),
                    ),

                    //Note to the Driver
                    InkWell(
                      child: Options(NoteText(_note)),
                      onTap: () {
                        setState(() {
                          MaxHe = 550;
                          panelController.open();
                          ParaType = "note";
                        });
                      },
                    ),

                    Container(
                      width: double.infinity,
                      height: 2,
                      color: const Color(0xffF2F1F4),
                    ),

                    SizedBox(
                      height: lastButtonHeight(),
                    ),

                    Confirm('متابعة'),
                  ],
                ),
              ),
            ),
            panel: Type(ParaType),
          ),
        ),
      ),
    );
  }
}
