import 'package:flutter/material.dart';
import '../others/variables.dart';

class testpage extends StatefulWidget {
  const testpage({Key? key}) : super(key: key);

  @override
  _testpageState createState() => _testpageState();
}

class _testpageState extends State<testpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(),
                Container(
                  width: 314.0,
                  height: 314.0,
                  decoration: const BoxDecoration(
                    color: Color(0xffF0F0F0),
                    shape: BoxShape.circle,
                  ),
                ),
                Column(
                  children: const [
                    Text(' ﻭﺻﻞ ﺑﻀﺎﺋﻌﻚ ﺑﺄﻣﺎﻥ ﻣﻊ ﻟﻮﺟﻴﺴﺖ'),
                    Text('ﺃﻓﻀﻞ ﻣﻨﺼﺔ ﻟﻮﺟﻴﺴﺘﻴﺔ ﻟﻨﻘﻞ ﺍﻟﺒﻀﺎﺋﻊ')

                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Random line later'),
                      Container(
                        width: 66,
                        height: 66,
                        decoration: const BoxDecoration(
                          color: Color(0xffFAFAFA),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.navigate_next,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
