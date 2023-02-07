import 'package:flutter/cupertino.dart';
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logist/Classes/Order_Class.dart';
import 'package:logist/others/variables.dart';
import 'package:logist/widgets/Widgets.dart';


class OrderDetailsV2 extends StatefulWidget {

  OrderDetailsV2({Key? key,required this.order,this.special = false}) : super(key: key);
  Order order;
  bool special;
  @override
  State<OrderDetailsV2> createState() => _OrderDetailsV2State(order,special);
}

class _OrderDetailsV2State extends State<OrderDetailsV2> {

  bool special;
  Order order;
  _OrderDetailsV2State(this.order,this.special);



  //Icon Functions

  //Truck Shape
  String Tricon(int choice){

    if (choice == 0 ) {
      return 'trALX';
    } else if (choice == 1) {
      return 'trOPEN';
    } else if (choice == 2) {
      return 'Bigtr';
    } else {
      return 'IconTruck';
    }
  }

  //Truck Type
  String TypeIcon(int choice){

    if (choice == 0 ) {
      return 'Aired';
    } else if (choice == 1) {
      return 'Snow';
    } else if (choice == 2) {
      return 'Dry';
    } else {
      return 'IconTruCkFront';
    }

  }

  //Load Type
  String PayloadIcon(int choice){
    if(choice == 0) {
      return 'med';
    } else if (choice == 1) {
      return 'food';
    } else if( choice == 2) {
      return 'metal';
    } else if (choice == 3) {
      return 'package';
    } else if (choice == 4) {
      return 'cattle';
    } else if(choice == 5) {
      return 'others';
    } else {
      return 'IconOrder';
    }
  }


  Widget ConfirmationButtn(Status){
    if(Status == 'Accepted') {
      return Container(
        width: 134,
        height: 52,

        foregroundDecoration: BoxDecoration(

            borderRadius: BorderRadius.circular(39)
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:  const Color(0xff1877F2),
          ),
          onPressed: (){
            print('Do Something');

          },

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'تفعيل النقل',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                ),
              ),
              SimplePic('ConfirmStart', 19, 19)
            ],
          ),
        ),
      );
    } else if(Status == 'Pending') {
      return Container(
        width: 134,
        height: 52,

        foregroundDecoration: BoxDecoration(

            borderRadius: BorderRadius.circular(39)
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:  const Color(0xff2FBF71),
          ),
          onPressed: (){
            print('Do Something');
          },

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'تم التوصيل',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                ),
              ),
              const Icon(Icons.check_sharp,size: 19)
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Obackground,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'ملخص',
        ),
        actions: [
          SizedBox(
            height: 52,
            width: 52,
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

      body: SizedBox(
        height: double.infinity,

        child: Stack(

          children: [

            //Bottom + price Bar
            Positioned(
              bottom: 0,
              child: Column(
                children: [

                  //Thine line
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: const Color(0xffEDEDED),
                  ),

                  //Final Price
                  SizedBox(
                    width: MediaQuery.of(context).size.width-50,
                    height: 100,
                    child: Center(
                      child: ListTile(

                        leading: Container(
                          alignment: Alignment.centerLeft,
                          width: 150,
                          child: RichText(
                              text:  TextSpan(children: [
                                TextSpan(
                                  //Price Here
                                    text: order.Price.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff191F28))),
                                const TextSpan(
                                  //Currency Here
                                    text: ' SAR',
                                    style: TextStyle(
                                        fontFamily: 'Madani',
                                        fontSize: 18,
                                        color: Color(0xff191F28)))
                              ])),
                        ),

                        //Final Price text
                        title: const Text(
                          'السعر النهائي',
                          style: TextStyle(fontSize: 13, fontFamily: 'Madani'),
                          textDirection: TextDirection.rtl,
                        ),


                      ),
                    ),
                  ),

                  //Thin line
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: const Color(0xffEDEDED),
                  ),

                  //Costumer Name details
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ListTile(

                      //Button
                      leading: Container(
                          width: 134,
                          height: 52,

                          foregroundDecoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(39)
                          ),
                          child: ConfirmationButtn(order.Status)
                      ),

                      //Client name
                      title:  Text(
                        //User Name
                        order.driver.name,
                        style: const TextStyle(fontSize: 16, fontFamily: 'Madani'),
                        textDirection: TextDirection.rtl,
                      ),

                      subtitle:  const Text(
                        'الزبون',
                        style: TextStyle(
                            fontSize: 10, fontFamily: 'Madani', color: Color(0xff909090)),
                        textDirection: TextDirection.rtl,
                      ),

                      trailing:  Padding(
                          padding: EdgeInsets.only(right: 15),

                          child:ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.network(order.driver.picture,width: 53,height: 53,)
                          )

                      ),
                    ),
                  ),


                  const SizedBox(height: 5,),
                ],
              ),
            ),

            //Order Details List
            SizedBox(
              height: MediaQuery.of(context).size.height-263,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width-50,
                    child: Column(
                      children: [
                        //Depart
                        DetailsListView(order.OrigineName,order.OrigineDesc,'','','depart',context),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Arrive
                        DetailsListView(order.DestName,order.DestDesc,'','','arriving',context),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Distance
                        DetailsListView('مسافة نقل الشحنة','',order.Distance.toString().replaceAll('km', ''),'KM','distance',context),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Truck name
                        DetailsListView(order.Truck.name,'','','','',context),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Truck Shape
                        DetailsListView(order.Truck.trailer,'','','','',context),
                        Container(height: 1,color: const Color(0xffF2F1F4)),


                        //Truck Type
                        DetailsListView(order.Truck.trailertype,'','','','',context),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //load Type
                        //DetailsListView(order.Truck.loadtype,'','','','',context),
                        Container(height: 1,color: const Color(0xffF2F1F4)),

                        //Date and Time
                        DetailsListView(order.Date.toString(),'',order.Date.toString(),'','time',context),
                        //Container(height: 1,color: const Color(0xffF2F1F4)),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );


  }

}
