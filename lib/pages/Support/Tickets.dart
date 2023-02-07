import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import 'NewTicket.dart';

class tickets extends StatefulWidget {
  const tickets({Key? key}) : super(key: key);

  @override
  State<tickets> createState() => _ticketsState();
}

class _ticketsState extends State<tickets> {
  //Add Button
  Widget Next(String par) => MaterialButton(
        color: On,
        minWidth: double.infinity,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                  child: Container()),
              Expanded(
                flex: 4,
                child: Text(
                  par,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                  child: Image.asset('assets/pics/add.png',width: 16,height: 16,))
            ],
          )
        ),

        onPressed: () {
          //Button destination
          Get.to(
            () => const newTickets(),
            transition: Transition.rightToLeft
          );

        },
      );

  noTickets(){
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/pics/support.png',width: 240,),
            const SizedBox(height: 30),
            const Text(
              'لا يوجد تذاكر حاليا',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w200,
                fontSize: 20,
                color: Color(0xff191F28),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(

              child: Text(
                'قم بإضافة تذكرة من زر بالأسفل و ملأ المعلومات المطلوبة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',

                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  color: Color(0xff72757A),
                ),
              ),
            ),
          ],
        )


      ],
    );
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
          'الدعم الفني',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Next('تدكرة جديدة'))),

                //Tickets page
                noTickets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
