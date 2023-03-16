import 'package:flutter/cupertino.dart';

// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:logist/others/variables.dart';
import 'package:logist/pages/My_orders/Resume.dart';
import 'package:logist/pages/My_orders/TruckDrivers.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../models/viecelModel/viecleModel.dart';

class chooseDriver extends StatefulWidget {
  var lat1;
  var lat2;
  var lng1;
  var lng2;
  String noteText;
  int PayloadText;
  List<String> TimeNum;
  String Trtext;
  int Typetext;
  String placeuserpick1;
  String placeuserdown1;
  String placeuserpick2;
  String placeuserdown2;
  int vicleId;
  int trilerId;

  chooseDriver(
      this.lat1,
      this.lat2,
      this.lng1,
      this.lng2,
      this.noteText,
      this.PayloadText,
      this.TimeNum,
      this.Trtext,
      this.Typetext,
      this.placeuserpick1,
      this.placeuserdown1,
      this.placeuserpick2,
      this.placeuserdown2,
      this.vicleId,
      this.trilerId);

  @override
  State<chooseDriver> createState() => _chooseDriverState();
}

class _chooseDriverState extends State<chooseDriver> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.lat1);
    print(widget.lat2);
    print(widget.lng1);
    print(widget.lng2);
    print(widget.noteText);
    print(widget.PayloadText);
    print(widget.TimeNum);
    print(widget.Trtext);
    print(widget.Typetext);
    print('eeeeeeeeee');
    print(widget.PayloadText);
  }

  //Choose Button
  Widget Choose(String par, Color col, String Type) => MaterialButton(
        color: col,
        minWidth: double.infinity,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Container(
          child: Text(
            par,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: () async {
          //Button destination
          // Navigator.push<void>( context,  MaterialPageRoute<void>( builder: (BuildContext context) => const s1() ));
          //print('up'); //todo:Getback later
          if (Type == 'manual') {
            print('manual');
            Get.to(
                () => truckdrivers(
                    widget.lat1,
                    widget.lat2,
                    widget.lng1,
                    widget.lng2,
                    widget.noteText,
                    widget.PayloadText,
                    widget.TimeNum,
                    widget.Trtext,
                    widget.Typetext,
                    widget.placeuserpick1,
                    widget.placeuserdown1,
                    widget.placeuserpick2,
                    widget.placeuserdown2, widget.vicleId,
                widget.trilerId),
                transition: Transition.rightToLeft);
          }
          else if (Type == 'auto') {
             // Get.to(orderMap());
            setState(() {
              Clicked = true;
            });
            if (ApanelController.isPanelClosed) {
              await Future.delayed(const Duration(seconds: 5), () {
                ApanelController.open();
                setState(() {
                  Clicked = false;
                });
              });
            }

            //Get.to(resume());
            print('auto');
          }
        },
      );

  final ApanelController = PanelController();
  bool Clicked = false;

  //Slid up panel Data
  String Name = 'مصطفى نجيب';
  String Truck = 'Chevrolet Silverado 1500';
  String Pic = 'assets/pics/user5.png';
  String ratings = '4.3';
  String Reviews = '192';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Obackground,
      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        actions: [
          SizedBox(
            height: 52,
            width: 52,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: IconButton(
                color: const Color(0xff323232),
                icon: const Icon(CupertinoIcons.chevron_forward),
                iconSize: 25,
                onPressed: () {
                  print('Down');
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SlidingUpPanel(
        controller: ApanelController,
        maxHeight: 600,
        minHeight: 0,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  bottom: 80,
                  child: Column(
                    children: [
                      //Thine line
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: const Color(0xffEDEDED),
                      ),

                      //Manual Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Center(
                          child: Choose('اختيار يدوي', Colors.black, 'manual'),
                        ),
                      ),

                      //Auto Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 100,
                        child: Center(
                          child: Choose('اختيار التلقائي',
                              const Color(0xff2FBF71), 'auto'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 258,
                  //  heightheight: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 25),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 140,
                                      decoration: const BoxDecoration(
                                          color: Color(0xffF8F8F8),
                                          //   color: Colors.black12,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Clicked
                                            ? CircularProgressIndicator(
                                                //color: Color(0xffE1E1E1),
                                                color: Colors.black26,
                                              )
                                            : Icon(
                                                Icons.search,
                                                size: 90,
                                                color: Color(0xffE1E1E1),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'في إنتضار البحث عن سائق...',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'STC',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffC5C5C5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 235,
                                child: Text(
                                  'هل تود أن يتم اختيار السائق تلقائيا؟',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      height: 1.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        panel: Container(
          height: 600,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 25),

                  Container(
                    width: 58,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  SizedBox(height: 56),

                  //Driver Picture
                  Profile_pic(),

                  //Driver Name
                  Text(
                    Name,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 10),

                  //Truck name
                  Text(
                    Truck,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: Color(0xff909090)),
                  ),

                  //Approvement('تم قبول الطلب','الحالة سليمة تمت الموافقة على طلبك من طرف السائق'),

                  SizedBox(height: 10),

                  rating(),

                  //Truck Info
                  truck('شاحنة TRILLA', ' 71007120', ' S A S / 816',
                      'assets/pics/trALX.png'),
                ],
              ),
              Positioned(
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Next('أختر السائق')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView(var title, var subtitle, var numb, var unit, var image) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 63,
      child: ListTile(
          leading: Container(
            alignment: Alignment.centerLeft,
            width: 65,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '$numb ',
                  style: const TextStyle(
                      fontFamily: 'visbydemibold',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff191F28))),
              TextSpan(
                  text: unit,
                  style: const TextStyle(
                      fontFamily: 'visbylight',
                      fontSize: 12,
                      color: Color(0xff191F28)))
            ])),
          ),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Araboto',
                fontWeight: FontWeight.w500),
            textDirection: TextDirection.rtl,
          ),
          subtitle: subtitle == ''
              ? null
              : Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Araboto',
                      color: Color(0xff909090)),
                  textDirection: TextDirection.rtl,
                ),
          trailing: Image.asset(image, width: 33)),
    );
  }

  //Profile picture
  Widget Profile_pic() {
    return Container(
      child: Column(
        children: [
          //Image position
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xffECF4FD),
            ),
            width: 113,
            height: 113,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(Pic)),
          ),

          //to add space
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  rating() {
    return Container(
      //color: Colors.grey,
      height: 95,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Rating lines
            Container(
              height: 95,
              width: (MediaQuery.of(context).size.width / 2) - (25 + 30),
              //color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //5 Stars
                  LinearPercentIndicator(
                    isRTL: true,
                    width: 94.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '5 نجوم',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    alignment: MainAxisAlignment.center,
                    percent: 1,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),

                  //4 Stars
                  LinearPercentIndicator(
                    isRTL: true,
                    alignment: MainAxisAlignment.center,
                    width: 94.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '4 نجوم',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    percent: 0.35,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),

                  //3 Stars
                  LinearPercentIndicator(
                    isRTL: true,
                    alignment: MainAxisAlignment.center,
                    width: 94.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '3 نجوم',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    percent: 0.12,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),

                  //2 Stars
                  LinearPercentIndicator(
                    isRTL: true,
                    alignment: MainAxisAlignment.center,
                    width: 94.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '4 نجوم',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    percent: 0.1,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),

                  //1 Stars
                  LinearPercentIndicator(
                    width: 94.0,
                    alignment: MainAxisAlignment.center,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '1 نجمة',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    isRTL: true,
                    percent: 0.1,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),
                ],
              ),
            ),

            //Rating Data
            Container(
              // width:  (MediaQuery.of(context).size.width / 2) - (25+30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //todo: Complete the rating indicator
                // 3 Widgets Here
                children: [
                  //4.6 / 5
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ratings,
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'circular std'),
                      ),
                      Text(
                        '/5',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'circular std',
                          color: Color(0xffC2C2C2),
                        ),
                      )
                    ],
                  ),

                  //بناء على 300 مراجعة
                  Text(
                    'بناء على $Reviews مراجعة',
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w200,
                      color: Color(0xffC2C2C2),
                    ),

                    //Stars check Figma
                  ),

                  RatingBar.builder(
                      itemSize: 24,
                      initialRating: 5,
                      ignoreGestures: true,
                      textDirection: TextDirection.rtl,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Color(0xffF3B304)),
                      onRatingUpdate: (rating) {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  truck(var title, var id, var plat, var image) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 63,
      child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Araboto',
                fontWeight: FontWeight.w500,
                color: Color(0xff191F28)),
            textDirection: TextDirection.rtl,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        fontSize: 10,
                        fontFamily: 'Araboto',
                        color: Color(0xff969696),
                      ),
                      children: [
                    TextSpan(
                      text: '$id /',
                    ),
                    const TextSpan(
                      text: 'رقم الرخصة ',
                    ),
                  ])),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        fontSize: 10,
                        fontFamily: 'Araboto',
                        color: Color(0xff969696),
                      ),
                      children: [
                    TextSpan(text: '$plat /'),
                    const TextSpan(text: 'رقم اللوحة ')
                  ]))
            ],
          ),
          trailing: Image.asset(
            image,
            width: 33,
          )),
    );
  }

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
          driverData = [Name, Truck, Pic, ratings, Reviews];
          //Button destination
          // Get.to(() => ResumeScreen(), transition: Transition.rightToLeft);
        },
      );
}
