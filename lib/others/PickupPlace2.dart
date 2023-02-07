import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'TestPage3.dart';
import 'TextPage2.dart';
import 'variables.dart';
import '../pages/Order_Setup/ChooseExtentions.dart';


class package_place2 extends StatefulWidget {
  const package_place2({Key? key}) : super(key: key);

  @override
  State<package_place2> createState() => _package_place2State();
}



class _package_place2State extends State<package_place2> {
  int currentStep = 1;






  //Next Button
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
      // Navigator.push<void>( context,  MaterialPageRoute<void>( builder: (BuildContext context) => const s1() ));
      print(par);
      // Get.to(orderMap()); //todo: what was planned to DO
      Get.to(
          () => chooseExtentions(),
          transition: Transition.rightToLeft
      );
      print('Went to Map2');

    },
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Next('التالي'))),
                Container(
                  height: MediaQuery.of(context).size.height - 258,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Text(
                            'مكان الشحنة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 27),
                            child: Text(
                              'يمكنك تحديد أكثر من شحنة  للوصول.',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),

                          Row(
                            children: [

                              //First Text
                              Expanded(
                                flex: 7,
                                child: InkWell(
                                  child: Container(
                                    height: 77,
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,

                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2,color: Color(0xff1877F2),),
                                      color: Color(0xffF1F7FF),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13.0)),
                                    ),

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [

                                        SizedBox(),

                                        Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text(Origine[0],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff191F28),

                                            ),

                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text(Origine[1],
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w300,
                                                height: 0.1,
                                                color: Color(0xff1877F2)
                                            ),
                                          ),
                                        ),

                                        Container(width: double.infinity)

                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Get.to(MapSample2());
                                  },
                                ),
                              ),

                              Container(width: 10,),

                              //Second Text
                              InkWell(
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Color(0xff1877F2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text('1',style: TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.w400,color: Color(0xffFFFFFF)),),),
                                onTap: (){
                                  Get.to(MapSample3());
                                },
                              )
                            ],
                          ),

                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Expanded(
                                flex: 7,
                                child: Container(
                                  height: 77,
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,

                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2,color: Color(0xff1877F2),),
                                    color: Color(0xffF1F7FF),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(13.0)),
                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [

                                      SizedBox(),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 30),
                                        child: Text(Destination[0],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff191F28),

                                          ),

                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 30),
                                        child: Text(Destination[1],
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w300,
                                              height: 0.1,
                                              color: Color(0xff1877F2)
                                          ),
                                        ),
                                      ),

                                      Container(width: double.infinity)

                                    ],
                                  ),
                                ),
                              ),

                              Container(width: 10,),

                              Container(
                                width: 32,
                                height: 29,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.location_on,size: 32,color: Color(0xff1877F2),))
                            ],
                          ),

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

}
