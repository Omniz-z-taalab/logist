import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import '../Order_Setup/OrderMap.dart';
import '../Order_Setup/messages.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Details.dart';


class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {



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

      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
        child: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Column(
                    children: [
                      Profile_pic(),

                      //Driver Name
                      Text(
                        'محمد علي كلاي',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 10),

                      //Truck name
                      Text(
                        'سائق شاحنة (TESLA)',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: Color(0xff909090)
                        ),
                      ),

                      SizedBox(height: 20),
                      //Rating
                      rating(),

                      SizedBox(height: 20),

                      //Truck Info
                      truck('شاحنة TRILLA',' 71007120',' S A S / 816','assets/pics/trALX.png'),

                      SizedBox(height: 20),

                      //Order Info
                      Approvement('تم قبول الطلب','الحالة سليمة تمت الموافقة على طلبك من طرف السائق'),

                      SizedBox(height: 20),


                      //Order Status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Order Button
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31)),
                              color: Color(0xff191F28),

                              child: Text(
                                'إلغاء الطلب',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'Araboto',
                                    color: Colors.white
                                ),
                              ),
                              onPressed: (){

                              }
                          ),

                          //Order Status
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'حالة الطلب',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      color: Color(0xff191F28)
                                  ),
                                ),
                                Text(
                                  'لم يتم نقل الشحنة إلى الآن',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff969696),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Accepted / refused
                          Container(
                              alignment: Alignment.center,
                              height: 23,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(13)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 11,
                                    width: 11,
                                    decoration: BoxDecoration(
                                        color: Color(0xff191F28),
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                  Text(
                                    'مقبولة',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      )


                    ],
                  ),










                ],
              ),

              Positioned(
                bottom: 10,
                child: Column(
                  children: [
                    MaterialButton(

                      height: 66,
                      minWidth:  MediaQuery.of(context).size.width - 60,
                      color: const Color(0xff191F28),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(37.5),
                        side: BorderSide(color: Theme.of(context).primaryColor),
                      ),


                      child: const Text(
                        'تواصل مع السائق',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: (){
                        // Get.to(
                        //     () => conversation(),
                        //     transition: Transition.rightToLeft
                        // );
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }

  Widget DriverPage(){
    return Column(
      children: [
        Profile_pic(),

        //Driver Name
        Text(
          'محمد علي كلاي',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 10),

        //Truck name
        Text(
          'سائق شاحنة (TESLA)',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
              color: Color(0xff909090)
          ),
        ),

        //Approvement('تم قبول الطلب','الحالة سليمة تمت الموافقة على طلبك من طرف السائق'),

        rating(),

        //Truck Info
        truck('شاحنة TRILLA',' 71007120',' S A S / 816','assets/pics/trALX.png'),

      ],
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
                child: Image.asset('assets/pics/user7.png',)),
          ),

          //to add space
          const SizedBox(height: 10),


        ],
      ),
    );

  }


  Approvement(var title,var subtitle)  {

    return SizedBox(
      width: MediaQuery.of(context).size.width-50,
      height: 63,
      child: ListTile(

        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontFamily: 'Araboto',fontWeight: FontWeight.w500,color: Color(0xff191F28)),
          textDirection: TextDirection.rtl,
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              fontSize: 10, fontFamily: 'Araboto', color: Color(0xff969696)),
          textDirection: TextDirection.rtl,
        ),
        trailing: const Icon(CupertinoIcons.checkmark_alt_circle_fill,size: 42,color: Color(0xff004440),),
      ),
    );

  }

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
        trailing: Image.asset(image,width: 40,),
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
      Get.to(details());

    },
  );



}
