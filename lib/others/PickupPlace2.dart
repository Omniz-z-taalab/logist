import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logist/core/utilities/dio_helper.dart';
import 'package:provider/provider.dart';

import '../core/logic/price_payment/price_payment.dart';
import '../pages/My_orders/ChooseDriver.dart';
import 'app_input_text_field.dart';
import 'variables.dart';

class package_place2 extends StatefulWidget {
  var lat1;
  var lng1;
  var lat2;
  var lng2;
  String noteText;
  int PayloadText;
  List<String> TimeNum;
  List<String> TimeEnd;
  String Trtext;
  int Typetext;
  String placeuserpick1;
  String placeuserdown1;
  String placeuserpick2;
  String placeuserdown2;
  int vicleId;
  int trilerId;

  //I/flutter (14415): latttttt24.7721495,lnggggggg46.6975932
//  I/flutter (14415): latt124.79367045270101lng146.677787117660046
//I/flutter (14415): latt224.7721495lng246.6975932
  package_place2(
      this.lat1,
      this.lng1,
      this.lat2,
      this.lng2,
      this.noteText,
      this.PayloadText,
      this.TimeNum,
      this.TimeEnd,
      this.Trtext,
      this.Typetext,
      this.placeuserpick1,
      this.placeuserdown1,
      this.placeuserpick2,
      this.placeuserdown2,
      this.vicleId,
      this.trilerId);

  @override
  State<package_place2> createState() => _package_place2State();
}

class _package_place2State extends State<package_place2> {
  int currentStep = 1;
  var latU1;
  var latU2;
  var lngU1;
  var lngU2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    latU1 = widget.lat1;
    latU2 = widget.lat2;
    lngU1 = widget.lng1;
    lngU2 = widget.lng2;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _locationNoteController = TextEditingController();
  final _destenationNoteController = TextEditingController();

  //Next Button
  Widget Next(String par) => MaterialButton(
        color: On,
        minWidth: double.infinity,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Text(
          par,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          //Button destination
          // Navigator.push<void>( context,  MaterialPageRoute<void>( builder: (BuildContext context) => const s1() ));
          print(_formKey.currentState!.validate());
          // Get.to(orderMap()); //todo: what was planned to DO
          if (_formKey.currentState!.validate()) {
            Provider.of<PriceProvider>(context, listen: false)
                .getPrice(widget.lat1, widget.lng1, widget.lat2, widget.lng2)
                .then((value) {
              if (Provider.of<PriceProvider>(context, listen: false).distance !=
                  -1) {
                Get.to(
                    () => chooseDriver(
                        widget.lat1,
                        widget.lat2,
                        widget.lng1,
                        widget.lng2,
                        widget.noteText,
                        widget.PayloadText,
                        widget.TimeNum,
                        widget.TimeEnd,
                        widget.Trtext,
                        widget.Typetext,
                        widget.placeuserpick1,
                        widget.placeuserdown1,
                        widget.placeuserpick2,
                        widget.placeuserdown2,
                        widget.vicleId,
                        widget.trilerId,
                        _locationNoteController.text,
                        _destenationNoteController.text),
                    transition: Transition.rightToLeft);
              } else {
                showToast("يوجد خطأ في مكان التوصيل و الاستلام", false, false);
              }
            });
          }
          print('Went to Map2');
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: SizedBox(),
        actions: [
          SizedBox(
            height: 52,
            width: 52,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white.withOpacity(0.8)),
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
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Padding(
                    padding: EdgeInsets.all(25),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'مكان الشحنة',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 27),
                              child: Text(
                                'يمكنك تحديد أكثر من شحنة  للوصول.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                //First Text
                                Expanded(
                                  flex: 7,
                                  child: InkWell(
                                    child: Container(
                                      height: 77,
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Color(0xff1877F2),
                                        ),
                                        color: Color(0xffF1F7FF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13.0)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30),
                                            child: Text(
                                              Origine[0],
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff191F28),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30),
                                            child: Text(
                                              Origine[1],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w300,
                                                  height: 0.1,
                                                  color: Color(0xff1877F2)),
                                            ),
                                          ),
                                          Container(width: double.infinity)
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      // Get.to(LocationUser1());
                                    },
                                  ),
                                ),

                                Container(
                                  width: 10,
                                ),

                                //Second Text
                                InkWell(
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Color(0xff1877F2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ),
                                  onTap: () {
                                    // Get.to(LocationUser2(22,44));
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            AppTextInputField(
                              controller: _locationNoteController,
                              hintText: "أدخل عنوان الاستلام بالتفصيل",
                              maxLines: 4,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ادخل العنوان بالتفصيل";
                                }
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    height: 77,
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xff1877F2),
                                      ),
                                      color: Color(0xffF1F7FF),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13.0)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            Destination[0],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff191F28),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            Destination[1],
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w300,
                                                height: 0.1,
                                                color: Color(0xff1877F2)),
                                          ),
                                        ),
                                        Container(width: double.infinity)
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Container(
                                    width: 32,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.location_on,
                                      size: 32,
                                      color: Color(0xff1877F2),
                                    ))
                              ],
                            ),
                            SizedBox(height: 20),
                            AppTextInputField(
                              controller: _destenationNoteController,
                              hintText: "أدخل عنوان التوصيل بالتفصيل",
                              maxLines: 4,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ادخل العنوان بالتفصيل";
                                }
                              },
                            ),
                            SizedBox(height: 30),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 50,
                                child: Next('التالي'))
                          ],
                        ),
                      ),
                    )),
              ))),
    );
  }
}
