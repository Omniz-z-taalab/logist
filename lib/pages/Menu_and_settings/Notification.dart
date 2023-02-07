import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import '../My_orders/DummyOnGoing.dart';
import '../../widgets/Location_service.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool isLoading = true;

  String NotifType(String type) {
    if (type == 'complete')
      return 'assets/pics/Done.png';
    else if (type == 'onGoing')
      return 'assets/pics/moving.png';
    else
      return 'assets/pics/Done.png';
  }

  Future<void> SetDummyData() async {
    var directions = await LocationService()
        .getDirections('24.7718399,46.7874393', '24.7474501,46.7274109');

    //Marker Dummy data
    dslat = 24.7474501;
    dslng = 46.7274109;

    Orlat = 24.7718399;
    Orlng = 46.7874393;

    Origine = [' Riyadh', ' Riyadh,Saudi Arabia'];
    Destination = ['Al Alamein, King Abdullah', 'Riyadh,Saudi Arabia'];

    // //Getting Route Info
    Dummy = directions['popyline_decoded'];
    dmlat = directions['start_location']['lat'];
    dmlng = directions['start_location']['lng'];
    bounds_sw = directions['bounds_sw'];
    bounds_ne = directions['bounds_ne'];
    distance = directions['distance'].toString();
  }

  final ApanelController = PanelController();

  double ratingValue = 0;

  int tip = 0;
  int spinnerTip = 0;

  bool otherTip = false;
  double HeadOpacity = 0;

  @override
  void initState() {
    super.initState();

    driverData = driverData2;
    trShape = trShape2;
    trType = trType2;
    loadType = loadType2;
    time = ['07.04.2022', '15:45', 'AM'];

    SetDummyData();
    done();
  }

  void done() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    Widget Notif(String title, String Subtitle, String type, String Icon,
        int hour, int min) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffF8FAFC)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Date
                  SizedBox(
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 14),
                      child: Text(
                        '${hour}h${min}m',
                        style: const TextStyle(
                          fontFamily: 'circular std',
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: Color(0xffA2A2A8),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:
//Information
                        Padding(
                      padding: const EdgeInsets.only(top: 19, bottom: 19),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff464646),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            Subtitle,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 9,
                              fontWeight: FontWeight.w200,
                              color: Color(0xff535359),
                            ),
                          ),
                          Container(
                            width: 210,
                          )
                        ],
                      ),
                    ),
                  ),
                  //Picture
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 5, right: 8),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                              width: 58,
                              height: 58,
                              child: Image.asset(
                                Icon,
                                width: 58,
                                height: 58,
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            height: 16.5,
                            width: 14.5,
                            decoration: BoxDecoration(
                              // color: Colors.transparent

                              border: Border.all(width: 1, color: Colors.white),

                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: Image.asset(NotifType(type)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          onTap: () {
            if (type == 'onGoing') {
              SetDummyData();
              Get.to(() => dummygoing(), transition: Transition.rightToLeft);
            } else if (type == 'complete') {
              ApanelController.isPanelClosed ? ApanelController.open() : null;
              // Get.to(
              //         () => orderMap(),
              //     transition: Transition.rightToLeft
              // );
            }
          },
        ),
      );
    }

    //Notification Body
    NotifList() {
      return Column(
        children: [
          Notif('تم توصيل الطلب بنجاح', 'تم توصيل الطلب من طرف محمد علي...',
              'complete', 'assets/pics/user7.png', 3, 14),
          Notif(
              'يتم نقل الشحنة حاليا',
              'يتم حاليا توصيل الطلب من طرف محمد علي...',
              'onGoing',
              'assets/pics/user7.png',
              3,
              40)
        ],
      );
    }

    //Shimer Notification Body
    ShimmerNotifList() {
      return Column(
        children: [
          ShimmerNotif(),
          ShimmerNotif(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Sbackground,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(HeadOpacity),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'التنبيهات',
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
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HeadOpacity == 0
                      ? Colors.white
                      : Colors.black
                          .withOpacity(HeadOpacity * 0.00000000000000001)),
              child: IconButton(
                color: Color(0xff323232),
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
      //todo:Complete the Notification Page

      body: SlidingUpPanel(
        controller: ApanelController,
        maxHeight: 700,
        minHeight: 0,
        backdropEnabled: true,
        backdropOpacity: 0.3,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        onPanelSlide: (value) {
          setState(() {
            HeadOpacity = value * 0.3;
          });
          print(value);
        },
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                child: isLoading ? ShimmerNotifList() : NotifList(),
              )),
        ),
        panel: rateYourDriver(),
      ),
    );
  }

  //Driver Profile Image
  Widget Profile_pic() {
    return Container(
      child: Stack(
        children: [
          //Image position
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xffECF4FD),
            ),
            width: 106,
            height: 106,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(driverData2[2])),
          ),

          //Status
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xffF3F8FF)),
              child: Image.asset('assets/pics/verified.png',
                  width: 21, height: 21, scale: 2.8),
            ),
          ),

          //to add space
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  //Rating Bar
  Widget driverRatingBar() {
    return RatingBar(
      minRating: 1,
      maxRating: 5,
      allowHalfRating: false,
      ratingWidget: RatingWidget(
        full: Image.asset('assets/pics/Star.png'),
        half: Image.asset('assets/pics/Star.png'),
        empty: Image.asset('assets/pics/emptystar.png'),
      ),
      onRatingUpdate: (value) {
        ratingValue = value;
        print(value);
      },
      itemSize: 40,
      itemPadding: EdgeInsets.symmetric(horizontal: 8),
    );
  }

  //100 / 50 / 25 sar
  Widget tipSelectingButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //100 SAR
        InkWell(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            alignment: Alignment.center,
            height: 83 * 0.95,
            width: 100 * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1,
                  color: tip == 100 ? Color(0xff191F28) : Color(0xffEAEAEA)),
              //Change
              color: tip == 100 ? Color(0xff191F28) : Colors.white,
            ),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 28 * 0.95,
                    fontFamily: 'visbydemibold',
                    //Change
                    color: tip == 100 ? Colors.white : Color(0xff191F28),
                  ),
                  children: <TextSpan>[
                    //Change
                    TextSpan(text: '100'),
                    TextSpan(
                        text: 'S AR',
                        style: TextStyle(
                            fontSize: 10 * 0.95, fontFamily: 'visbylight')),
                  ]),
            ),
          ),
          onTap: () {
            setState(() {
              //Change
              otherTip = false;
              tip = 100;
            });
          },
        ),

        //50 SAR
        InkWell(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            alignment: Alignment.center,
            height: 83 * 0.95,
            width: 100 * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1,
                  color: tip == 50 ? Color(0xff191F28) : Color(0xffEAEAEA)),
              //Change
              color: tip == 50 ? Color(0xff191F28) : Colors.white,
            ),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 28 * 0.95,
                    fontFamily: 'visbydemibold',
                    //Change
                    color: tip == 50 ? Colors.white : Color(0xff191F28),
                  ),
                  children: <TextSpan>[
                    //Change
                    TextSpan(text: '50'),
                    TextSpan(
                        text: ' SAR',
                        style: TextStyle(
                            fontSize: 10 * 0.95, fontFamily: 'visbylight')),
                  ]),
            ),
          ),
          onTap: () {
            setState(() {
              //Change
              otherTip = false;
              tip = 50;
            });
          },
        ),

        //25 SAR
        InkWell(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            alignment: Alignment.center,
            height: 83 * 0.95,
            width: 100 * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1,
                  color: tip == 25 ? Color(0xff191F28) : Color(0xffEAEAEA)),
              //Change
              color: tip == 25 ? Color(0xff191F28) : Colors.white,
            ),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 28 * 0.95,
                    fontFamily: 'visbydemibold',
                    //Change
                    color: tip == 25 ? Colors.white : Color(0xff191F28),
                  ),
                  children: <TextSpan>[
                    //Change
                    TextSpan(text: '25'),
                    TextSpan(
                        text: ' SAR',
                        style: TextStyle(
                            fontSize: 10 * 0.95, fontFamily: 'visbylight')),
                  ]),
            ),
          ),
          onTap: () {
            setState(() {
              //Change
              otherTip = false;
              tip = 25;
            });
          },
        ),
      ],
    );
  }

  //other tips question
  Widget otherTips() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(123, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text(
        'إضافة مبلغ اخر؟',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w200,
          color: Color(0xff282828),
        ),
        textAlign: TextAlign.right,
      ),
      onPressed: () {
        print('User want to support the driver');
        setState(() {
          tip = 200;
          otherTip = true;
        });
      },
    );
  }

  //other tips buttons
  Widget otherTipsButtons() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 83,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(123, 40),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'إلغاء',
                style: TextStyle(
                  fontFamily: 'ArabotoMedium',
                  color: Color(0xffFD6565),
                  fontSize: 16 * 0.95,
                ),
              ),
              onPressed: () {
                print('User want to support the driver');
                setState(() {
                  otherTip = false;
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              alignment: Alignment.center,
              height: 83,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: 100 < tip ? Color(0xff191F28) : Colors.white,
              ),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 28 * 0.95,
                      fontFamily: 'visbydemibold',
                      //Change
                      color: 100 < tip ? Colors.white : Color(0xff191F28),
                    ),
                    children: <TextSpan>[
                      //Change
                      TextSpan(text: tip.toString()),
                      TextSpan(
                          text: ' SAR',
                          style: TextStyle(
                              fontSize: 10 * 0.95, fontFamily: 'visbylight')),
                    ]),
              ),
            ),
            onTap: () {
              spinnerTip = 200;
              tip = 200;
              //_AlertDialog(context);
              pickValue();
            },
          ),
        ),
      ],
    );
  }

  //Costume tip Widget
  Widget costumeTip() {
    return Container(
      alignment: Alignment.center,
      height: 83,
      width: double.infinity,
      child: AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          child: otherTip ? otherTipsButtons() : otherTips()),
    );
  }

  //Send Button
  Widget Send() {
    return MaterialButton(
        child: Text(
          'ارسال',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        color: Color(0xff191F28),
        height: 75,
        minWidth: MediaQuery.of(context).size.width - 84,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(37.5))),
        onPressed: () {
          ApanelController.isPanelOpen ? ApanelController.close() : null;
        });
  }

  //tip picker Widget
  // ignore: non_constant_identifier_names
  _AlertDialog(context) async {
    context;

    var alertStyle = const AlertStyle(
      alertAlignment: Alignment.center,
      animationType: AnimationType.grow,
      animationDuration: Duration(milliseconds: 250),
      alertPadding: EdgeInsets.all(20),
      titleTextAlign: TextAlign.right,
      descTextAlign: TextAlign.right,
      isCloseButton: false,
      isOverlayTapDismiss: true,
    );

    Alert(
        style: alertStyle,
        context: context,
        content: NumberPicker(
          maxValue: 1000,
          minValue: 100,
          value: spinnerTip,
          step: 100,
          onChanged: (value) {
            tip = value;
            setState(() {
              spinnerTip = value;
            });
          },
        ),
        buttons: []).show();
  }

  void pickValue() {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(21.0))),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(21)),
                alignment: Alignment.center,
                height: 323,
                width: 378,
                child: InkWell(
                  child: NumberPicker(
                      selectedTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 76,
                          fontFamily: 'circular std'),
                      textStyle: TextStyle(
                          color: Color(0xffB9B9B9),
                          fontSize: 64,
                          fontFamily: 'circular std'),
                      value: tip,
                      minValue: 100,
                      maxValue: 1000,
                      step: 50,
                      itemHeight: 80,
                      itemWidth: double.infinity,
                      itemCount: 3,
                      onChanged: (value) {
                        setState(() =>
                            tip = value); // to change on widget level state
                        SBsetState(
                            () => tip = value); //* to change on dialog state
                      }),
                  onTap: () {
                    Get.back();
                  },
                ),
              );
            }),
            actions: [],
          );
        });
  }

  //Main rating page
  Widget rateYourDriver() {
    return Padding(
      padding: const EdgeInsets.only(left: 42, right: 42),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),

              Container(
                width: 58,
                height: 4,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              SizedBox(height: 20),

              Profile_pic(),

              SizedBox(height: 10),

              //Driver Name
              Text(
                driverData2[0],
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 9),

              //Truck name
              Text(
                driverData2[1],
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    color: Color(0xff909090)),
              ),

              SizedBox(height: 25),

              //Rating bar
              driverRatingBar(),

              SizedBox(height: 25),

              //Support question text
              Text(
                'هل تود دعم السائق؟',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w200,
                  color: Color(0xff3E3E3E),
                ),
              ),

              SizedBox(height: 15),

              //Chose your tip
              tipSelectingButton(),

              SizedBox(height: 13),

              //other tip Values
              costumeTip(),

              // SizedBox(height: 46),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),

              Send(),
            ],
          ),
          Positioned(
            bottom: 25,
            child: Container(),
          )
        ],
      ),
    );
  }

  //Shimmer Notification
  Widget ShimmerNotif() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffF8FAFC)),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Date
                  Container(
                    width: 50,
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Container(
                        width: 35,
                        height: 9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffcecece),
                        ),
                      ),
                    ),
                  ),

                  //Information
                  Padding(
                    padding: const EdgeInsets.only(top: 19, bottom: 19),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 10,
                              width: 128,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffcecece),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
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
                        Container(width: 210),
                      ],
                    ),
                  ),

                  //Picture
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 5, right: 8),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: 55,
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffcecece),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
