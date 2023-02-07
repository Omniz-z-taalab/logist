import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import 'Register.dart';
import 's2.dart';
import '../../widgets/Texts.dart';

import '../../core/local/cache_helper.dart';

class s1 extends StatefulWidget {
  const s1({Key? key}) : super(key: key);

  @override
  _s1State createState() => _s1State();
}

class _s1State extends State<s1> {
  double cardtop = 100;
  double truckright = -600;

  double cardWidth = Get.width * 0.51;

  void reposition() {
    if (cardtop == 100) {
      setState(() {
        cardtop = 120;
        truckright = -380;
      });
    } else {
      setState(() {
        cardtop = 100;
        truckright = -600;
      });
    }
    // print(Get.width * 0.51);
  }

  void initState() {
    super.initState();
    animate();
  }

  void animate() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      reposition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  //color: Color(0xffF0F0F0),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    Image.asset('assets/pics/Mapsicle Map2.png',
                        fit: BoxFit.cover),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.decelerate,
                      top: cardtop,
                      left: 20,
                      child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 750),
                          opacity: cardtop == 100 ? 0.0 : 1.0,
                          child: Image.asset('assets/pics/card2.png',
                              width: cardWidth)),
                    ),
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.decelerate,
                        top: Get.height * 0.24,
                        right: truckright,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 750),
                            opacity: truckright == -380 ? 1.0 : 0.0,
                            child: Image.asset('assets/pics/truck2.png',
                                scale: 2.3))),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                          child: SizedBox(
                              width: 330,
                              child: Maintext(
                                  'وصل وتتبع شحناتك بسهولة و آمان مع لوجيست'))),
                    ),
                    Expanded(child: Container()),
                    Expanded(
                        flex: 6,
                        child: Container(
                            width: 315,
                            child: Subtext(
                                'أفضل منصة لتوصيل الشحنات  الكبيرة و الصغيرة بسهولة و آمان لوجيست رفيقك اللوجيستي الأول.',
                                position: TextAlign.start)))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //const Text('Line'),
                      MaterialButton(
                        child: Container(
                            alignment: Alignment.centerRight,
                            width: 66,
                            height: 66,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: const Text(
                              'تخطي',
                              style: TextStyle(
                                fontFamily: 'Madani',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff191F28),
                              ),
                            )),
                        onPressed: () {
                          CacheHelper.putData(key: 'onBoarding', value: true);
                          Get.to(() => Register(),
                              transition: Transition.rightToLeft);
                          // Reposition();
                        },
                      ),

                      MaterialButton(
                        child: Container(
                          alignment: Alignment.center,
                          width: 66,
                          height: 66,
                          decoration: const BoxDecoration(
                            color: Color(0xff191F28),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/pics/Goright.png',
                              width: 30, height: 30),
                        ),
                        onPressed: () {
                          CacheHelper.putData(key: 'onBoarding', value: true);
                          Get.to(() => const s2(),
                              transition: Transition.rightToLeft);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
