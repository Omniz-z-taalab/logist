import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import '../My_orders/payloading.dart';
import 'Choose_card.dart';

class paymentMethods extends StatefulWidget {
  const paymentMethods({Key? key}) : super(key: key);

  @override
  State<paymentMethods> createState() => _paymentMethodsState();
}

class _paymentMethodsState extends State<paymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Obackground,

      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'اختر وسيلة الدفع',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              color: ATcolor,
              fontWeight: FontWeight.w500),
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
        padding: const EdgeInsets.all(35),
        child: Stack(
          children: [

            //Payment Options
            Column(
              children: [
                //Credit Card
                InkWell(
                    child: Image.asset('assets/pics/paymentCard.png'),
                  onTap: (){
                      Get.to(
                          () => chooseCard(),
                        transition: Transition.rightToLeft,
                      );
                  },
                ),
                SizedBox(height: 10),

                //Apple Pay
                InkWell(
                  child: Image.asset('assets/pics/applePay.png'),
                  onTap: (){
                    Get.to(
                        () => payloading(),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
              ],
            ),

            //Price Text
            Align(
              alignment: Alignment(0, 0.95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                        style: TextStyle(fontFamily: 'visbydemibold',fontSize: 24,color: Color(0xff191F28)),
                        children: <TextSpan>[
                          TextSpan(text: '261.96'),
                          TextSpan(text: 'SAR',style: TextStyle(fontFamily: 'visbylight',fontSize: 18,color: Color(0xff191F28)) )
                        ]
                      )
                  ),
                  Text(
                      'السعر النهائي',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Montserrat'
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
