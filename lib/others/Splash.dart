import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import '../core/local/cache_helper.dart';
import 'variables.dart';
import '../pages/MainHomePage.dart';
import '../pages/login/s1.dart';

import '../pages/login/chekUser.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    startapp();
  }

  void startapp() async {
    await Future.delayed(const Duration(seconds: 2), () {
      FlutterNativeSplash.remove();
      CacheHelper.getData(key: 'onBoarding') == null
          ? Get.offAll(const s1())
          : CacheHelper.getData(key: 'accessToken') == null
              ? Get.offAll(const CheckUser())
              : Get.offAll(const mainHomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191F28),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/Logist2.png',
          width: MediaQuery.of(context).size.width / 1.3,
        ),
      ),
    );
  }
}
