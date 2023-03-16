import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logist/core/logic/price_payment/price_payment.dart';
import 'package:provider/provider.dart';
import '../../others/variables.dart';
import '../My_orders/payloading.dart';
import 'PaymentPage.dart';

class chooseCard extends StatefulWidget {
  const chooseCard({Key? key}) : super(key: key);

  @override
  State<chooseCard> createState() => _chooseCardState();
}

class _chooseCardState extends State<chooseCard> {

  int age  = 0;


  Widget card(String name,int cardNum , String type,int index){
    return Column(
      children: [

        OutlinedButton(

          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
            side: const BorderSide(width: 0.0,color: Color(0x00000000)),
            backgroundColor: (age == index) ? const Color(0xffe8e8ff) : const Color(0xffffffff),
            padding: EdgeInsets.zero,
          ),
          onPressed: (){
            setState(() {
              age = index;
            });
            print(age);
          },
          child: Container(

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.8),

              color:  Colors.white,

              border :Border.all(width: 1,
                  color:  const Color(0xffF4F4F4)
              ),

            ),
            width: 325,
            child: ListTile(

              //Card Owner Name
              title: Text(
                name,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                  color: Color(0xff868686),
                  fontSize: 12.83,
                  fontWeight: FontWeight.w500,
                  fontFamily: "SSTArabic",
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.right,
              ),

              //credit card num
              subtitle: Text(
                "****   ****   ****   $cardNum",
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  color: Color(
                    0xff424D59,
                  ),
                  fontSize: 13.96,
                  fontWeight: FontWeight.w500,
                  fontFamily: "SF Pro Display",
                  letterSpacing: 0,
                ),
              ),

              //credit card icon
              trailing: Image.asset(
                type == 'visa' ? 'assets/pics/visa.png' : 'assets/pics/mastercard.png',
                height: 12,
                width: 39,
              ),

              //Check box
              leading: Container(
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(width: 1,color: const Color(0xffF4F4F4))
                ),
                child: Icon(
                  Icons.circle,
                  color: age == index ? const Color(0xff3966FA) : const Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
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
          'البطاقات المصرفية',
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
            Column(
              children: [

                MaterialButton(
                  height: 61,
                  elevation: 0,
                  minWidth: MediaQuery.of(context).size.width - 35*2,
                  color: const Color(0xffF4F4F4),
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(32.0) ),
                  child: const Text('إضافة بطاقة',style: TextStyle(fontSize: 14,fontFamily: 'Araboto',color: Color(0xff191F28)),),
                    onPressed: (){
                    Get.to(
                        () => const paymentPage(),
                      transition: Transition.rightToLeft
                    );
                    }
                ),

                const SizedBox(height: 20),

                card('khalid Nouri',1532,'mastercard',2),

                card('Mohamed Ali',9456,'mastercard',3),

                card('Ayoub Aitouna',8345,'visa',4),

              ],
            ),
            Align(

              alignment: const Alignment(0, 0.95),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                  //thin Line
                  Container(height: 1,width: double.infinity,color: const Color(0xffF2F1F4)),
                  const SizedBox(height: 40),
                  //Price Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: const TextSpan(
                              style: TextStyle(fontFamily: 'visbydemibold',fontSize: 24,color: Color(0xff191F28)),
                              children: <TextSpan>[
                                TextSpan(text: '261.96'),
                                TextSpan(text: 'SAR',style: TextStyle(fontFamily: 'visbylight',fontSize: 18,color: Color(0xff191F28)) )
                              ]
                          )
                      ),
                      const Text(
                        'السعر النهائي',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w200,
                            fontFamily: 'Montserrat'
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  MaterialButton(
                      height: 61,
                      elevation: 0,
                      minWidth: MediaQuery.of(context).size.width - 35*2,
                      color: age == 0 ? const Color(0xff454B52): const Color(0xff191F28),
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(32.0) ),
                      child: const Text('ادفع الآن',style: TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,
                          color: Colors.white),),
                      onPressed: (){
                          context.read<PriceProvider>().payOrder();
                          Get.to(
                            () => const payloading(),
                            transition: Transition.rightToLeft,);
                      }
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
