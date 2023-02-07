import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import 'Resume.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class truckdrivers extends StatefulWidget {
  const truckdrivers({Key? key}) : super(key: key);

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

  var Names = [
    'محمد أشرف',
    'خالد نوري',
    'محمد رمضان',
    'فيصل علي',
    'صالح يوسف',
    'سيف الدين مفتاح',
    'محمد احمد',
    'محمد رمضان',
    'فهد عبدالرحمن',
    'مصطفى نجيب',
    'حسني ديستان',
    'هيثم  بن الحسين',
    'محمد راشد',
    'عبد المجيد سعيد',
    'محمد صباح',
    'أي إسم ينفع',
    'فيصل علي',
    'محمد راشد',
  ];

  var Pics = [
    'assets/pics/user1.png',
    'assets/pics/user2.png',
    'assets/pics/user3.png',
    'assets/pics/user5.png',
    'assets/pics/user4.png',
    'assets/pics/user6.png',
    'assets/pics/user7.png',
    'assets/pics/user8.png',
    'assets/pics/user3.png',
    'assets/pics/user5.png',
    'assets/pics/user4.png',
    'assets/pics/user6.png',
    'assets/pics/user1.png',
    'assets/pics/user2.png',
    'assets/pics/user3.png',
    'assets/pics/user8.png',
    'assets/pics/user4.png',
    'assets/pics/user6.png',
  ];

  var trName = [
    'Honda Ridgeline',
    'Toyota Tundra',
    'Nissan Titan',
    'Chevrolet Colorado',
    'GMC Canyon',
    'Toyota Tacoma',
    'Ford F-Series Super Duty',
    'Honda Ridgeline',
    'Chevrolet Silverado',
    'Chevrolet Silverado 1500',
    'Toyota Tacoma',
    'Ford Ranger',
    'Ram 1500',
    'Ford F-150',
    'Nissan Titan XD',
    'Ford F-150 Raptor',
    'Ford Super Duty',
    'Ram 2500 / 3500'
  ];

  var Rating = [
    '4.6',
    '2.0',
    '3.5',
    '4.5',
    '4.0',
    '3.1',
    '1.0',
    '4.8',
    '4.8',
    '4.3',
    '5.0',
    '4.0',
    '4.5',
    '4.5',
    '4.6',
    '4.8',
    '4.3',
    '5.0',
    '4.0',
    '4.5',
  ];
  var Review = [
    '23',
    '98',
    '200',
    '192',
    '81',
    '127',
    '71',
    '391',
    '72',
    '192',
    '241',
    '310',
    '38',
    '61',
    '150',
    '281',
    '23'
  ];
  //Open Sliding bar
  void Open() {
    ApanelController.isPanelClosed ? ApanelController.open() : null;
  }

  @override
  Widget build(BuildContext context) {
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
      body: SlidingUpPanel(
        controller: ApanelController,
        maxHeight: 600,
        minHeight: 0,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 300,
                      child: _buildListView(),
                    )),
              ],
            ),
          ),
        ),
        panel: Container(
          height: 600,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 25),

                  Container(
                    width: 58,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  SizedBox(height: 56),

                  //Driver Picture
                  Profile_pic(),

                  //Driver Name
                  Text(
                    Name,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 10),

                  //Truck name
                  Text(
                    Truck,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: Color(0xff909090)),
                  ),

                  //Approvement('تم قبول الطلب','الحالة سليمة تمت الموافقة على طلبك من طرف السائق'),

                  SizedBox(height: 10),

                  rating(),

                  //Truck Info
                  truck('شاحنة TRILLA', ' 71007120', ' S A S / 816',
                      'assets/pics/trALX.png'),
                ],
              ),
              Positioned(
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Next('أختر السائق')),
                ),
              )
            ],
          ),
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
          driverData = [Name, Truck, Pic, ratings, Reviews];
          print(driverData);

          //Button destination
          Get.to(() => resume(), transition: Transition.rightToLeft);
        },
      );

  ListView _buildListView() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: Names.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SizedBox(
            width: 108,
            child: Column(
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: Rating[index],
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  const TextSpan(
                      text: '/5',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC2C2C2)))
                ])),
                Row(
                  children: [
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: double.parse(Rating[index]),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      glowColor: const Color(0xffF3B304),
                      unratedColor: const Color(0xffF2F2F2),
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const Text(
                      ' (20)',
                      style: TextStyle(fontSize: 10, color: Color(0xffC4C4C4)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          title: Text(
            Names[index],
            style: const TextStyle(fontSize: 14, fontFamily: 'ArabotoFat'),
            textDirection: TextDirection.rtl,
          ),
          subtitle: const Text(
            'سائق شاحنة كبيرة الحجم',
            style: TextStyle(
                fontSize: 10, fontFamily: 'Araboto', color: Color(0xff909090)),
            textDirection: TextDirection.rtl,
          ),
          trailing: CircleAvatar(
            backgroundImage: AssetImage(Pics[index]),
          ),
          onTap: () {
            print(index);
            Open();

            setState(() {
              setDriverData(index);
            });

            //ApanelController.isPanelOpen ? ApanelController.close() : ApanelController.open();
          },
        );
      },
    );
  }

  Future<void> setDriverData(int choice) async {
    Name = Names[choice];
    Truck = trName[choice];
    Pic = Pics[choice];
    ratings = Rating[choice];
    Reviews = Review[choice];
  }
}
