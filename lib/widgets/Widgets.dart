import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Classes/Order_Class.dart';
import '../models/order_model.dart';
import '../pages/My_orders/OrderInfo.dart';
import '../pages/My_orders/load_route_map.dart';

import '../models/order_list.dart';

Widget Vspace(double height){
  return SizedBox(height: height);
}

Widget Hspace(double width){
  return SizedBox(width: width);
}

//Simple Picture Widget with height , weight , pre path
Widget SimplePic(String name, double width, double height){
  return Image.asset('assets/pics/$name.png',width: width,height: height);
}

//Orders List Widgets

ListView DeliveredOrdersList(List<Orders> List,var context,{bool trial = false,int limit = 3}) {

  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: trial && List.length > limit ? limit  : List.length,
    itemBuilder: (context, index) {
      return 'Delivered' == List[index].orderType || 'Canceled'  == List[index].orderType ?  Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: _OrdersListnow(context,List[index])
      ) : Container();
    },
  );
}

Widget _OrdersListView(BuildContext context,Orders order)  {

  // Return Status Color Type Depending on the State
  Color SayColor(Status){

    if(Status == 'Delivered') {
      return const Color(0xff2FBF71);

    } else if(Status == 'Pending') {
      return const Color(0xff015FF5);

    } else if(Status == 'Accepted') {
      return const Color(0xff191F28);

    } else if(Status == 'Waiting') {
      return const Color(0xffe1c01c);

    } else {
      return Colors.red;
    }
  }

  // Generate  Description based on status
  // String SayDesc(Status){

  //   if(Status == 'Delivered')
  //     return 'تم إيصال الشحنة بنجاح';

  //   else if(Status == 'Pending')
  //     return 'جاري توصيل الشحنة';

  //   else if(Status == 'Canceled')
  //     return 'تم إلغاء الطلب';

  //   else if(Status == 'Accepted')
  //     return 'تم قبول الطلب / لم تتحرك الشحنة';

  //   else if(Status == 'Waiting')
  //     return 'في إنتضار قبول الطلب';

  //   else
  //     return '';
  // }

  // //Generat truck asset based on it's name
  // String SayImage(title){
  //   if(title == 'شاحنة ALX')
  //     return 'ALX';

  //   else if(title == 'شاحنة HALA AA19')
  //     return 'AA19';

  //   else if(title == 'شاحنة BIG MONSTER')
  //     return 'BIG';
  //   else
  //     return 'BIG';
  // }

  // //Convert Status from english (backend) to arabic
  // String ConvertStatus(Status){

  //   if(Status == 'Delivered')
  //     return 'مكتملة';

  //   else if(Status == 'Pending')
  //     return 'تتبع';

  //   else if(Status == 'Canceled')
  //     return 'مرفوضة';

  //   else if(Status == 'Accepted')
  //     return 'مقبولة';
  //   else if(Status == 'Waiting')
  //     return 'إنتضار';

  //   else
  //     return '';
  // }

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
          width: 50,
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
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  //todo: set its own Parameter
                    color: SayColor("Delivered"),
                    shape: BoxShape.circle
                ),
              ),
              // Text(
              //     ConvertStatus(status),
              //     textAlign: TextAlign.left,
              //     style:  TextStyle(
              //       fontFamily: 'Madani',
              //       fontSize: 10,
              //       fontWeight: FontWeight.w300,
              //       //todo: set its own Parameter
              //       color: SayColor(status),

              //     )
              // ),
            ],
          ),
        ),
      ),

      //Truck Name
      title: Text(
        order.driverName!,
        style: const TextStyle(fontSize: 15, fontFamily: 'Madani',fontWeight: FontWeight.w500),
        textDirection: TextDirection.rtl,
      ),

      //Status
      // subtitle: Text(
      //   SayDesc(status),
      //   style: const TextStyle(
      //       fontSize: 10, fontFamily: 'Madani', color: Color(0xff909090)),
      //   textDirection: TextDirection.rtl,
      // ),

      //Truck Icon
      // trailing: SimplePic(SayImage(title), 45, 56),


      onTap: () async{
        // if(order.Status == 'Accepted' || order.Status == 'Waiting') {
          Get.to(
                  () => orderInfo(order,false),
              transition: Transition.rightToLeft
          );
        // } else if(order.Status == 'Delivered' || order.Status == 'Canceled'){
        //   Get.to(
        //           () => LoadingRoute(order: order),
        //       transition: Transition.rightToLeft
        //   );
        // }

      },
    ),
  );
}
Widget _OrdersListViewDone(BuildContext context,Orders order)  {

  // Return Status Color Type Depending on the State
  Color SayColor(Status){

    if(Status == 'Delivered') {
      return const Color(0xff2FBF71);

    } else if(Status == 'Pending') {
      return const Color(0xff015FF5);

    } else if(Status == 'Accepted') {
      return const Color(0xff191F28);

    } else if(Status == 'Waiting') {
      return const Color(0xffe1c01c);

    } else {
      return Colors.red;
    }
  }

  // Generate  Description based on status
  // String SayDesc(Status){

  //   if(Status == 'Delivered')
  //     return 'تم إيصال الشحنة بنجاح';

  //   else if(Status == 'Pending')
  //     return 'جاري توصيل الشحنة';

  //   else if(Status == 'Canceled')
  //     return 'تم إلغاء الطلب';

  //   else if(Status == 'Accepted')
  //     return 'تم قبول الطلب / لم تتحرك الشحنة';

  //   else if(Status == 'Waiting')
  //     return 'في إنتضار قبول الطلب';

  //   else
  //     return '';
  // }

  // //Generat truck asset based on it's name
  // String SayImage(title){
  //   if(title == 'شاحنة ALX')
  //     return 'ALX';

  //   else if(title == 'شاحنة HALA AA19')
  //     return 'AA19';

  //   else if(title == 'شاحنة BIG MONSTER')
  //     return 'BIG';
  //   else
  //     return 'BIG';
  // }

  // //Convert Status from english (backend) to arabic
  // String ConvertStatus(Status){

  //   if(Status == 'Delivered')
  //     return 'مكتملة';

  //   else if(Status == 'Pending')
  //     return 'تتبع';

  //   else if(Status == 'Canceled')
  //     return 'مرفوضة';

  //   else if(Status == 'Accepted')
  //     return 'مقبولة';
  //   else if(Status == 'Waiting')
  //     return 'إنتضار';

  //   else
  //     return '';
  // }

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
          width: 50,
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
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  //todo: set its own Parameter
                    color: SayColor("Delivered"),
                    shape: BoxShape.circle
                ),
              ),
              // Text(
              //     ConvertStatus(status),
              //     textAlign: TextAlign.left,
              //     style:  TextStyle(
              //       fontFamily: 'Madani',
              //       fontSize: 10,
              //       fontWeight: FontWeight.w300,
              //       //todo: set its own Parameter
              //       color: SayColor(status),

              //     )
              // ),
            ],
          ),
        ),
      ),

      //Truck Name
      title: Text(
        order.driverName!,
        style: const TextStyle(fontSize: 15, fontFamily: 'Madani',fontWeight: FontWeight.w500),
        textDirection: TextDirection.rtl,
      ),

      //Status
      // subtitle: Text(
      //   SayDesc(status),
      //   style: const TextStyle(
      //       fontSize: 10, fontFamily: 'Madani', color: Color(0xff909090)),
      //   textDirection: TextDirection.rtl,
      // ),

      //Truck Icon
      // trailing: SimplePic(SayImage(title), 45, 56),


      onTap: () async{
        // if(order.Status == 'Accepted' || order.Status == 'Waiting') {
        Get.to(
                () => orderInfo(order,false),
            transition: Transition.rightToLeft
        );
        // } else if(order.Status == 'Delivered' || order.Status == 'Canceled'){
        //   Get.to(
        //           () => LoadingRoute(order: order),
        //       transition: Transition.rightToLeft
        //   );
        // }

      },
    ),
  );
}
Widget _OrdersListnow(BuildContext context,Orders order)  {

  // Return Status Color Type Depending on the State
  Color SayColor(Status){

    if(Status == 'Delivered') {
      return const Color(0xff2FBF71);

    } else if(Status == 'Pending') {
      return const Color(0xff015FF5);

    } else if(Status == 'Accepted') {
      return const Color(0xff191F28);

    } else if(Status == 'Waiting') {
      return const Color(0xffe1c01c);

    } else {
      return Colors.red;
    }
  }


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
          width: 50,
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
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  //todo: set its own Parameter
                    color: SayColor("Delivered"),
                    shape: BoxShape.circle
                ),
              ),
              // Text(
              //     'مكتمله',
              //     textAlign: TextAlign.left,
              //     style:  TextStyle(
              //       fontFamily: 'Madani',
              //       fontSize: 10,
              //       fontWeight: FontWeight.w300,
              //       //todo: set its own Parameter
              //       color: SayColor('Delivered'),
              //
              //     )
              // ),
            ],
          ),
        ),
      ),

      //Truck Name
      title: Text(
        order.driverName!,
        style: const TextStyle(fontSize: 15, fontFamily: 'Madani',fontWeight: FontWeight.w500),
        textDirection: TextDirection.rtl,
      ),

      //Status
      // subtitle: Text(
      //   SayDesc(status),
      //   style: const TextStyle(
      //       fontSize: 10, fontFamily: 'Madani', color: Color(0xff909090)),
      //   textDirection: TextDirection.rtl,
      // ),

      //Truck Icon
      // trailing: SimplePic(SayImage(title), 45, 56),


      onTap: () async{
        // if(order.Status == 'Accepted' || order.Status == 'Waiting') {
        Get.to(
                () => orderInfo(order,false),
            transition: Transition.rightToLeft
        );
        // } else if(order.Status == 'Delivered' || order.Status == 'Canceled'){
        //   Get.to(
        //           () => LoadingRoute(order: order),
        //       transition: Transition.rightToLeft
        //   );
        // }

      },
    ),
  );
}

ListView OrdersList(List<Orders> List,var context,{bool trial = false,int limit = 3}) {

  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: trial && List.length > limit ? limit  : List.length,
    itemBuilder: (context, index) {
      return 'Delivered' != List[index].orderType ? 'Canceled'  != List[index].orderType ? Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: _OrdersListViewDone(context,List[index])
      )
          :
      Container()
          :
      Container()
      ;
    },
  );
}
ListView OrdersListDone(List<Orders> List,var context,{bool trial = false,int limit = 3}) {

  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: trial && List.length > limit ? limit  : List.length,
    itemBuilder: (context, index) {
      return 'Delivered' != List[index].orderType ? 'Canceled'  != List[index].orderType ? Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: _OrdersListnow(context,List[index])
      )
          :
      Container()
          :
      Container()
      ;
    },
  );
}

//User in order Details page
DetailsListView(var title,var subtitle,var numb,var unit,var image,var context)  {

  //Truck Image
  if(title == 'شاحنة ALX')
    image = 'ALX';
  else if(title == 'شاحنة HALA AA19')
    image = 'AA19';
  else if(title == 'شاحنة BIG MONSTER')
    image =  'BIG';

  //trailer
  else if(title == 'شاحنه مفتوحة من جانب')
    image = 'ALX';
  else if(title == 'شاحنه شبك')
    image = 'AA19';
  else if(title == 'شاحنه مغلقة')
    image = 'BIG';

  //trailer Type
  else if(title == 'شاحنه مبردة')
    image = 'Aired';
  else if(title == 'شاحنة مثلجة')
    image = 'Snow';
  else if(title == 'شاحنة جافة')
    image = 'Dry';

  //Load Type
  else if(title == 'حولة أدوية')
    image = 'med';
  else if(title == 'حمولة اطعمة')
    image = 'food';
  else if(title == 'حمولة حديد')
    image = 'metal';
  else if(title == 'حمولة بضائع')
    image = 'package';
  else if(title == 'حمولة مواشي')
    image = 'cattle';
  else if(title == 'خاص )أخرى(')
    image = 'others';


  return Container(
    width: MediaQuery.of(context).size.width-50,
    height: 63,
    alignment: Alignment.center,
    child: ListTile(

        leading: numb != '' ?
        Container(
          alignment: Alignment.centerLeft,
          width: 65,
          child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '$numb ',
                    style: const TextStyle(
                        fontFamily: 'Madani',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff191F28))),
                TextSpan(
                    text: unit,
                    style: const TextStyle(
                        fontFamily: 'Madani',
                        fontSize: 12,
                        color: Color(0xff191F28)))
              ])),
        ) :
        null,
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontFamily: 'Madani',fontWeight: FontWeight.w500),
          textDirection: TextDirection.rtl,
        ),
        subtitle: subtitle == '' ? null : Text(
          subtitle,
          style: const TextStyle(
              fontSize: 10, fontFamily: 'Madani', color: Color(0xff909090)),
          textDirection: TextDirection.rtl,
        ),
        trailing: Image.asset('assets/pics/$image.png',width: 33,)

    ),
  );
}
