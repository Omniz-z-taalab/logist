import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Name.dart';
import '../../widgets/Texts.dart';
import '../../others/variables.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../core/logic/auth/auth_provider.dart';
import '../MainHomePage.dart';

class Verification extends StatefulWidget {
  final String? phone;
  const Verification({Key? key, this.phone}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  // void pickValue() {
  //   showDialog<int>(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           contentPadding: const EdgeInsets.only(top: 54, left: 44, right: 44),
  //           insetPadding: EdgeInsets.zero,
  //           alignment: Alignment.bottomCenter,
  //           shape: const RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(24.0))),
  //           content: Container(
  //             height: 230,
  //             width: 350,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 //main title
  //                 const SizedBox(
  //                   width: 251,
  //                   child: Text(
  //                     'هل تود إعطاء الصلاحية  لقراءة الرسائل و إدخال الكود؟',
  //                     style: TextStyle(
  //                       fontFamily: 'Madani',
  //                       color: Color(0xff191F28),
  //                       fontSize: 20,
  //                     ),
  //                     textDirection: TextDirection.rtl,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 15),

  //                 //Sub title
  //                 const SizedBox(
  //                   width: double.infinity,
  //                   child: Text(
  //                     'سيتم إدخال الكود تلقائيا بعد إعطاء الصلاحية',
  //                     style: TextStyle(
  //                       fontFamily: 'Madani',
  //                       fontSize: 14,
  //                       color: Color(0xffA1A1A1),
  //                     ),
  //                     textDirection: TextDirection.rtl,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 39),

  //                 //Buttons
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     //Refuse

  //                     MaterialButton(
  //                       //Style Settings
  //                       color: background,
  //                       // minWidth: 66,
  //                       // height: 66,
  //                       elevation: 0.0,

  //                       shape: RoundedRectangleBorder(
  //                         side: BorderSide(width: 1, color: Color(0xffEBEBEB)),
  //                         borderRadius: BorderRadius.circular(100),
  //                       ),

  //                       child: Icon(Icons.close_sharp),
  //                       onPressed: () {
  //                         //refuse
  //                         Get.back();
  //                       },
  //                     ),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                     //Accept
  //                     Expanded(
  //                       child: MaterialButton(
  //                         //Style Settings
  //                         color: Confirme,
  //                         // minWidth: 230,
  //                         // height: 66,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(37.5),
  //                         ),

  //                         child: const Text(
  //                           'سماح',
  //                           style: TextStyle(
  //                               fontFamily: 'madani',
  //                               fontSize: 18,
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.w500),
  //                         ),
  //                         onPressed: () {
  //                           //allow
  //                           fillVals();
  //                           Get.back();
  //                         },
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //           actions: [],
  //         );
  //       });
  // }

  _AlertDialog(context) {
    var alertStyle = const AlertStyle(
      alertAlignment: Alignment.bottomCenter,
      animationType: AnimationType.fromBottom,
      animationDuration: Duration(milliseconds: 400),
      descStyle: TextStyle(
        fontFamily: 'ArabotoThin',
        fontSize: 14,
        color: Color(0xffA1A1A1),
      ),
      titleStyle: TextStyle(
        fontFamily: 'Shamel',
        color: Color(0xff191F28),
        fontSize: 20,
      ),
      alertPadding: EdgeInsets.all(24),
      titleTextAlign: TextAlign.right,
      descTextAlign: TextAlign.right,
      isCloseButton: false,
      isOverlayTapDismiss: false,
    );

    Alert(
        style: alertStyle,
        context: context,

        //Main Alert Column
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //to add space
            const SizedBox(height: 10),

            //main title
            const SizedBox(
              width: 275,
              child: Text(
                'هل تود إعطاء الصلاحية  لقراءة الرسائل و إدخال الكود؟',
                style: TextStyle(
                  fontFamily: 'Madani',
                  color: Color(0xff191F28),
                  fontSize: 20,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 7),

            //Sub title
            const SizedBox(
              width: double.infinity,
              child: Text(
                'سيتم إدخال الكود تلقائيا بعد إعطاء الصلاحية',
                style: TextStyle(
                  fontFamily: 'Madani',
                  fontSize: 14,
                  color: Color(0xffA1A1A1),
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 39),

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Refuse
                Container(
                  child: MaterialButton(
                    //Style Settings
                    color: background,
                    minWidth: 66,
                    height: 66,
                    elevation: 0.0,

                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xffEBEBEB)),
                      borderRadius: BorderRadius.circular(100),
                    ),

                    child: Icon(Icons.close_sharp),
                    onPressed: () {
                      //refuse
                      Get.back();
                    },
                  ),
                ),

                //Accept
                Container(
                  child: MaterialButton(
                    //Style Settings
                    color: Confirme,
                    minWidth: 200,
                    height: 66,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(37.5),
                    ),

                    child: const Text(
                      'سماح',
                      style: TextStyle(
                          fontFamily: 'madani',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      //allow
                      fillVals();
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        buttons: []).show();
  }

  //Time Settings

  String Counter = 'إعادة إرسال';

  Duration duration = Duration();

  //Duration countDownDuration = Duration(minutes: 5);
  //Duration countDownDuration = Duration(minutes: 2);
  Duration countDownDuration = Duration(minutes: 3);
  Timer? timer;

  void addTime() {
    final addSeconds = -1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        setState(() {
          isCountDown = false;
          timer?.cancel();
          print(isCountDown);
        });

        Counter = 'إعادة إرسال';
      }
      duration = Duration(seconds: duration.inSeconds + addSeconds);

      //print(duration.inSeconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void reset() {
    if (isCountDown) {
    } else
      setState(() {
        isCountDown = true;
        duration = countDownDuration;
        startTimer();
      });
  }

  bool isCountDown = false;

  String message = '';

  final _input1 = TextEditingController();
  final _input2 = TextEditingController();
  final _input3 = TextEditingController();
  final _input4 = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void Change() {
    setState(() {
      message =
          'هنالك مشكلة في رمز التحقق تأكد منه أو ارسل كود جديد في حال لم يتم الوصول أو الدخول';

      print(verife);
    });
  }

  void GoNext() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const pagename(),
      ),
    );
  }

  Widget verifyCode(String par) => MaterialButton(
        color: On,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Container(
          child: Text(
            par,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontFamily: 'Madani'),
          ),
        ),
        onPressed: () {
          //_awesomedialog(context);

          //GoNext();
          if (formKey.currentState!.validate()) {
            context
                .read<AuthProvider>()
                .verifyUser(
                    phoneNumber: widget.phone,
                    key: _input1.text +
                        _input2.text +
                        _input3.text +
                        _input4.text)
                .then((value) {
              if (value) {
                context
                    .read<AuthProvider>()
                    .loginUser(
                        phoneNumber: widget.phone,
                        key: _input1.text +
                            _input2.text +
                            _input3.text +
                            _input4.text)
                    .then((value) {
                  if (value) {
                    Get.to(() => const mainHomePage(),
                        transition: Transition.rightToLeft);
                  } else {
                    Get.to(
                        () => pagename(
                              phone: phonenum,
                            ),
                        transition: Transition.downToUp);
                  }
                });
              }
            });
          } else {
            print('ادخل الكود');
            // Change();
          }

          print('Pressed check button');
        },
      );

  Widget resendCode(String par) => MaterialButton(
      color: Color(0xffF2F2F2),
      disabledColor: Color(0xffF2F2F2),
      elevation: 1,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Container(
        child: Text(
          par,
          style: TextStyle(
              fontSize: 15,
              color: isCountDown ? Color(0xffB9BBBF) : Color(0xff191F28),
              fontFamily: 'Madani',
              fontWeight: FontWeight.w500),
        ),
      ),
      onPressed: () {
        context.read<AuthProvider>().respondOtp(phoneNumber: widget.phone);
      }
      //  isCountDown
      // ? null
      // : () {
      //     reset();
      //     //pickValue();
      //     //_AlertDialog(context);
      //   },
      );

  void initState() {
    super.initState();
    // openDia();
    //startTimer();
  }

  // void openDia() async {
  //   await Future.delayed(const Duration(seconds: 1), () {
  //     //Old Alert Dialog
  //     // _AlertDialog(context);

  //     //New remaked Dialog
  //     pickValue();
  //   });
  // }

  void fillVals() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _input1.text = 1.toString();
        _input2.text = 2.toString();
        _input3.text = 3.toString();
        _input4.text = 4.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            //Titles and Inputs
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          child: Maintext('ادخل رمز التفعيل لهاتفك')),
                      const SizedBox(height: 5),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Subtext(
                              ' لقد اسرسلنا كود التفعيل على الرقم+$phonenum',
                              size: 14)),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //First Input
                            SizedBox(
                              height: 86,
                              width: 64,
                              child: TextFormField(
                                textDirection: TextDirection.rtl,
                                controller: _input1,
                                autofocus: false,
                                onTap: () {
                                  _input1.text = '';
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    _input2.text = '';
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    height: 1.6,
                                    fontFamily: 'DM Sans',
                                    fontSize: 48,
                                    color: Color(0xffCCCCCC),
                                  ),
                                  errorStyle: const TextStyle(height: 0),
                                  filled: true,
                                  fillColor: fill,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(41),
                                      borderSide: BorderSide.none),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(41),
                                    borderSide: const BorderSide(
                                        width: 1, color: Color(0xffCC4F1E)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ادخل الكود';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 38,
                                    height: 1,
                                    fontFamily: 'DM Sans'),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLines: 7,
                                minLines: 5,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),

                            //Second Input
                            SizedBox(
                              height: 86,
                              width: 64,
                              child: TextFormField(
                                controller: _input2,
                                onTap: () {
                                  _input2.text = '';
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    _input3.text = '';
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    height: 1.6,
                                    fontFamily: 'DM Sans',
                                    fontSize: 48,
                                    color: Color(0xffCCCCCC),
                                  ),
                                  errorStyle: const TextStyle(height: 0),
                                  filled: true,
                                  fillColor: fill,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(41),
                                      borderSide: BorderSide.none),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(41),
                                    borderSide: const BorderSide(
                                        width: 1, color: Color(0xffCC4F1E)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ادخل الكود';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 38,
                                    height: 1,
                                    fontFamily: 'DM Sans'),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLines: 7,
                                minLines: 5,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),

                            //Third Input
                            SizedBox(
                              height: 86,
                              width: 64,
                              child: TextFormField(
                                controller: _input3,
                                onTap: () {
                                  _input3.text = '';
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    _input4.text = '';
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    height: 1.6,
                                    fontFamily: 'DM Sans',
                                    fontSize: 48,
                                    color: Color(0xffCCCCCC),
                                  ),
                                  errorStyle: const TextStyle(height: 0),
                                  filled: true,
                                  fillColor: fill,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(41),
                                      borderSide: BorderSide.none),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(41),
                                    borderSide: const BorderSide(
                                        width: 1, color: Color(0xffCC4F1E)),
                                  ),
                                ),
                                style: const TextStyle(
                                    fontSize: 38,
                                    height: 1,
                                    fontFamily: 'DM Sans'),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLines: 7,
                                minLines: 5,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ادخل الكود';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            //fourth Input
                            SizedBox(
                              height: 86,
                              width: 64,
                              child: TextFormField(
                                controller: _input4,
                                onTap: () {
                                  _input4.text = '';
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    height: 1.6,
                                    fontFamily: 'DM Sans',
                                    fontSize: 48,
                                    color: Color(0xffCCCCCC),
                                  ),
                                  errorStyle: const TextStyle(height: 0),
                                  filled: true,
                                  fillColor: fill,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(41),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(41),
                                    borderSide: const BorderSide(
                                        width: 1, color: Color(0xffCC4F1E)),
                                  ),
                                ),
                                style: const TextStyle(
                                    fontSize: 38,
                                    height: 1,
                                    fontFamily: 'DM Sans'),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLines: 7,
                                minLines: 5,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: 300,
                          child: Subtext(message,
                              size: 14,
                              position: TextAlign.center,
                              Type: 'error')),
                    ],
                  ),
                ),
              ),
            ),

            //Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  height: double.infinity,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          child: verifyCode('تحقق'),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: resendCode(
                              isCountDown ? '$minutes:$seconds' : Counter),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
