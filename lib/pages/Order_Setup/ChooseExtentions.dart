import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as itl;
import 'package:logist/core/utilities/dio_helper.dart';
import 'package:logist/widgets/Widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/logic/drivers/driver_provider.dart';
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
      // Provider.of<VieclesProvider>(context, listen: false).getViecle();
      // Provider.of<VieclesProvider>(context, listen: false).getVieclesTypes();
      // Provider.of<VieclesProvider>(context, listen: false).getTrailersTypes();
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
  int _timeEnd = 10;

  int _date = 10;
  int _dateEnd = 10;
  int _note = 10;
  String TheNote = '';
  bool AllSelected = false;
  bool TextError = false;

  final now = new DateTime.now();

  late int hour = int.parse(itl.DateFormat('H').format(now));
  late int minute = int.parse(itl.DateFormat('m').format(now));

  late String year = now.year.toString();
  late int month = now.month;
  late int day = now.day;
  late int hourE = int.parse(itl.DateFormat('H').format(now));
  late int minuteE = int.parse(itl.DateFormat('m').format(now));

  late String yearE = now.year.toString();
  late int monthE = now.month;
  late int dayE = now.day;

  double MaxHe = 450;
  String ParaType = '';
  final panelController = PanelController();
  bool isfull = false;
  int? VecleId;

  String TitleNote(String note, {int limit = 30}) {
    return note.length >= limit ? note.substring(0, limit) + '...' : note;
  }

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
      return 'تفاصيل طلبك';
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
  void pickValue(bool isEnd) {
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'الساعة',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Araboto',
                              color: Color(0xff868686),
                            ),
                          ),
                          Text(
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
                                value: isEnd ? hourE : hour,
                                minValue: 00,
                                maxValue: 23,
                                step: 1,
                                zeroPad: true,
                                infiniteLoop: true,
                                itemHeight: 80,
                                itemWidth: double.infinity,
                                itemCount: 3,
                                onChanged: (value) {
                                  setState(() => isEnd
                                      ? hourE
                                      : hour =
                                          value); // to change on widget level state
                                  SBsetState(() => isEnd
                                      ? hourE
                                      : hour =
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
                                value: isEnd ? minuteE : minute,
                                minValue: 00,
                                maxValue: 59,
                                step: 1,
                                zeroPad: true,
                                infiniteLoop: true,
                                itemHeight: 80,
                                itemWidth: double.infinity,
                                itemCount: 3,
                                onChanged: (value) {
                                  setState(() => isEnd
                                      ? minuteE
                                      : minute =
                                          value); // to change on widget level state
                                  SBsetState(() => isEnd
                                      ? minuteE
                                      : minute =
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
  }

  //Date Selection Function
  void _onDateSelectionChangedEnd(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    setState(() {
      yearE = dateRangePickerSelectionChangedArgs.value.year.toString();
      monthE = dateRangePickerSelectionChangedArgs.value.month;
      dayE = dateRangePickerSelectionChangedArgs.value.day;
    });
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
  Widget OptionsTime(
      Object title, String Icon, bool selected, DateTime date, bool isEnd) {
    return SizedBox(
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
                      '${Fhour(isEnd ? hourE : hour)}:${Fminute(isEnd ? minuteE : minute)}',
                      style: const TextStyle(
                          fontSize: 12, fontFamily: 'visbydemibold'),
                    )),
          selected
              ? Container()
              : Text(
                  '/${Fhour(isEnd ? dayE : day)}.${Fhour(isEnd ? monthE : month)}.${isEnd ? yearE : year}',
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
            } else if (ParaType == 'timeEnd') {
              _timeEnd = 1;
              timeEnd = [
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
              _timeEnd != 10 &&
              _noteText.text.isNotEmpty &&
              selectedTrillaTypeId != 0 &&
              selectedTruckTypeId != 0 &&
              selectedTruckId != 0) {
            Provider.of<DriversProvider>(context, listen: false)
                .getAllDrivers(
              trailerId: trilerId,
              trailerTypeId: selectedTrillaTypeId,
              vehicleId: selectedTruckId,
              vehicleTypeId: selectedTruckTypeId,
            )
                .then((value) {
              if (Provider.of<DriversProvider>(context, listen: false)
                  .driver
                  .isNotEmpty) {
                print(timeEnd.toString() + "a7a");
                Get.to(
                  () => pickupPlace(
                      TheNote,
                      time,
                      selectedTrillaTypeId,
                      selectedTruckId,
                      timeEnd,
                      selectedTruckName,
                      selectedTruckId,
                      trilerId!),
                  transition: Transition.rightToLeft,
                );
              } else {
                showToast("لايوجد سائقين بهذه المواصفات حاليا", true, false);
              }
            });
          } else {
            showToast("تأكد من ملئ جميع الخانات", true, false);
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    child: SimplePicNetwork(
                                        Provider.of<VieclesProvider>(context)
                                            .viecles[index]
                                            .sPic!,
                                        40,
                                        40)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Provider.of<VieclesProvider>(context, listen: false)
                              .setTruck(Provider.of<VieclesProvider>(context,
                                      listen: false)
                                  .viecles[index]);
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
                          padding: EdgeInsets.all(10),
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
                          Provider.of<VieclesProvider>(context, listen: false)
                              .setTruckType(Provider.of<VieclesProvider>(
                                      context,
                                      listen: false)
                                  .vieclesTypes[index]);
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                          Provider.of<VieclesProvider>(context, listen: false)
                              .setTrailerType(Provider.of<VieclesProvider>(
                                      context,
                                      listen: false)
                                  .trailersTypes[index]);
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
                            'توقيت استلام الشحنة',
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
                            pickValue(false);
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
    } else if (type == 'timeEnd') {
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
                            'توقيت توصيل الشحنة',
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
                            'اختر توقيت الشحنة الخاصة بك متى تريد أن يتم توصيلها',
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
                              '${Fhour(dayE)}.${Fhour(monthE)}.$yearE',
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
                              onSelectionChanged: _onDateSelectionChangedEnd,
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
                                '${Fhour(hourE)}:${Fminute(minuteE)}',
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
                            pickValue(true);
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
                          'أكتب تفاصيل طلبك',
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
                          MaxHe = MediaQuery.of(context).size.height * 0.75;
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
                          MaxHe = MediaQuery.of(context).size.height * 0.75;
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
                          MaxHe = MediaQuery.of(context).size.height * 0.75;
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
                      child: OptionsTime("توقيت الاستلام", TimeIcon(_time),
                          TimeNum(_time), DateTime(_date), false),
                      onTap: () {
                        setState(() {
                          MaxHe = MediaQuery.of(context).size.height * 1;
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
                    // التوقيت تسليم
                    InkWell(
                      child: OptionsTime("توقيت التوصيل", TimeIcon(_timeEnd),
                          TimeNum(_timeEnd), DateTime(_dateEnd), true),
                      onTap: () {
                        setState(() {
                          MaxHe = MediaQuery.of(context).size.height * 1;
                          panelController.open();
                          ParaType = "timeEnd";
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
                          MaxHe = MediaQuery.of(context).size.height * 0.70;
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
