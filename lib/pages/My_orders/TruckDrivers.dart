import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:logist/core/logic/drivers/driver_provider.dart';
import 'package:provider/provider.dart';
import '../../models/driver_model.dart';
import '../../models/viecelModel/viecleModel.dart';
import '../../others/variables.dart';
import '../test_page.dart';
import 'Resume.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class truckdrivers extends StatefulWidget {
  var lat1;
  var lat2;
  var lng1;
  var lng2;
  String noteText;
  int PayloadText;
  List<String> TimeNum;
  String Trtext;
  int Typetext;
  String placeuserpick1;
  String placeuserdown1;
  String placeuserpick2;
  String placeuserdown2;
  int vicleId;

  truckdrivers(
      this.lat1,
      this.lat2,
      this.lng1,
      this.lng2,
      this.noteText,
      this.PayloadText,
      this.TimeNum,
      this.Trtext,
      this.Typetext,
      this.placeuserpick1,
      this.placeuserdown1,
      this.placeuserpick2,
      this.placeuserdown2,
      this.vicleId);

  @override
  State<truckdrivers> createState() => _truckdriversState();
}

class _truckdriversState extends State<truckdrivers> {
  final ApanelController = PanelController();

  final int _selectedIndex = 0;

  //Slid up panel Data
  String Name = '';
  String Truck = '';
  String Pic = '';
  String ratings = '4';
  String Reviews = '0';

  void Open() {
    ApanelController.isPanelClosed ? ApanelController.open() : null;
  }

  @override
  void initState() {
    Provider.of<DriversProvider>(context, listen: false)
        .getAllDrivers();
    // TODO: implement initState
    super.initState();
    print(widget.lat1);
    print(widget.lng1);
    print(widget.PayloadText.toString());
  }

  @override
  Widget build(BuildContext context) {
    var drivers = context.watch<DriversProvider>().driver;
  var driver =   Provider.of<DriversProvider>(context,listen: false).driverModel;

    return Scaffold(
      backgroundColor: Obackground,
      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'السائقيين',
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
      body: Center(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: SizedBox(
                  height: 300,
                  child: drivers == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : drivers.isEmpty
                          ? const Center(
                              child: Text('لايوجد سائقين حاليا'),
                            )
                          : _buildListView(drivers),
                )),
          ],
        ),
      ),
    );
  }

  Approvement(var title, var subtitle) {
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
          textDirection: TextDirection.rtl,
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              fontSize: 10, fontFamily: 'Araboto', color: Color(0xff969696)),
          textDirection: TextDirection.rtl,
        ),
        trailing: const Icon(
          CupertinoIcons.checkmark_alt_circle_fill,
          size: 42,
          color: Color(0xff004440),
        ),
      ),
    );
  }

  //Profile picture
  Widget Profile_pic() {
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
                child: Image.asset(Pic)),
          ),

          //to add space
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  //Here
  rating() {
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
                    percent: 1,
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
                    percent: 0.35,
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
                    percent: 0.12,
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
                    percent: 0.1,
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
              // width:  (MediaQuery.of(context).size.width / 2) - (25+30),
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
                        ratings,
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'circular std'),
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
                    'بناء على $Reviews مراجعة',
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
                      initialRating: double.parse(ratings),
                      ignoreGestures: true,
                      textDirection: TextDirection.rtl,
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
            textDirection: TextDirection.rtl,
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
            width: 33,
          )),
    );
  }

  // Widget Next(String par) => MaterialButton(
  //       color: On,
  //       minWidth: double.infinity,
  //       height: 60,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(100.0),
  //       ),
  //       child: Container(
  //         child: Text(
  //           par,
  //           style: const TextStyle(
  //             fontSize: 16,
  //             color: Colors.white,
  //             fontFamily: 'Montserrat',
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ),
  //       onPressed: () {
  //         Get.to(() =>
  //
  //             ResumeScreen(
  //                 widget.lat1,
  //                 widget.lat2,
  //                 widget.lng1,
  //                 widget.lng2,
  //                 widget.noteText,
  //                 widget.PayloadText,
  //                 widget.TimeNum,
  //                 widget.Trtext,
  //                 widget.Typetext,
  //                 drivers![index].id!,
  //                 widget.placeuserpick1,
  //                 widget.placeuserdown1,
  //                 widget.placeuserpick2,
  //                 widget.placeuserdown2,widget.vicleId));
  //         //Button destination
  //       },
  //     );

  ListView _buildListView(List<DriversModel> drivers) {
    return
      ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          return InkWell(
                child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black12,
                    )),
                child: ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                  title: Text(
                    drivers![index].fullName!,
                    style:
                        const TextStyle(fontSize: 14, fontFamily: 'ArabotoFat'),
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        drivers![index].license!,
                        style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'Araboto',
                            color: Color(0xff909090)),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        drivers![index].plateNumber!,
                        style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'Araboto',
                            color: Color(0xff909090)),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  trailing: CircleAvatar(
                    backgroundImage: NetworkImage(drivers![index].lecensePhoto!),
                  ),
                  onTap: () {
                    print(drivers![index].id!);
                    Provider.of<DriversProvider>(context,listen: false).getDetailsDriver(id:drivers![index].id);
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext builder){
                          return CupertinoPopupSurface(
                            isSurfacePainted: false,
                            child: Material(
                              child:   drivers![index].id! == null ?
                                    CircularProgressIndicator()
                           :   panal(drivers![index].id!) )

                                );},
                    );

                  },
                ),
              ),
            )
          );
    });}

  Widget panal( index) {
    Provider.of<DriversProvider>(context,listen: false).getDetailsDriver(id:index);
    var  driver =   Provider.of<DriversProvider>(context,listen: false).driverModel;
    print(index);
    print('youssef');
    return   driver == null
        ? CircularProgressIndicator()
        :
    Container(
      height: 400,
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(height: 10,),
          Container(
            width: 58,
            height: 4,
            decoration: BoxDecoration(
              color: Color(0xffEFEFEF),
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          SizedBox(height: 50),

          //Driver Picture
          CircleAvatar(
            backgroundImage: NetworkImage(driver.lecensePhoto!),
          ),

          //Driver Name
          Text(
            driver!.fullName!,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 10),

          //Truck name
          Text(
            driver!.status!,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                color: Color(0xff909090)),
          ),
        SizedBox(height: 10),

        Text(
          driver!.license!,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
              color: Color(0xff909090)),
        ),
        SizedBox(height: 10),

        Text(
          driver!.phoneNumber!,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
              color: Color(0xff909090)),
        ),
          //Truck Info

          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child:  MaterialButton(
                    color: On,
                    minWidth: double.infinity,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Container(
                      child: Text(
                        'اختر السائق',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() =>

                          ResumeScreen(
                              widget.lat1,
                              widget.lat2,
                              widget.lng1,
                              widget.lng2,
                              widget.noteText,
                              widget.PayloadText,
                              widget.TimeNum,
                              widget.Trtext,
                              widget.Typetext,
                              driver.id!,
                              widget.placeuserpick1,
                              widget.placeuserdown1,
                              widget.placeuserpick2,
                              widget.placeuserdown2,widget.vicleId));
                      //Button destination
                    },
                  ))
            ),
          )
      ],
    ),
        ); // Open();
  }
}



// Future<void> setDriverData(int choice) async {
//   Name = [choice];
//   Truck = trName[choice];
//   Pic = Pics[choice];
//   ratings = Rating[choice];
//   Reviews = Review[choice];
// }
