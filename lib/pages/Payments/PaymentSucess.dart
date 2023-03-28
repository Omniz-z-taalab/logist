import 'package:flutter/material.dart';
import 'package:logist/pages/MainHomePage.dart';

import '../../others/variables.dart';

class paymentSucess extends StatefulWidget {
  const paymentSucess({Key? key}) : super(key: key);

  @override
  State<paymentSucess> createState() => _paymentSucessState();
}

class _paymentSucessState extends State<paymentSucess> {
  @override

  //Button
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
          Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const mainHomePage()));
          // Get.to(
          // () => orderInfo(Orders,true),
          // transition: Transition.rightToLeft);

          // );
        },
      );

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Obackground,
        appBar: AppBar(
          backgroundColor: Obackground,
          centerTitle: true,
          elevation: 0,
          actions: [
            const SizedBox(width: 20),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 37, left: 37, right: 37),
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/pics/paysucc.png',
                          width: 105,
                          height: 105,
                        ),
                        const Text(
                          'لقد تم الدفع!',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 34,
                          ),
                        ),
                        const SizedBox(height: 13),
                        const SizedBox(
                          width: 276,
                          child: Text(
                            'لقد تم الطلب بنجاح سيتم تنفيد الطلب حسب التوقيت المحدد.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(

                      // alignment: Alignment(0.0, 0.91),
                      bottom: 30,

                      // heightFactor: 12,
                      child: Container(
                          width: MediaQuery.of(context).size.width - (37 * 2),
                          child: Next('متابعة'))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
