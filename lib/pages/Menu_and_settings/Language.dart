import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class language extends StatefulWidget {
  const language({Key? key}) : super(key: key);

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {

  String lang = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Lbackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Lbackground,
        centerTitle: true,
        elevation: 0,

        title: Text(
          'اللغة',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Shamel',
            color: ATcolor,
          ),
        ),

        actions: [

          SizedBox(
            height: 52,
            width: 52,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white),
              child: IconButton(
                color: const Color(0xff323232),
                icon:  const Icon(CupertinoIcons.chevron_forward),
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
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            InkWell(
              child: Container(
                height: 44,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  color: Colors.white,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "العربية",
                      style: TextStyle(
                        color: Color(
                          0xff363636,
                        ),
                        height: 1,
                        fontSize: 12.96,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Shamel",
                        letterSpacing: 0,
                      ),

                      textAlign: TextAlign.right,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 17,right: 17),
                      child: Image(image: AssetImage('assets/pics/ksa.png',),height: 19,),
                    ),
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  lang = 'ar';
                });
                _AlertDialog(context,LangText(lang),LangIcon(lang));
              },
            ),
            const SizedBox(height: 0.4),
            InkWell(
              child: Container(
                height: 44,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0)),
                  color: Colors.white,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "الإنجليزية",
                      style: TextStyle(
                        color: Color(
                          0xff363636,
                        ),
                        height: 1,
                        fontSize: 12.96,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Shamel",
                        letterSpacing: 0,
                      ),

                      textAlign: TextAlign.right,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 17,right: 17),
                      child: Image(image: AssetImage('assets/pics/usa.png',),height: 19,),
                    ),
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  lang = 'en';
                });
                _AlertDialog(context,LangText(lang),LangIcon(lang));
              },
            ),
            const SizedBox(height: 1.0),
            InkWell(
              child: Container(
                height: 44,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                  color: Colors.white,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "الفرنسية",
                      style: TextStyle(
                        color: Color(
                          0xff363636,
                        ),
                        height: 1,
                        fontSize: 12.96,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Shamel",
                        letterSpacing: 0,
                      ),

                      textAlign: TextAlign.right,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 17,right: 17),
                      child: Image(image: AssetImage('assets/pics/fr.png',),height: 19,),
                    ),
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  lang = 'fr';
                });
                _AlertDialog(context,LangText(lang),LangIcon(lang));
              },
            ),
          ],
        ),
      ),
    );
  }

  _AlertDialog(context,String lang,String asset) {


    var alertStyle = const AlertStyle(


      alertAlignment: Alignment.center,

      animationType: AnimationType.shrink,

      animationDuration: Duration(milliseconds: 100),

      descStyle: TextStyle(
        fontFamily: 'ArabotoThin',
        fontSize: 11,
        color: Color(0xffA1A1A1),
      ),

      titleStyle: TextStyle(
        fontFamily: 'Shamel',
        color: Color(0xff191F28),
        fontSize: 18,
      ),

      alertPadding: EdgeInsets.all(30),

      titleTextAlign: TextAlign.right,

      descTextAlign: TextAlign.right,

      isCloseButton: false,

      isOverlayTapDismiss: false,



    );

    Alert(
        style: alertStyle,
        context: context,

        content: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xffECF4FD),
                ),

                width: 113,
                height: 113,
                child:  Center(
                  child: Image(image: AssetImage(asset),height: 42,),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const SizedBox(
              width: 275,
              child: Text(
                'هل تود تغيير اللغة؟',
                style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Color(0xff191F28),
                  fontSize: 18,

                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 7),
             SizedBox(
              width: double.infinity,
              child: Text(
                'هل تود تغيير لغة التطبيق للغة $lang ؟',

                style: TextStyle(
                  fontFamily: 'ShamelThin',
                  fontSize: 11,
                  color: Color(0xff191F28),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 39),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  child: MaterialButton(

                    //Style Settings
                    color: background,
                    minWidth: 118,
                    height: 36,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xffEDF2F7),width: 1),
                      borderRadius: BorderRadius.circular(6),
                    ),


                    child: const Text(
                      'إلغاء',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff16192C),
                      ),
                    ),
                    onPressed: (){
                      print('got back');
                       Navigator.pop(context);
                    },

                  ),
                ),

                Container(
                  child: MaterialButton(

                    //Style Settings
                    color: Confirme,
                    minWidth: 119,
                    height: 36,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),

                    child: const Text(
                      'نعم',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: (){},

                  ),
                ),

              ],
            ),
          ],
        ),
        buttons: [
        ]



    ).show();


  }

  String LangIcon(String language){
    if(language == 'fr')
      return 'assets/pics/fr.png';
    else if(language == 'ar')
      return'assets/pics/ksa.png';
    else if(language == 'en')
      return'assets/pics/usa.png';
    else
      return 'assets/pics/languageLOGO.png';
  }
  String LangText(String language){
    if(language == 'fr')
      return 'الفرنسية';
    else if(language == 'ar')
      return'العربية';
    else if(language == 'en')
      return'الإنجليزية';
    else
      return 'لغة ';
  }


}
