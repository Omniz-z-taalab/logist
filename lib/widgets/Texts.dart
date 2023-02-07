import 'package:flutter/material.dart';
import '../others/variables.dart';

Widget Maintext(String text,{double size = 24,TextAlign  Align = TextAlign.end}) => Text(
      text,
      style: const TextStyle(fontSize: 28, fontFamily: 'Madani',height: 1.3,fontWeight: FontWeight.w500),
      textAlign: Align,

    );

Widget Subtext(String text, {double size = 13,Color color = const Color(0xff707070), TextAlign position = TextAlign.end,String Type = 'normal'}) => Text(
      text,

      style: TextStyle(
          fontSize: size ,fontFamily: 'Madani',  color: Type == 'normal' ?  color : Cerror,),textAlign: position ,textDirection: TextDirection.rtl,
    );

Widget ProfileTitleText(String text) => SizedBox( width:double.infinity ,child:Text(text, style: PTstyle,textAlign: TextAlign.right));
