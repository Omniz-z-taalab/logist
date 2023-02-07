import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import 'Register.dart';
import '../../widgets/Texts.dart';

import '../../core/local/cache_helper.dart';

class s2 extends StatefulWidget {
  const s2({Key? key}) : super(key: key);

  @override
  _s2State createState() => _s2State();
}

class _s2State extends State<s2> {
  //truck height
  double demoheight = Get.height * 0.24;

  double cardstart = Get.height * 0.08;
  double cardend = Get.height * 0.12;

  double cardLeft = Get.width * 0.06;

  late double cardtop = cardstart;
  double truckright = -350;

  void Reposition() {
    if (cardtop == cardstart)
      //when open
      setState(() {
        cardtop = cardend;
        truckright = -200;
        print('going to $cardend');
      });
    //when close
    else
      setState(() {
        cardtop = cardstart;
        truckright = -350;
        print('going back to $cardstart');
      });
    //print(Get.height * 0.3 );
  }

  void initState() {
    super.initState();
    animate();
  }

  void animate() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      Reposition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    //color: Color(0xffF0F0F0),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        'assets/pics/Mapsicle Map.png',
                        fit: BoxFit.cover,
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.decelerate,
                        top: cardtop,
                        left: Get.width * 0.06,
                        child: AnimatedOpacity(
                            duration: Duration(milliseconds: 1000),
                            opacity: cardtop == cardstart ? 0.0 : 1.0,
                            child: Image.asset('assets/pics/DeliveryMarker.png',
                                width: 96)),
                      ),
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.decelerate,
                          top: Get.height * 0.22,
                          right: truckright,
                          child: AnimatedOpacity(
                              duration: Duration(milliseconds: 700),
                              opacity: truckright == -350 ? 0.0 : 1.0,
                              child: Image.asset(
                                'assets/pics/truck.png',
                                scale: 3.3,
                              ))),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        child: SizedBox(
                            width: 330,
                            child: Maintext(
                                'استأجر شاحنات لمهامك نوفرها لك بجميع الأحجام'))),
                    Container(
                        width: 300,
                        child: Subtext(
                            'أفضل منصة  لاستئجار الشاحنات في الشرق الأوسط بسهولة و آمان سجل حسابك الآن',
                            position: TextAlign.start))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
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
                            child: Text(
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

                          //Reposition();
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
                          Get.to(() => Register(),
                              transition: Transition.rightToLeft);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
