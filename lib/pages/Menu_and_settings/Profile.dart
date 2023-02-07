import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../models/user_model.dart';
import '../../others/variables.dart';
import 'Settings.dart';
import '../../widgets/Texts.dart';
import 'package:provider/provider.dart';

import '../../core/logic/layout/profile/profile_provider.dart';

class profile extends StatefulWidget {
  const profile({Key? key, this.userModel}) : super(key: key);
  final UserModel? userModel;

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  //------------------------Costume Widgets------------------------

  //Profile picture
  Widget Profile_pic() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xffECF4FD),
          ),
          child: CircleAvatar(
            // backgroundColor: Colors.white,
            radius: 50,
            child: Center(
              child: Text(
                widget.userModel!.fullName!.split('')[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ),
            ),
          ),
        ),

        //to add space
        const SizedBox(height: 10),

        //Button Text
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(123, 40),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            "تغيير صورة الحساب",
            style: TextStyle(
              color: Color(
                0xff3F3F3F,
              ),
              fontSize: 13.96,
              fontWeight: FontWeight.w300,
              fontFamily: "ArabotoFat",
              letterSpacing: 0,
            ),
            textAlign: TextAlign.right,
          ),
          onPressed: () {
            print('User want to change  his pic');
          },
        ),
      ],
    );
  }

//Controllers
  final username = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void initState() {
    username.text = widget.userModel!.fullName!;
    phonenumber.text = widget.userModel!.phoneNumber!;
    email.text = widget.userModel!.email!;
    super.initState();
  }

  void SaveChanges() async {
    setState(() {
      String tmpname = username.text;
      String tmpPhone = phonenumber.text;

      name = tmpname;
      phonenum = '966' + tmpPhone;

      setUserphone(phonenum);
      print(phonenum);
      setUsername(tmpname);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBody: true,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'المعلومات الشخصية',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Shamel',
            color: ATcolor,
          ),
        ),
        actions: [
          SizedBox(
            // height: 52,
            // width: 52,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Profile picture
                SizedBox(
                    // height: Get.height/5,
                    width: MediaQuery.of(context).size.width - (20 * 2),
                    child: Profile_pic()),

                //Users Input
                Container(
                  height: Get.height / 2,
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //User name
                      ProfileTitleText('الإسم الكامل'),

                      TextFormField(
                        textDirection: TextDirection.rtl,
                        controller: username,
                        maxLength: 20,
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          hintText: 'إسم المستعمل',
                          hintStyle: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w200),
                          errorBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          )),
                          errorText: null,
                          counterText: '',
                          fillColor: Pbackground,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 3) {
                            return '';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      ProfileTitleText('البريد الإلكتروني'),
                      TextFormField(
                        controller: email,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          fillColor: Pbackground,
                          filled: true,
                          hintTextDirection: TextDirection.rtl,
                          hintText: 'example@mail.com',
                          hintStyle: const TextStyle(
                            color: Color(0xff939393),
                            fontSize: 15,
                            fontFamily: 'circular std',
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      ProfileTitleText('رقم الهاتف'),

                      TextFormField(
                        controller: phonenumber,
                        textDirection: TextDirection.rtl,
                        keyboardType: TextInputType.number,
                        // maxLength: 9,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Madani',
                          color: Color(0xff191F28),
                        ),
                        decoration: InputDecoration(
                          fillColor: Pbackground,
                          // filled: true,
                          hintText: '+966 67993 0183',
                          hintStyle: const TextStyle(
                            color: const Color(0xff939393),
                            fontSize: 15,
                            fontFamily: 'circular std',
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          )),
                          // errorText: null,
                          // counterText: '',
                          // suffixIcon: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 12),
                          //     child: Container(
                          //       // width: 49,
                          //       child: Row(
                          //         // mainAxisAlignment: MainAxisAlignment.start,
                          //         children: [
                          //           const Text(
                          //             '  +966 ',
                          //             style: TextStyle(
                          //                 fontSize: 15,
                          //                 fontFamily: 'Madani',
                          //                 color: const Color(0xff999999),
                          //                 height: 1.5),
                          //           ),
                          //           Container(
                          //             height: 42,
                          //             width: 1,
                          //             color: const Color(0xffD7D7D7),
                          //           )
                          //         ],
                          //       ),
                          //     )),
                          // prefixIconConstraints:
                          //     const BoxConstraints(minWidth: 0, minHeight: 0),
                        ),
                        // validator: (value) {
                        //   if (value!.length != 9) {
                        //     return '';
                        //   }
                        //   return null;
                        // },
                      ),
                    ],
                  ),
                ),

                //Save Button
                !context.watch<ProfileProvider>().isLoading
                    ? Container(
                        height: Get.height / 7,
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width - (20 * 2),
                        child: MaterialButton(
                          height: 66,
                          minWidth: double.infinity,
                          color: const Color(0xff191F28),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(37.5),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          child: const Text(
                            'حفظ التعديلات',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              widget.userModel!.fullName = username.text;
                              widget.userModel!.email = email.text;
                              widget.userModel!.phoneNumber =
                                  '+966' + phonenumber.text;
                              context
                                  .read<ProfileProvider>()
                                  .updateUser(widget.userModel!);
                              SaveChanges();
                              // Get.back();
                            }
                          },
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
