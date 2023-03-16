import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../core/logic/viecles/viecles_provider.dart';
import '../../models/viecle_model.dart';
import '../../others/variables.dart';
import 'ChooseExtentions.dart';

class ChoseTrailer extends StatefulWidget {
  const ChoseTrailer({Key? key}) : super(key: key);

  @override
  State<ChoseTrailer> createState() => _ChoseTrailerState();
}

class _ChoseTrailerState extends State<ChoseTrailer> {
  @override
  double HeadOpacity = 0;

  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VieclesProvider>(context, listen: false).getTrailers();
  }

  @override
  Widget build(BuildContext context) {
    var viecle = context.watch<VieclesProvider>().trailers;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(HeadOpacity),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'الشاحنات',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              color: ATcolor,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          SizedBox(
            height: 52,
            width: 52,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HeadOpacity == 0
                      ? Colors.white
                      : Colors.black
                          .withOpacity(HeadOpacity * 0.00000000000000001)),
              child: IconButton(
                color: const Color(0xff323232),
                icon: const Icon(CupertinoIcons.chevron_forward),
                iconSize: 25,
                onPressed: () {
                  HeadOpacity == 0 ? Get.back() : null;
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body:
          ListView.builder(

                itemBuilder: (context, index) => TrailerList( viecle![index]),
                itemCount: viecle.length,
              ),


        
    );
  }
  bool? botton = false;
int? id ;
  int selected= 0;
  Widget TrailerList(Viecle viecle) {
    return InkWell(
      onTap: (){
        print(viecle!.sName);
        setState(() {
          id = viecle!.id;

        });
        Get.to(
              () => chooseExtentions(viecle),
          transition: Transition.rightToLeft,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child:Container(
            height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                   color:selected == 0 ? Colors.white  :Colors.black12,
                borderRadius: BorderRadius.circular(20)

              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                        '${viecle.sName} '
                      ,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(viecle!.sPic!),
                    ),
                  ),

                ],
              )),

      ),
    );
  }
  // Widget Next(String par) => MaterialButton(
  //   color: botton == true ? On : Color(0xff42484F),
  //   minWidth: double.infinity,
  //   height: 60,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(100.0),
  //   ),
  //   child: Container(
  //     child: Text(
  //       par,
  //       style: const TextStyle(
  //         fontSize: 16,
  //         color: Colors.white,
  //         fontFamily: 'Montserrat',
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //   ),
  //   onPressed: () {
  //     //Button destination
  //
  //     print(MediaQuery.of(context).size.height);
  //     print(MediaQuery.of(context).size.width);
  //
  //       Get.to(
  //             () => chooseExtentions(!),
  //         transition: Transition.rightToLeft,
  //       );
  //   },
  // );


}
