// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logist/others/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:logist/pages/My_orders/Details.dart';
import 'package:logist/pages/My_orders/OrderInfo.dart';
import 'package:logist/pages/My_orders/payloading.dart';
import 'package:logist/pages/Payments/PaymentSucess.dart';
import 'package:logist/pages/Payments/PaymentMethods.dart';


class resume extends StatefulWidget {
  const resume({Key? key}) : super(key: key);

  @override
  State<resume> createState() => _resumeState();
}

class _resumeState extends State<resume> {

  //Enable While Debugging

  // List<String> Origine = ['',''];
  // List<String> Destination = ['',''];
  // String distance = '13.6';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Obackground,

      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'ملخص',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Shamel',
            color: ATcolor,
          ),
        ),
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
                  Get.back();
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),

      body:
      SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: 28,
              child: Column(
                children: [

                  //Thine line
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: const Color(0xffEDEDED),
                  ),

                  //Final Price
                  SizedBox(
                    width: MediaQuery.of(context).size.width-50,
                    height: 100,
                    child: Center(
                      child: ListTile(

                        leading: Container(
                          alignment: Alignment.centerLeft,
                          width: 150,
                          child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: '261.96',
                                    style: TextStyle(
                                        fontFamily: 'visbydemibold',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff191F28))),
                                TextSpan(
                                    text: ' SAR',
                                    style: TextStyle(
                                        fontFamily: 'visbylight',
                                        fontSize: 18,
                                        color: Color(0xff191F28)))
                              ])),
                        ),

                        title: const Text(
                          'السعر النهائي',
                          style: TextStyle(fontSize: 13, fontFamily: 'Araboto'),
                          textDirection: TextDirection.rtl,
                        ),


                      ),
                    ),
                  ),

                  //Thin line
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 1,
                  //   color: const Color(0xffEDEDED),
                  // ),

                  //Driver Name
                  SizedBox(
                    width: MediaQuery.of(context).size.width-50,
                    height: 60,
                    child: Next('ادفع الآن'),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height-258,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width-50,
                    child: Column(
                      children: [
                        //Depart
                        ListView("Origine[0]","Origine[1]",'','','depart'),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Arrive
                        ListView("Destination[0]","Destination[1]",'','','arriving'),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Distance
                        ListView('مسافة نقل الشحنة','',distance.replaceAll('km', ''),'KM','distance'),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Truck name
                        ListView('شاحنة ALX','','','','trALX'),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Truck Shape
                        ListView(trShape[0],'','','',trShape[1]),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Truck Type
                        ListView(trType[0],'','','',trType[1]),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //load Type
                        ListView(loadType[0],'','','',loadType[1]),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Date and Time
                        ListView('اليوم','',time[1],time[2],'time'),
                        //Container(height: 1,color: const Color(0xffF2F1F4)),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }

  ListView(var title,var subtitle,var numb,var unit,var image)  {

    return SizedBox(
      width: MediaQuery.of(context).size.width-50,
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
          style: const TextStyle(fontSize: 15, fontFamily: 'Araboto',fontWeight: FontWeight.w500),
          textDirection: TextDirection.rtl,
        ),
        subtitle: subtitle == '' ? null : Text(
          subtitle,
          style: const TextStyle(
              fontSize: 10, fontFamily: 'Araboto', color: Color(0xff909090)),
          textDirection: TextDirection.rtl,
        ),
          trailing: Image.asset('assets/pics/$image.png',width: 33,)
      ),
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
      //Button destination
      Get.to(
          () => paymentMethods(),
          transition: Transition.rightToLeft

      );

      ;

    },
  );


}
