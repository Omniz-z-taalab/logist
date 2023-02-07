import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../others/variables.dart';
int _currentid = 10;
class PanelWidget extends StatefulWidget{

  final ScrollController controller;
  final PanelController panelController;


  const PanelWidget({
    Key? key,
    required this.controller,
    required this.panelController,
}) : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}



class _PanelWidgetState extends State<PanelWidget> {


  @override
  Widget build(BuildContext context) => ListView(

    padding: EdgeInsets.zero,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 33,right: 33,),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 9,bottom: 26 ),
              child: Container(width: 58,height: 4 ,
                decoration: BoxDecoration(
                    color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //ListTile
                InkWell(
                  child: Container(
                    height: 91,
                    alignment: Alignment.centerLeft,

                    decoration: BoxDecoration(
                      color: _currentid == 0 ? Color(0xffEEEEEE) : Color(0xffFFFFFF), //Original listtile Color
                      //color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                          Radius.circular(13.0)),
                    ),


                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Row(

                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  //Title
                                  Text('شاحنة ALX',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff191F28),

                                    ),

                                  ),

                                  //SubText
                                  Text('10 دقائق للوصول إلى الشحنة',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
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
                                decoration: BoxDecoration(
                                  //color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                alignment: Alignment.center,

                                //Image
                                child: Image.asset('assets/pics/trALX.png',width: 40,height: 40,),),
                            ),

                          ],
                        ),

                        Container(width: MediaQuery.of(context).size.width-67)

                      ],
                    ),
                  ),
                  onTap: (){

                    setState(() {
                      _currentid = 0;
                    });

                  },
                ),

                //ListTile
                InkWell(
                  child: Container(
                    height: 91,
                    alignment: Alignment.centerLeft,

                    decoration: BoxDecoration(
                      color: _currentid == 1 ? Color(0xffEEEEEE) : Color(0xffFFFFFF), //Original listtile Color
                      //color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                          Radius.circular(13.0)),
                    ),


                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Row(

                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  //Title
                                  Text('شاحنة HALA AA19 ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff191F28),

                                    ),

                                  ),

                                  //SubText
                                  Text('35 دقيقة للوصول إلى الشحنة',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
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
                                decoration: BoxDecoration(
                                  //color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                alignment: Alignment.center,

                                //Image
                                child: Image.asset('assets/pics/trOPEN.png',width: 40,height: 40,),),
                            ),

                          ],
                        ),

                        Container(width: MediaQuery.of(context).size.width-67)

                      ],
                    ),
                  ),
                  onTap: (){

                    setState(() {
                      _currentid = 1;
                    });

                  },
                ),

                //ListTile
                InkWell(
                  child: Container(
                    height: 91,
                    alignment: Alignment.centerLeft,

                    decoration: BoxDecoration(
                      color: _currentid == 2 ? Color(0xffEEEEEE) : Color(0xffFFFFFF), //Original listtile Color
                      //color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                          Radius.circular(13.0)),
                    ),


                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Row(

                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  //Title
                                  Text('شاحنة BIG MONSTER',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff191F28),

                                    ),

                                  ),

                                  //SubText
                                  Text('1 ساعة 10 دقائق للوصول إلى الشحنة',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
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
                                decoration: BoxDecoration(
                                  //color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                alignment: Alignment.center,

                                //Image
                                child: Image.asset('assets/pics/trALX.png',width: 40,height: 40,),),
                            ),

                          ],
                        ),

                        Container(width: MediaQuery.of(context).size.width-67)

                      ],
                    ),
                  ),
                  onTap: (){

                    setState(() {
                      _currentid = 2;
                    });

                  },
                ),

                SizedBox(height: 36),

                Next('تأكيد العنوان')


              ],
            ),
          ],
        ),
      ),

    ],
  );

  Widget buildAboutText(){
    return Text('Lorem Text');
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
      // Navigator.push<void>( context,  MaterialPageRoute<void>( builder: (BuildContext context) => const s1() ));
      setState(() {

         //panelController.isPanelOpen ? panelController.close() : null;

      });

    },
  );


}