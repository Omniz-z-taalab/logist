// import 'package:flutter/material.dart';
// import '../others/variables.dart';
//
// class testpage extends StatefulWidget {
//   const testpage({Key? key}) : super(key: key);
//
//   @override
//   _testpageState createState() => _testpageState();
// }
//
// class _testpageState extends State<testpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: background,
//       body: Center(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20,right: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(),
//                 Container(
//                   width: 314.0,
//                   height: 314.0,
//                   decoration: const BoxDecoration(
//                     color: Color(0xffF0F0F0),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 Column(
//                   children: const [
//                     Text(' ﻭﺻﻞ ﺑﻀﺎﺋﻌﻚ ﺑﺄﻣﺎﻥ ﻣﻊ ﻟﻮﺟﻴﺴﺖ'),
//                     Text('ﺃﻓﻀﻞ ﻣﻨﺼﺔ ﻟﻮﺟﻴﺴﺘﻴﺔ ﻟﻨﻘﻞ ﺍﻟﺒﻀﺎﺋﻊ')
//
//                   ],
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Random line later'),
//                       Container(
//                         width: 66,
//                         height: 66,
//                         decoration: const BoxDecoration(
//                           color: Color(0xffFAFAFA),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.navigate_next,
//                           size: 30,
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../core/logic/drivers/driver_provider.dart';
import '../models/driver_model.dart';

class panelScreen extends StatefulWidget {
  int i;
   panelScreen(this.i) ;

  @override
  State<panelScreen> createState() => _panelScreenState();
}

class _panelScreenState extends State<panelScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DriversProvider>(context,listen: false).getDetailsDriver(id:widget.i);

  }
  @override
  Widget build(BuildContext context) {
    DriverModel?  driver =  context.watch<DriversProvider>().driverModel;

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
        // CircleAvatar(
        //   backgroundImage: NetworkImage(drivers![0].lecensePhoto!),
        // ),

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
          'drivers![0].status!',
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
                child: Text('أختر السائق')),
          ),
        )
      ],
    );
  }
}
