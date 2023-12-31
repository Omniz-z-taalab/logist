import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logist/core/logic/price_payment/price_payment.dart';
import 'package:logist/core/logic/viecles/viecles_provider.dart';
import 'package:logist/others/variables.dart';
import 'package:provider/provider.dart';

import '../../widgets/Widgets.dart';

class ResumeScreen extends StatefulWidget {
  var lat1;
  var lat2;
  var lng1;
  var lng2;
  String noteText;
  int PayloadText;
  List<String> TimeNum;
  List<String> TimeEnd;
  String Trtext;
  int Typetext;
  int id;
  String placeuserpick1;
  String placeuserdown1;
  String placeuserpick2;
  String placeuserdown2;
  int vicleId;
  int trilerId;
  String? locationNote;
  String? destenationNote;

  ResumeScreen(
      this.lat1,
      this.lat2,
      this.lng1,
      this.lng2,
      this.noteText,
      this.PayloadText,
      this.TimeNum,
      this.TimeEnd,
      this.Trtext,
      this.Typetext,
      this.id,
      this.placeuserpick1,
      this.placeuserdown1,
      this.placeuserpick2,
      this.placeuserdown2,
      this.vicleId,
      this.trilerId,
      this.locationNote,
      this.destenationNote);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  @override
  var showArrow = false;

  var showLoading = false;

  // Widget myIconButton() {
  //   if (!showLoading)
  //     return showArrow
  //         ? IconButton(
  //         icon: Icon(Icons.clear, color: Colors.white),
  //         onPressed: () {
  //           setState(() {
  //             showArrow = !showArrow;
  //             showLoading = !showLoading;
  //           });
  //           Future.delayed(Duration(seconds: 3), () {
  //             if (mounted)
  //               setState(() {
  //                 showLoading = !showLoading;
  //               });
  //           });
  //         })
  //         : IconButton(
  //       icon: Icon(Icons.arrow_right),
  //       onPressed: () {},
  //     );
  //   else
  //     return SizedBox(
  //         width: 20, height: 20, child: CircularProgressIndicator());}
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PriceProvider>(context, listen: false)
          .getPrice(widget.lat1, widget.lng1, widget.lat2, widget.lng2);
    });
    print(widget.noteText);
    // myIconButton();
  }

  //Enable While Debugging

  // List<String> Origine = ['',''];
  // List<String> Destination = ['',''];
  // String distance = '13.6';

  @override
  Widget build(BuildContext context) {
    var price = context.watch<PriceProvider>().price;
    var distance = context.watch<PriceProvider>().distance;
    return context.read<PriceProvider>().price == null
        ? const Center(
            child: SpinKitRing(
              size: 100,
              color: Color(0xff191F28),
            ),
          )
        : Scaffold(
            backgroundColor: Obackground,
            appBar: AppBar(
              backgroundColor: Obackground,
              centerTitle: true,
              elevation: 0,
              leading: const SizedBox(),
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
            body: context.read<PriceProvider>().price == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 28,
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
                                width: MediaQuery.of(context).size.width - 50,
                                height: 100,
                                child: Center(
                                  child: ListTile(
                                    leading: Container(
                                      alignment: Alignment.centerLeft,
                                      width: 150,
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: price.toString(),
                                            style: const TextStyle(
                                                fontFamily: 'visbydemibold',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff191F28))),
                                        const TextSpan(
                                            text: ' SAR',
                                            style: TextStyle(
                                                fontFamily: 'visbylight',
                                                fontSize: 18,
                                                color: Color(0xff191F28)))
                                      ])),
                                    ),
                                    title: const Text(
                                      'السعر النهائي',
                                      style: TextStyle(
                                          fontSize: 13, fontFamily: 'Araboto'),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ),
                              ),

                              //   Thin line
                              // Container(
                              //   width: MediaQuery.of(context).size.width,
                              //   height: 2,
                              //   color: const Color(0xffEDEDED),
                              // ),

                              //Driver Name
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 50,
                                height: 60,
                                child: Next('ادفع الآن'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 258,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 25),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 50,
                                child: Column(
                                  children: [
                                    //Depart

                                    detailedBar(
                                        title: widget.placeuserpick1,
                                        subtitle: widget.locationNote,
                                        numb: '',
                                        unit: '',
                                        image: 'depart',
                                        context: context),

                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),
                                    detailedBar(
                                        title: widget.placeuserpick2,
                                        subtitle: widget.destenationNote,
                                        numb: '',
                                        unit: '',
                                        image: 'arriving',
                                        context: context),

                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),
                                    detailedBar(
                                        title: 'مسافة نقل الشحنة',
                                        subtitle: '',
                                        numb: distance,
                                        unit: 'KM',
                                        image: 'distance',
                                        context: context),

                                    //Arrive
                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),
                                    detailedBar(
                                        title: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTrailer!
                                            .sName,
                                        subtitle: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTrailer!
                                            .sDesc,
                                        numb: '',
                                        unit: '',
                                        image: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTrailer!
                                            .sPic,
                                        context: context,
                                        isLocalImage: false),

                                    // ListView(title: widget.Typetext == 0 ? 'حمولة أدوية': widget.Typetext ==1 ?'حمولة اطعمة' : widget.Typetext ==2 ? 'حمولة حديد' :  widget.Typetext ==3? 'حمولة بضائع' : widget.Typetext ==4? 'حمولة مواشي': 'حمولة اخري'),

                                    //Distance
                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),
                                    detailedBar(
                                        title: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTruck!
                                            .sName,
                                        subtitle: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTruck!
                                            .sDesc,
                                        numb: '',
                                        unit: '',
                                        image: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTruck!
                                            .sPic,
                                        context: context,
                                        isLocalImage: false),

                                    //trailer type name
                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),

                                    detailedBar(
                                        title: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTrailerType!
                                            .sName,
                                        subtitle: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTrailerType!
                                            .sDesc,
                                        numb: '',
                                        unit: '',
                                        image: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTrailerType!
                                            .sPic,
                                        context: context,
                                        isLocalImage: false),

                                    //trailer type name

                                    //trailer type name
                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),

                                    detailedBar(
                                        title: Provider.of<VieclesProvider>(
                                                context)
                                            .selectedTruckType!
                                            .sName,
                                        subtitle: "",
                                        numb: '',
                                        unit: '',
                                        image: "truck",
                                        context: context,
                                        isLocalImage: true),

                                    //Truck name
                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),

                                    detailedBar(
                                        title: widget.TimeNum[0],
                                        subtitle: "",
                                        numb: widget.TimeNum[1],
                                        unit: '',
                                        image: "time",
                                        context: context,
                                        isLocalImage: true),
                                    //Truck name
                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),

                                    detailedBar(
                                        title: widget.TimeEnd[0],
                                        subtitle: "",
                                        numb: widget.TimeEnd[1],
                                        unit: '',
                                        image: "time",
                                        context: context,
                                        isLocalImage: true),
                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),

                                    // SizedBox(
                                    //   width: MediaQuery.of(context).size.width -
                                    //       50,
                                    //   // height: 80,
                                    //   child: ListTile(
                                    //       title: Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.spaceBetween,
                                    //         children: [
                                    //           Column(
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.end,
                                    //             mainAxisAlignment:
                                    //                 MainAxisAlignment.center,
                                    //             children: [
                                    //               Text(
                                    //                 "الي " +
                                    //                     widget.TimeEnd[0]
                                    //                         .toString(),
                                    //                 style: const TextStyle(
                                    //                     fontSize: 15,
                                    //                     fontFamily: 'Araboto',
                                    //                     fontWeight:
                                    //                         FontWeight.bold),
                                    //                 textDirection:
                                    //                     TextDirection.rtl,
                                    //               ),
                                    //               Text(
                                    //                 "الساعة " +
                                    //                     widget.TimeEnd[1]
                                    //                         .toString(),
                                    //                 style: const TextStyle(
                                    //                     fontSize: 12,
                                    //                     fontFamily: 'Araboto',
                                    //                     fontWeight:
                                    //                         FontWeight.bold),
                                    //                 textDirection:
                                    //                     TextDirection.rtl,
                                    //               ),
                                    //             ],
                                    //           ),
                                    //           Column(
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.end,
                                    //             mainAxisAlignment:
                                    //                 MainAxisAlignment.center,
                                    //             children: [
                                    //               Text(
                                    //                 "من " +
                                    //                     widget.TimeNum[0]
                                    //                         .toString(),
                                    //                 style: const TextStyle(
                                    //                     fontSize: 15,
                                    //                     fontFamily: 'Araboto',
                                    //                     fontWeight:
                                    //                         FontWeight.bold),
                                    //                 textDirection:
                                    //                     TextDirection.rtl,
                                    //               ),
                                    //               Text(
                                    //                 "الساعة " +
                                    //                     widget.TimeNum[1]
                                    //                         .toString(),
                                    //                 style: const TextStyle(
                                    //                     fontSize: 12,
                                    //                     fontFamily: 'Araboto',
                                    //                     fontWeight:
                                    //                         FontWeight.bold),
                                    //                 textDirection:
                                    //                     TextDirection.rtl,
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ],
                                    //       ),
                                    //       trailing: const CircleAvatar(
                                    //         child: Icon(
                                    //           Icons.calendar_month,
                                    //           size: 20,
                                    //           color: Colors.white,
                                    //         ),
                                    //         backgroundColor: Color(0xFF191F28),
                                    //       )),
                                    // ),
                                    //Truck Shape
                                    Container(
                                        height: 1,
                                        color: const Color(0xffF2F1F4)),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      height: 63,
                                      child: ListTile(
                                          leading: Container(
                                            alignment: Alignment.centerLeft,
                                            width: 65,
                                          ),
                                          title: Text(
                                            widget.noteText,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Araboto',
                                                fontWeight: FontWeight.bold),
                                            textDirection: TextDirection.rtl,
                                          ),
                                          trailing: CircleAvatar(
                                            child: Icon(
                                              Icons.edit_note,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            backgroundColor: Color(0xFF191F28),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    )
                                    //Truck Type
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

  //24.677289383397685 , 46.663560010492795
  detailedBar(
      {var title,
      var subtitle,
      var numb,
      var unit,
      var image,
      bool isLocalImage = true,
      var context}) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      // height: 63,
      alignment: Alignment.center,
      child: ListTile(
          leading: numb != ''
              ? Container(
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
                )
              : null,
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Madani',
                fontWeight: FontWeight.w500),
            textDirection: TextDirection.rtl,
          ),
          subtitle: subtitle == ''
              ? null
              : Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Madani',
                      color: Color(0xff909090)),
                  textDirection: TextDirection.rtl,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
          trailing: isLocalImage
              ? SimplePic(image, 33, 33)
              : SimplePicNetwork(image, 33, 33)),
    );
  }

  // detailedBar({var title, var subtitle, var numb, var unit, var image}) {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width - 50,
  //     height: 63,
  //     child: ListTile(
  //         leading: Container(
  //           alignment: Alignment.centerLeft,
  //           width: 20,
  //         ),
  //         title: Text(
  //           title,
  //           overflow: TextOverflow.ellipsis,
  //           style: const TextStyle(
  //               fontSize: 15,
  //               fontFamily: 'Araboto',
  //               fontWeight: FontWeight.bold),
  //           textDirection: TextDirection.rtl,
  //         ),
  //         subtitle: subtitle == ''
  //             ? null
  //             : Text(
  //                 subtitle,
  //                 style: const TextStyle(
  //                     fontSize: 10,
  //                     fontFamily: 'Araboto',
  //                     color: Color(0xff909090)),
  //                 textDirection: TextDirection.rtl,
  //                 textAlign: TextAlign.start,
  //               ),
  //         trailing: CircleAvatar(
  //           child: Icon(
  //             image,
  //             size: 20,
  //             color: Colors.white,
  //           ),
  //           backgroundColor: Color(0xFF191F28),
  //         )),
  //   );
  // }

  Widget Next(String par) => MaterialButton(
      color: On,
      minWidth: double.infinity,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: !Provider.of<PriceProvider>(context).res
          ? Text(
              par,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            )
          : CircularProgressIndicator(),
      onPressed: !Provider.of<PriceProvider>(context).res
          ? () {
              //Button destination

              Provider.of<PriceProvider>(context, listen: false).createOrder(
                  context: context,
                  vicleId: widget.vicleId,
                  vicleTypeId:
                      Provider.of<VieclesProvider>(context, listen: false)
                          .selectedTruckType!
                          .id,
                  dateStart: widget.TimeNum,
                  dateEnd: widget.TimeEnd,
                  lat1: widget.lat1,
                  lang1: widget.lng1,
                  lat2: widget.lat2,
                  lang2: widget.lng2,
                  driverId: widget.id,
                  trilerId: widget.trilerId,
                  trilerTypeId:
                      Provider.of<VieclesProvider>(context, listen: false)
                          .selectedTrailerType!
                          .id,
                  destenationNote: widget.destenationNote,
                  destenationTitle: widget.placeuserpick2,
                  locationNote: widget.locationNote,
                  locationTitle: widget.placeuserpick1,
                  note: widget.noteText);
            }
          : () {});
}
