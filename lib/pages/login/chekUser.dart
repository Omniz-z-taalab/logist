import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../core/logic/auth/auth_provider.dart';
import '../../others/variables.dart';
import 'register.dart';
import 'Verification.dart';
import '../../widgets/Texts.dart';
import 'package:provider/provider.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  _CheckUserState createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  bool isfull = false;

  final _number = TextEditingController();
  final formKey = GlobalKey<FormState>();

//Send Button
  Widget SendCode(String par) => MaterialButton(
        elevation: 0,
        color: isfull ? On : Color(0xff42484F),
        minWidth: double.infinity,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Container(
          child: Text(
            par,
            style: const TextStyle(
                fontSize: 15, color: Colors.white, fontFamily: 'Araboto'),
          ),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            setUserphone('966' + _number.text);
            phonenum = '+20' + _number.text;
            // }
            // if (_number.text.length == 9) {
            context
                .read<AuthProvider>()
                .existsUser(phoneNumber: phonenum)
                .then((value) {
              if (value) {
                Get.to(
                    () => Verification(
                          phone: phonenum,
                        ),
                    transition: Transition.downToUp);
              } 
              // else {
              //   Get.to(
              //       () => pagename(
              //             phone: phonenum,
              //           ),
              //       transition: Transition.downToUp);
              // }
            });
          }
          // print(par);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        child: Maintext('أكتب رقم هاتفك للدخول')),
                    const SizedBox(height: 5),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Subtext('اكتب رقم هاتفك للتسجيل الدخول 966+',
                            size: 14)),
                    const SizedBox(height: 50),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Subtext('رقم الهاتف', size: 14)),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _number,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      autofocus: false,
                      onChanged: (value) {
                        if (value.length == 10) {
                          setState(() {
                            isfull = true;
                          });
                        } else {
                          setState(() {
                            isfull = false;
                          });
                        }
                      },
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Madani',
                        color: Color(0xff191F28),
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        filled: true,
                        fillColor: fill,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(75.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0),
                          borderRadius: BorderRadius.circular(75.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(75.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(75.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            )),
                        errorText: null,
                        errorStyle: const TextStyle(height: 0),
                        isDense: true,
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              width: 49,
                              child: Text(
                                '  +966 ',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Madani',
                                    color: Color(0xff999999),
                                    height: 1.5),
                              ),
                            )),
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Container(
                              width: 49,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 42,
                                    width: 1,
                                    color: const Color(0xffD7D7D7),
                                  ),
                                  SizedBox(width: 5),
                                  Image.asset('assets/pics/iphone.png',
                                      width: 24, height: 24),
                                ],
                              ),
                            )),
                      ),
                      validator: (value) {
                        if (value!.length != 10) {
                          return 'ادخل الرقم الصحيح';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 22),
                    SendCode('التالي'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
