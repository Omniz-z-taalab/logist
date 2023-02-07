import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import 'Loading.dart';
import '../../widgets/Texts.dart';
import 'package:provider/provider.dart';

import '../../core/logic/auth/auth_provider.dart';

class pagename extends StatefulWidget {
  const pagename({Key? key, this.phone}) : super(key: key);
  final String? phone;

  @override
  _pagenameState createState() => _pagenameState();
}

class _pagenameState extends State<pagename> {
  final _name = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //Buttons
  Widget SendCode(String par) => MaterialButton(
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
                fontSize: 16, color: Colors.white, fontFamily: 'Madani'),
          ),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            //Setting User ID
            setUsername(_name.text);

            //Setting local variables
            context.read<AuthProvider>().setName(_name.text);
            context.read<AuthProvider>().setPhone(widget.phone!);
            name = _name.text;
            context.read<AuthProvider>().registerUser().then((value) {
              Get.to(() => const loading(), transition: Transition.rightToLeft);
            });

            //Going to main Menu
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Maintext('أدخل إسمك لتجربة أفضل')),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Subtext(
                              'الرجاء إدخال إسمك الحقيقي لضمان تجربة أفضل ',
                              size: 14,
                              color: const Color(0xffA1A1A1))),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Subtext('الإسم',
                              size: 14, color: const Color(0xffABAEBC))),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _name,
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
                        suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              width: 49,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 42,
                                    width: 1,
                                    color: const Color(0xffD7D7D7),
                                  ),
                                  Image.asset('assets/pics/profile.png',
                                      scale: 4),
                                ],
                              ),
                            )),
                      ),
                      textDirection: TextDirection.rtl,
                      validator: (value) {
                        if (value!.length < 3) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SendCode('الدخول'),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
