import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../Payments/PaymentSucess.dart';

class payloading extends StatefulWidget {
  const payloading({Key? key}) : super(key: key);

  @override
  State<payloading> createState() => _payloadingState();
}

class _payloadingState extends State<payloading> {

  @override

  void initState(){
    super.initState();
    redirect();
  }

  void redirect() async{
    await Future.delayed(const Duration(seconds: 3), (){
      Get.to(
          () => paymentSucess(),
          transition: Transition.rightToLeft

      );
    });

  }
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitRing(
          size: 100,
          color: Color(0xff191F28),
        ),
      ),
    );
  }
}
