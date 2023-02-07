import 'package:flutter/cupertino.dart';
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:logist/others/variables.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {

  // Panel Controller
  final ApanelController = PanelController();

  //Icon Functions

    //Truck Shape
    String Tricon(int choice){

      if (choice == 0 )
        return 'trALX';
      else if (choice == 1)
        return 'trOPEN';
      else if (choice == 2)
        return 'Bigtr';
      else
        return 'IconTruck';
    }

    //Truck Type
    String TypeIcon(int choice){

      if (choice == 0 )
        return 'Aired';
      else if (choice == 1)
        return 'Snow';
      else if (choice == 2)
        return 'Dry';
      else
        return 'IconTruCkFront';

    }

    //Load Type
    String PayloadIcon(int choice){
      if(choice == 0)
        return 'med';
      else if (choice == 1)
        return 'food';
      else if( choice == 2)
        return 'metal';
      else if (choice == 3)
        return 'package';
      else if (choice == 4)
        return 'cattle';
      else if(choice == 5)
        return 'others';
      else
        return 'IconOrder';
    }




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

      body: SlidingUpPanel(
      controller: ApanelController,
      maxHeight: 540,
      minHeight: 0,
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),

      body: SizedBox(
          height: double.infinity,

          child: Stack(

            children: [

              Positioned(
                bottom: 0,
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: const Color(0xffEDEDED),
                    ),

                    //Driver Name details
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: ListTile(

                        leading: SizedBox(
                          height: 52,
                          width: 52,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: IconButton(

                              color: const Color(0xff323232),
                              icon: const Icon(CupertinoIcons.chevron_back),
                              iconSize: 25,
                              onPressed: () {
                                print(MediaQuery.of(context).size.height);
                                ApanelController.open();
                              },
                            ),
                          ),
                        ),

                        title:  Text(
                          driverData[0],
                          style: TextStyle(fontSize: 16, fontFamily: 'ArabotoFat'),
                          textDirection: TextDirection.rtl,
                        ),

                        subtitle:  Text(
                          driverData[1],
                          style: TextStyle(
                              fontSize: 10, fontFamily: 'Araboto', color: Color(0xff909090)),
                          textDirection: TextDirection.rtl,
                        ),

                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child:  CircleAvatar(

                            backgroundImage: AssetImage(driverData[2]),
                          ),
                        ),
                      ),
                    ),

                    //to fix height problem
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    SizedBox(height: 15,),
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
                          ListView(Origine[0],Origine[1],'','','depart'),
                          Container(height: 1,color: const Color(0xffF2F1F4)),

                          //Arrive
                          ListView(Destination[0],Destination[1],'','','arriving'),
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
      panel: Container(
          height: 550,
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
                  driverData[0],
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 10),

                //Truck name
                Text(
                  driverData[1],
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      color: Color(0xff909090)
                  ),
                ),

                //Approvement('تم قبول الطلب','الحالة سليمة تمت الموافقة على طلبك من طرف السائق'),

                SizedBox(height: 10,),
                rating(),

                SizedBox(height: 10,),
                //Truck Info
                truck('شاحنة TRILLA',' 71007120',' S A S / 816','assets/pics/trALX.png'),

              ],
            ),
          ],
        ),
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

  //Profile picture
  Widget Profile_pic(){
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
                child: Image.asset(driverData[2],)),
          ),

          //to add space
          const SizedBox(height: 10),


        ],
      ),
    );

  }

  //Ratings widget
  rating(){
    return Container(
      //color: Colors.grey,
      height: 95,
      child:
      Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //Rating lines
            Container(
              height: 95,
              width:  (MediaQuery.of(context).size.width / 2) - (25+30),
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
              width:  (MediaQuery.of(context).size.width / 2) - (25+30),
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

                      Text('4.6',
                        style: TextStyle(
                            fontSize: 44,
                            fontFamily: 'circular std'
                        ),
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
                  Text('بناء على 300 مراجعة',
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
                      itemBuilder: (context, _) => Icon(Icons.star,color: Color(0xffF3B304)),
                      onRatingUpdate: (rating){

                      }

                  )

                ],

              ),
            )
          ],
        ),
      ),
    );

  }

  //Truck Place , license Widget
  truck(var title,var id,var plat,var image)  {

    return SizedBox(
      width: MediaQuery.of(context).size.width-50,
      height: 63,
      child: ListTile(

          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontFamily: 'Araboto',fontWeight: FontWeight.w500,color: Color(0xff191F28)),
            textDirection: TextDirection.rtl,
          ),

          subtitle:Row(
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

                        TextSpan(
                            text: '$plat /'
                        ),
                        const TextSpan(
                            text: 'رقم اللوحة '
                        )
                      ]))
            ],
          ),
          trailing: Image.asset(image,width: 33,)
      ),
    );
  }

  //Button Widget
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


    },
  );


}
