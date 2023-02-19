import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import 'Language.dart';
import 'Logout.dart';
import 'Notification.dart';
import 'Profile.dart';
import '../Payments/PaymentPage.dart';
import '../Support/Tickets.dart';
import 'package:provider/provider.dart';

import '../../core/logic/layout/profile/profile_provider.dart';
import '../Payments/PaymentMethods.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  Timer? timer;

  void refreshSettings() {
    setState(() {});
  }
  //Profile picture

  Widget Profile_pic() {
    // var Char1 = name;
    // String Letters = '';

    // Char1.forEach((element) {
    //   setState(() {
    //     if (Letters != null) Letters = Letters + element[0].toUpperCase() + ' ';
    //   });
    // });

    return Container(
      child: Column(
        children: [
          //Image position
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xffECF4FD),
            ),
            width: 170,
            height: 170,
            child: Center(
              child: Text(
                context
                    .read<ProfileProvider>()
                    .userModel!
                    .fullName!
                    .split('')[0],
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 36,
                  letterSpacing: -3,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          //to add space
          const SizedBox(height: 20),

          //User Name
          Text(
            context.read<ProfileProvider>().name!,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              height: 1.2,
              fontSize: 24,
            ),
          ),

          //Button Text
          // TextButton(
          //   style: TextButton.styleFrom(
          //     padding: EdgeInsets.zero,
          //     minimumSize: const Size(123, 40),
          //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //   ),
          //   child: const Text(
          //     "تعديل الحساب",
          //     style: TextStyle(
          //       color: Color(
          //         0xff909090,
          //       ),
          //       fontSize: 13.96,
          //       fontWeight: FontWeight.w500,
          //       fontFamily: "ShamelThin",
          //       letterSpacing: 0,
          //     ),
          //     textAlign: TextAlign.right,
          //   ),
          //   onPressed: () {
          //     print('User want to change  his pic');
          //   },
          // ),
        ],
      ),
    );
  }

  //to update name when saved

  //radio Widget

  bool _notif = false;
  bool _night = true;

  Widget radioOption(String title, String path, String Position, int type) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 1),
      shape: RoundedRectangleBorder(borderRadius: SideType(Position)),
      child: SwitchListTile(
        shape: RoundedRectangleBorder(borderRadius: SideType(Position)),
        title: Text(
          title,
          style: settingstab,
          textAlign: TextAlign.right,
        ),
        secondary: SizedBox(
          width: 25,
          height: 24,
          child: Image.asset(
            path,
            height: 24,
            width: 25,
          ),
        ),
        value: type == 1 ? _notif : _night,
        onChanged: (bool value) {
          setState(() {
            if (type == 1) {
              _notif = value;
            } else {
              _night = value;
            }
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  //Settings options border radius Function
  BorderRadius SideType(String Position) {
    //T = top
    //M = middle
    //B = Bottom
    //S = Solo

    if (Position == 'T') {
      return BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0));
    } else if (Position == 'M') {
      return BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0));
    } else if (Position == 'B') {
      return BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15));
    } else
      return BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15));
  }

  //profile tabs
  Widget tapOptions(
      String title, String path, String Dest, String Position, dynamic type) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: SideType(Position)),
      title: Text(
        title,
        style: settingstab,
        textAlign: TextAlign.right,
      ),
      trailing: SizedBox(
        width: 25,
        height: 24,
        child: Image.asset(
          path,
          height: 24,
          width: 25,
        ),
      ),
      onTap: () {
        if (Dest == 'profile') {
          Get.to(
              () => profile(
                    userModel: context.watch<ProfileProvider>().userModel,
                  ),
              transition: Transition.rightToLeft);
        } else if (Dest == 'card') {
          Get.to(const paymentMethods());
        } else if (Dest == 'plans') {
          Navigator.of(type).pushNamed('/plans');
        } else if (Dest == 'lang') {
          Get.to(() => const language(), transition: Transition.rightToLeft);
        } else if (Dest == 'notif') {
          Get.to(const notification());
        } else if (Dest == 'tickets') {
          Get.to(() => const tickets(), transition: Transition.rightToLeft);
        } else if (Dest == 'logout') {
          Get.offAll(const logout());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileProvider>().getUser();
    print(context.read<ProfileProvider>().getUser());
    print('rrrrrrr');
    // timer =
    //     Timer.periodic(Duration(seconds: 15), (Timer t) => refreshSettings());
  }

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFBFB),
      appBar: AppBar(
        backgroundColor: Color(0xffFAFBFB),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        actions: [
          SizedBox(
            height: 52,
            width: 52,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffFAFBFB)),
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
      body: !context.watch<ProfileProvider>().isLoading
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      //User pic
                      Profile_pic(),

                      SizedBox(height: 15),
                      //radios
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(13),
                      //     color: Sbackground,
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       radioOption('تفعيل التنبيهات',
                      //           'assets/pics/notification.png', 'T', 1),
                      //       radioOption('تفعيل الوضع الليلي',
                      //           'assets/pics/sun.png', 'B', 2),
                      //     ],
                      //   ),
                      // ),

                      //user options
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: SizedBox(
                            height: 350,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Settings tabs
                                Column(
                                  children: [
                                    tapOptions(
                                        'تعديل معلوماتي',
                                        'assets/pics/profilee.png',
                                        'profile',
                                        'T',
                                        context),
                                    SizedBox(
                                        height: 0.4,
                                        child: Container(
                                          color: Sbackground,
                                        )),
                                    tapOptions(
                                        ' معلومات الدفع',
                                        'assets/pics/ticket.png',
                                        'card',
                                        'M',
                                        context),
                                    SizedBox(
                                        height: 0.4,
                                        child: Container(
                                          color: Sbackground,
                                        )),
                                    tapOptions(
                                        'اللغة',
                                        'assets/pics/language.png',
                                        'lang',
                                        'M',
                                        context),
                                    SizedBox(
                                        height: 0.4,
                                        child: Container(
                                          color: Sbackground,
                                        )),
                                    tapOptions(
                                        'الدعم الفني',
                                        'assets/pics/Lifeboy.png',
                                        'tickets',
                                        'B',
                                        context),
                                    SizedBox(height: 20),
                                    tapOptions(
                                        'تسجيل الخروج',
                                        'assets/pics/logout.png',
                                        'logout',
                                        'S',
                                        context),
                                  ],
                                ),

                                //Logout Buttons
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
