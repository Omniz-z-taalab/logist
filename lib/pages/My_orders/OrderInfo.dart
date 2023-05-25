import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logist/core/logic/layout/order/order_provider.dart';
import 'package:logist/core/utilities/dio_helper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Classes/Order_Class.dart';
import '../../models/chat/inbox_model.dart';
import '../../others/variables.dart';
import 'Details.dart';

class DateUtil {
  static const DATE_FORMAT = 'dd/MM/yyyy';

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}

class orderInfo extends StatefulWidget {
  final int id;

  orderInfo(this.id);

  @override
  State<orderInfo> createState() => _orderInfoState();
}

class _orderInfoState extends State<orderInfo> {
  // Orders order;
  var driver;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderProvider>().orderDetails(widget.id);
    });
  }

  // _orderInfoState(this.order);
  ChatListResponse? list;

  @override
  Widget build(BuildContext context) {
    var driver = context.watch<OrderProvider>().orderDitModel;

    // var response = context.watch<ChatProvider>().inboxMessage ;
    // list = response![driver!.userId];
    return Scaffold(
      backgroundColor: Obackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'ملخص',
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
      body: context.watch<OrderProvider>().orderDitModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: SizedBox(
                height: double.infinity,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            // Profile_pic(driver!),
                            //Driver Name
                            Text(
                              driver!.driverName!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 10),

                            //Truck name
                            Text(
                              DateUtil().formattedDate(
                                  DateTime.parse(driver.orderStartTime)),
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff909090)),
                            ),

                            //Rating
                            // rating("4"),
                            // rating("4"),
                          ],
                        ),

                        // //Truck Info
                        // truck(order.Truck.name,order.driver.TruckInfo.plate,order.driver.TruckInfo.license,'assets/pics/trALX.png'),

                        // SizedBox(height: 20),

                        // //Order Info
                        // Approvement(order),

                        const SizedBox(height: 20),

                        //Order Status
                        CancelOrder(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              'حالة الطلب',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: Color(0xff191F28)),
                            ),
                            Text(
                              'لم يتم نقل الشحنة إلى الآن',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Montserrat',
                                color: Color(0xff969696),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),

                    //Continue Order
                    // widget.inSetup ?
                    ///
//                     Positioned(
//                       bottom: 0,
//                       child: Column(
//                         children: [
//                           MaterialButton(
//                               height:
//                                   MediaQuery.of(context).size.height * 0.075,
//                               minWidth: MediaQuery.of(context).size.width - 50,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(31)),
//                               color: Colors.green,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'محادثه مع السائق ',
//                                     style: TextStyle(
//                                         fontSize: 11,
//                                         fontFamily: 'Araboto',
//                                         color: Colors.white),
//                                   ),
//                                   Icon(
//                                     Icons.chat,
//                                     color: Colors.white,
//                                   ),
//                                 ],
//                               ),
//                               onPressed: () {
//                                 driver!.driverName;
//                                 driver!.userId;
//                                 driver!.driverID;
//                                 driver!.driverID;
//                                 context
//                                     .read<ChatProvider>()
//                                     .getInbox(userId: driver!.userId);
//                                 print('user id is ${driver!.userId}driver');
//                                 print('user id is ${list}driver');
//                                 Get.to(() => conversation());
//                               }
//                               ),
// // SizedBox(height: 20,),
// //                     MaterialButton(
// //
// //                       height: MediaQuery.of(context).size.height * 0.075,
// //                       minWidth: MediaQuery.of(context).size.width - 50,
// //                       color: const Color(0xff191F28),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(37.5),
// //                         side: BorderSide(color: Theme.of(context).primaryColor),
// //                       ),
// //
// //
// //                       child: const Text(
// //                         'إتمام الرحلة',
// //                         style: TextStyle(
// //                           fontFamily: 'Montserrat',
// //                           fontSize: 16,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                       onPressed: (){
// //                         Get.to(
// //                             () =>orderMap(),
// //                             transition: Transition.rightToLeft
// //                         );
// //                       },
// //                     ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.02,
//                           ) //todo:check on iphone 11
//                         ],
//                       ),
//                     )
                    // : Container(),
                  ],
                ),
              ),
            ),
    );
  }

  //Profile picture
  Widget Profile_pic(String Link) {
    return Container(
      child: Column(
        children: [
          //Image position
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xffECF4FD),
            ),
            width: 113,
            height: 113,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(Link)),
          ),

          //to add space
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  _AlertDialog() {
    var alertStyle = AlertStyle(
      overlayColor: Color(0x99000000),
      alertAlignment: Alignment.center,
      animationType: AnimationType.shrink,
      animationDuration: const Duration(milliseconds: 100),
      alertPadding: const EdgeInsets.all(24),
      isButtonVisible: false,
      constraints: const BoxConstraints(maxWidth: 293, maxHeight: 279),
      buttonAreaPadding: const EdgeInsets.only(bottom: 20),
      alertBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
      titleTextAlign: TextAlign.right,
      descTextAlign: TextAlign.right,
      isCloseButton: false,
      isOverlayTapDismiss: false,
    );

    Alert(
        style: alertStyle,
        context: context,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 49),

            //Status
            const SizedBox(
              width: 238,
              child: Text(
                "إلغاء الطلب",
                style: TextStyle(
                    fontFamily: 'Madani',
                    color: Color(0xff191F28),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 21),

            //Description
            const SizedBox(
              width: 247,
              child: Text(
                "هل تود إلغاء الطلب",
                style: TextStyle(
                  fontFamily: 'Madani',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xff999999),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: MaterialButton(
                  //Style Settings
                  color: Colors.transparent,
                  minWidth: 130,
                  height: 66,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(37),
                  ),
                  splashColor: Colors.transparent,
                  highlightElevation: 0,

                  child: const Text(
                    'ليس بعد',
                    style: TextStyle(
                      fontFamily: 'Madani',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
                Expanded(
                    child: MaterialButton(
                  //Style Settings
                  color: true ? Confirme : const Color(0xff2FBF71),
                  minWidth: 160,
                  height: 66,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(37),
                  ),

                  child: const Text(
                    'نعم',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Provider.of<OrderProvider>(context, listen: false)
                        .cancelOrders(
                            Provider.of<OrderProvider>(context, listen: false)
                                .orderDitModel!
                                .id,
                            context);
                  },
                )),
              ],
            ),
          ],
        ),
        buttons: []).show();
  }

  Widget CancelOrder() {
    var driver = context.watch<OrderProvider>().orderDitModel;

    // if(widget.inSetup)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Order Button
        MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
            color: Color(0xff191F28),
            child: const Text(
              'إلغاء الطلب',
              style: TextStyle(
                  fontSize: 11, fontFamily: 'Araboto', color: Colors.white),
            ),
            onPressed: () {
              if (driver!.started != 1) {
                _AlertDialog();
              } else {
                showToast('غير مقبول', true, false);
              }
            }),

        //Order Status

        //Accepted / refused
        Container(
            alignment: Alignment.center,
            height: 23,
            width: 65,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(13)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 11,
                  width: 11,
                  decoration: BoxDecoration(
                      color: Color(0xff191F28),
                      borderRadius: BorderRadius.circular(100)),
                ),
                Text(
                  driver!.accepted == 1
                      ? 'مقبولة'
                      : driver!.canceled == 1
                          ? 'مرفوضه'
                          : "لم تبداء",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
      ],
    );
    return Container();
  }

  Approvement(Order order) {
    String title = '';
    String subtitle = '';
    Icon StatusIcon = Icon(Icons.access_alarm);
    if (order.Status == 'Accepted') {
      title = 'تم قبول الطلب';
      subtitle = 'الحالة سليمة تمت الموافقة على طلبك من طرف السائق';
      StatusIcon = Icon(
        CupertinoIcons.checkmark_alt_circle_fill,
        size: 42,
        color: Color(0xff004440),
      );
    } else if (order.Status == 'Waiting') {
      title = 'في إنتضار قبول الطلب';
      subtitle = 'في إنتضار قبول الطلب من طرف السائق';
      StatusIcon = Icon(
        CupertinoIcons.stopwatch_fill,
        size: 42,
        color: Color(0xff004440),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 63,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Araboto',
              fontWeight: FontWeight.w500,
              color: Color(0xff191F28)),
          textAlign: TextAlign.end,
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              fontSize: 10, fontFamily: 'Araboto', color: Color(0xff969696)),
          textAlign: TextAlign.end,
        ),
        trailing: StatusIcon,
      ),
    );
  }

  rating(DriverRating rating) {
    return Container(
      //color: Colors.grey,
      height: 95,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Rating lines
            Container(
              height: 95,
              width: (MediaQuery.of(context).size.width / 2) - (25 + 30),
              //color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //5 Stars
                  LinearPercentIndicator(
                    isRTL: true,
                    width: 94.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '5 نجوم',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    alignment: MainAxisAlignment.center,
                    percent: rating.FiveStars / 100,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),

                  //4 Stars
                  LinearPercentIndicator(
                    isRTL: true,
                    alignment: MainAxisAlignment.center,
                    width: 94.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '4 نجوم',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    percent: rating.FourStars / 100,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),

                  //3 Stars
                  LinearPercentIndicator(
                    isRTL: true,
                    alignment: MainAxisAlignment.center,
                    width: 94.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '3 نجوم',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    percent: rating.ThreeStars / 100,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),

                  //2 Stars
                  LinearPercentIndicator(
                    isRTL: true,
                    alignment: MainAxisAlignment.center,
                    width: 94.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '4 نجوم',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    percent: rating.TwoStars / 100,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),

                  //1 Stars
                  LinearPercentIndicator(
                    width: 94.0,
                    alignment: MainAxisAlignment.center,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 6.0,
                    trailing: Text(
                      '1 نجمة',
                      style: TextStyle(
                        fontFamily: 'Araboto',
                        fontSize: 9,
                        color: Color(0xffC2C2C2),
                      ),
                    ),
                    isRTL: true,
                    percent: 0.1,
                    progressColor: Color(0xffF3B304),
                    barRadius: Radius.circular(10),
                  ),
                ],
              ),
            ),

            //Rating Data
            Container(
              width: (MediaQuery.of(context).size.width / 2) - (25 + 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //todo: Complete the rating indicator
                // 3 Widgets Here
                children: [
                  //4.6 / 5
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        rating.Base,
                        style:
                            TextStyle(fontSize: 44, fontFamily: 'circular std'),
                      ),
                      Text(
                        '/5',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'circular std',
                          color: Color(0xffC2C2C2),
                        ),
                      )
                    ],
                  ),

                  //بناء على 300 مراجعة
                  Text(
                    'بناء على  ${rating.Total} مراجعة',
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w200,
                      color: Color(0xffC2C2C2),
                    ),

                    //Stars check Figma
                  ),

                  RatingBar.builder(
                      itemSize: 24,
                      initialRating: double.parse(rating.Base),
                      ignoreGestures: true,
                      // textDirection: TextDirection.rtl,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Color(0xffF3B304)),
                      onRatingUpdate: (rating) {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  truck(var title, var id, var plat, var image) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 63,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Araboto',
              fontWeight: FontWeight.w500,
              color: Color(0xff191F28)),
          textAlign: TextAlign.end,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Araboto',
                      color: Color(0xff969696),
                    ),
                    children: [
                  TextSpan(
                    text: '$id /',
                  ),
                  const TextSpan(
                    text: 'رقم الرخصة ',
                  ),
                ])),
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Araboto',
                      color: Color(0xff969696),
                    ),
                    children: [
                  TextSpan(text: '$plat /'),
                  const TextSpan(text: 'رقم اللوحة ')
                ]))
          ],
        ),
        trailing: Image.asset(
          image,
          width: 40,
        ),
      ),
    );
  }

  Widget Next(String par) => MaterialButton(
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
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        onPressed: () {
          //Button destination
          Get.to(details());
        },
      );
}
