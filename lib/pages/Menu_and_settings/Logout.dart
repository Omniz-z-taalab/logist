import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../core/local/cache_helper.dart';
import '../../others/variables.dart';
import '../login/s1.dart';

class logout extends StatefulWidget {
  const logout({Key? key}) : super(key: key);

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  void initState() {
    super.initState();
    redirect();
  }

  void redirect() async {
    deletUsername();
    deletUserphone();
    deletUserID();
    CacheHelper.deleteData(key: "accessToken");

    await Future.delayed(const Duration(seconds: 1), () {
      Get.offAll(s1());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitRing(
                size: 50,
                lineWidth: 2,
                color: Color(0xff191F28),
              ),
              SizedBox(height: 10),
              Text(
                'تسجيل الخروج',
                style: TextStyle(
                    color: Color(0xff191F28),
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
