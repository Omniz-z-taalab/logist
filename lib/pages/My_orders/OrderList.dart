import 'package:flutter/cupertino.dart';
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logist/others/variables.dart';
import 'package:logist/pages/My_orders/DummyOnGoing.dart';
import 'package:logist/pages/My_orders/DummyOrderInfo.dart';
import 'package:logist/pages/Order_Setup/OrderMap.dart';
import 'package:logist/widgets/Location_service.dart';
import 'package:shimmer/shimmer.dart';


class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {

  bool isLoading = true;

  List<bool> isSelected = [false,true];

  TextStyle toggle = const TextStyle(
  fontSize: 13,
  fontFamily: 'Araboto',
    fontWeight: FontWeight.w700,
  );

  Future<void> SetDummyData() async{
    var directions = await LocationService().getDirections('24.7718399,46.7874393','24.7474501,46.7274109');

    //Marker Dummy data
    dslat = 24.7474501;
    dslng = 46.7274109;

    Orlat = 24.7718399;
    Orlng = 46.7874393;

    Origine = [' Riyadh',' Riyadh,Saudi Arabia'];
    Destination = ['Al Alamein, King Abdullah','Riyadh,Saudi Arabia'];

    // //Getting Route Info
    Dummy =directions['popyline_decoded'];
    dmlat = directions['start_location']['lat'];
    dmlng = directions['start_location']['lng'];
    bounds_sw = directions['bounds_sw'];
    bounds_ne = directions['bounds_ne'];
    distance = directions['distance'].toString();

  }


  Widget DoneList(){
    return isSelected[0] ?

      Column(
      children: [
        ListView('شاحنة TRILLA','تم إيصال الشحنة بنجاح','مكتملة','','assets/pics/trALX.png'),
        Container(height: 15),
        ListView('شاحنة TRILLA','تم إيصال الشحنة بنجاح','مكتملة','','assets/pics/trALX.png'),
        Container(height: 15),
        ListView('شاحنة PICKUP','تم إيصال الشحنة بنجاح','مكتملة','','assets/pics/trALX.png'),
        Container(height: 15),

      ],
    ) :
      Column(
      children: [

        ListView('شاحنة TRILLA','تم قبول الطلب / لم تتحرك الشحنة','مقبولة','','assets/pics/trALX.png'),
        Container(height: 15),
        ListView('شاحنة TRILLA','16 دقائق للوصول الشحنة','تتبع','KM','assets/pics/trALX.png'),
        Container(height: 15),
        ListView('شاحنة ALX','30 دقائق للوصول الشحنة','تتبع','','assets/pics/trOPEN.png'),
        Container(height: 15),
        ListView('شاحنه مغلقة','تم قبول الطلب / لم تتحرك الشحنة','مقبولة','','assets/pics/Bigtr.png'),


      ],
    ) ;
  }

  Widget ShimmerDoneList(){
    return isSelected[0] ?

      Column(
      children: [

        ShimmerListView(),
        Container(height: 15),
        ShimmerListView(),
        Container(height: 15),
        ShimmerListView(),
        Container(height: 15),

      ],
    ) :
      Column(
      children: [

        ShimmerListView(),
        Container(height: 15),
        ShimmerListView(),
        Container(height: 15),
        ShimmerListView(),
        Container(height: 15),
        ShimmerListView(),


      ],
    ) ;
  }


  @override

  void initState(){
    super.initState();

    done();
  }

  void done() async{
    await Future.delayed(const Duration(seconds: 2), (){
      setState(() {
        isLoading = false;
      });
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Obackground,

      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'طلباتي',
          style: TextStyle(
            fontSize: 16,
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

      body:
      SizedBox(
        height: double.infinity,

        child: Column(
          children: [

            //Completed / Current
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),

              child: ToggleButtons(

                textStyle: toggle,
                selectedColor: const Color(0xffFFFFFF),
                selectedBorderColor: const Color(0xff191F28),
                disabledBorderColor: const Color(0xffF6F6F6),
                fillColor: const Color(0xff191F28),
                borderRadius: const BorderRadius.all(Radius.circular(39)),

                children: <Widget>[
                  //المنتهية
                  Container(
                    alignment: Alignment.center,
                    width: (MediaQuery.of(context).size.width - 55)/2,
                    child: const Text('المنتهية',
                    ),
                  ),

                  //الحالية
                  Container(
                    alignment: Alignment.center,
                    width: (MediaQuery.of(context).size.width - 55)/2,
                    child: const Text(
                      'الحالية',
                    ),
                  ),

                ],

                isSelected: isSelected,

                onPressed: (int newIndex){

                  setState(() {
                    for(int index = 0; index < isSelected.length; index++)
                    {
                      if(index == newIndex) {
                        isSelected[index] = true;
                        print(isSelected[index]);
                      }
                      else{
                        isSelected[index] = false;
                      }
                    }
                  });
                },
              ),
            ),

            SizedBox(height: 25),




            Expanded(
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width-50,
                      child: isLoading ? ShimmerDoneList() : DoneList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  //ListView
  ListView(var title,var subtitle,String status ,var unit,var image)  {

    return Container(
      alignment: Alignment.center,
        decoration: BoxDecoration(
          //color: Colors.black12,
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(13),
        ),
      width: MediaQuery.of(context).size.width-50,
      height: 95,

      child: ListTile(

        //Status Icon
        leading: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Container(
            alignment: Alignment.center,
            width: 65,
            height: 23,
            decoration: BoxDecoration(
          //    color: Color(0xffF9F1FD),
              color: Colors.black12,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 11,
                  width: 11,
                  decoration: BoxDecoration(
                    //color: Color(0xffF8F8F8),
                      color: StatColor(status),
                      shape: BoxShape.circle
                  ),
                ),
                Text(
                    status,
                    textAlign: TextAlign.left,
                    style:  TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: StatColor(status),

                    )
                ),
              ],
            ),
          ),
        ),

        //Truck Name
        title: Text(
          title,
          style: const TextStyle(fontSize: 15, fontFamily: 'Araboto',fontWeight: FontWeight.w500),
          textDirection: TextDirection.rtl,
        ),

        //Status
        subtitle: subtitle == '' ? null : Text(
          subtitle,
          style: const TextStyle(
              fontSize: 10, fontFamily: 'Araboto', color: Color(0xff909090)),
          textDirection: TextDirection.rtl,
        ),

        //Truck Icon
        trailing: Image.asset(image,width: 33,height: 56,),

        onTap: () async{

          driverData = driverData1;
          trShape = trShape1;
          trType = trType1;
          loadType = loadType1;

          SetDummyData();

          time = ['07.04.2022', '15:45', 'AM'];

          if(status == 'تتبع')
            Get.to(
                () => dummygoing(),
                transition: Transition.rightToLeft

            );

          //Basically dummy since the data Is Dummy too
          else if(status == 'مكتملة')
            Get.to(
                () => orderMap(),
                transition: Transition.rightToLeft
            );
          else
            Get.to(
                    () => DummyorderInfo(),
                transition: Transition.rightToLeft
            );

        },
      ),
    );
  }

  // Return Status Color Type Depending on the State
  Color StatColor(String State){

    if(State == 'مكتملة') {
      return const Color(0xff2FBF71);
    } else if(State == 'تتبع') {
      return const Color(0xff015FF5);
    } else if(State == 'مقبولة') {
      return const Color(0xff191F28);
    } else {
      return Colors.red;
    }
  }



  //Skeleton
  Skeleton( { double height = 100 , double width = double.infinity}){

    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,),

      child: Container(

        height: height,
        width: width,

        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),

      ),
    );

  }



  //Shimmer listview
  ShimmerListView()  {

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //color: Colors.black12,
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(13),
      ),
      width: MediaQuery.of(context).size.width-50,
      height: 95,

      child: Shimmer.fromColors(

        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,

        child: ListTile(

          //Status Icon
          leading: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Container(
              alignment: Alignment.center,
              width: 65,
              height: 23,
              decoration: BoxDecoration(
                //    color: Color(0xffF9F1FD),
                color: Colors.black54,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //Status Color Shimmer
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      //color: Color(0xffF8F8F8),
                        color: Color(0xffa1a8a8),
                        shape: BoxShape.circle
                    ),
                  ),

                  //name Shimmer
                  Container(
                    height: 9,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffa1a8a8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Truck Name
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 10,
                width: 92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffcecece),
                ),
              ),
            ],
          ),

          //Status
          subtitle:  Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                height: 9,
                width: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffcecece),
                ),
              ),

              Container(
                height: 9,
                width: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              Container(
                height: 9,
                width: 82,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffcecece),
                ),
              ),

            ],
          ),

          //Truck Icon
          trailing: Container(
            height: 49,
            width: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffcecece),
            ),
          ),

        ),
      ),
    );
  }


}
