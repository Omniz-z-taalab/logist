import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import '../MainHomePage.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  @override

  void initState(){

    super.initState();
    setUserID('Signed in');
    redirect();

  }

  void redirect() async{
    await Future.delayed(const Duration(seconds: 3), (){
      Get.offAll(mainHomePage());
    });

  }
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitRing(
          size: 250,
          color: Color(0xff191F28),
        ),
      ),
    );
  }
}
