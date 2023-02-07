import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';

class newTickets extends StatefulWidget {
  const newTickets({Key? key}) : super(key: key);

  @override
  State<newTickets> createState() => _newTicketsState();
}

class _newTicketsState extends State<newTickets> {
  //form controllers
  final formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _context = TextEditingController();


  // Initial Selected Value
  String? dropdownvalue;
  bool TitleError = false;
  bool TextError = false;
  bool _dropdown = false;


  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  //Add Button
  Widget Next(String par) => MaterialButton(
        color: On,
        minWidth: double.infinity,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Container(
            child: Row(
          children: [
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 4,
              child: Text(
                par,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container())
          ],
        )),
        onPressed: () {
          //Button destination
          // Navigator.push<void>( context,  MaterialPageRoute<void>( builder: (BuildContext context) => const s1() ));
          if(formKey.currentState!.validate())
            print('All good');
          else
            print('Something Wrong');
        },
      );

  void initState() {
    super.initState();

    //_setMarker(LatLng(32.294047, -6.709170));
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
          'الدعم الفني',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                //Add ticket button
                Positioned(
                    bottom: 0,
                    child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Next('إرسال'))),

                //Page Content
                Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Drop Down Menu
                        Container(
                          height: 71,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Color(0x1a000000)),
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF8F8F8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: DropdownButton(
                              isExpanded: true,

                              focusColor: Color(0xffF8F8F8),
                              autofocus: true,
                              itemHeight: 71,
                              // Initial Value
                              value: dropdownvalue,
                              underline: Container(),

                              borderRadius: BorderRadius.circular(8),

                              //Explanation
                              hint: Image.asset(
                                'assets/pics/DownArrow.png',
                                width: 24,
                              ),

                              // Down Arrow Icon
                              icon: dropdownvalue == null
                                  ? Text(
                                'نوع التدكرة',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Montserrat'),
                              )
                                  : Container(height: 0),

                              dropdownColor: Color(0xffF8F8F8),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  alignment: Alignment.centerRight,
                                  value: items,
                                  child: Text(items,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Montserrat')),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        //Title Input
                        Container(
                            height: 71,
                            decoration: BoxDecoration(
                              border: Border.all(width: TitleError ? 1.5 : 1, color: TitleError ? Colors.red :Color(0x1a000000)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF8F8F8),
                            ),
                            child: TextFormField(
                              controller: _title,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),

                                hintText: 'العنوان',
                                hintStyle: TextStyle(fontFamily: 'Montserrat',fontSize: 13,fontWeight: FontWeight.w200),
                                hintTextDirection: TextDirection.rtl,
                              ),
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,fontFamily: 'Montserrat'),

                              validator: (value){
                                if(value!.isEmpty || value == null){
                                  print('Title Error');

                                  setState(() {
                                    TitleError = true;
                                  });
                                  return'';
                                } else
                                  TitleError = false;

                              },

                            )
                        ),
                        SizedBox(height: 20),

                        //Context Input
                        Container(
                            height: 197,
                            decoration: BoxDecoration(
                              border: Border.all(width: TextError ? 1.5 : 1, color: TextError ? Colors.red :Color(0x1a000000)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF8F8F8),
                            ),
                            child: TextFormField(
                              controller: _context,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),

                                hintText: 'أكتب شيئا',
                                hintStyle: TextStyle(fontFamily: 'Montserrat',fontSize: 13,fontWeight: FontWeight.w200),
                                hintTextDirection: TextDirection.rtl,
                              ),
                              maxLines: 11,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,fontFamily: 'Montserrat'),

                              validator: (value){
                                if(value!.isEmpty || value == null){
                                  print('Text Error');

                                  setState(() {
                                    TextError = true;
                                  });
                                  return'';
                                } else
                                  setState(() {
                                    TextError = false;
                                  });

                              },

                            )
                        )
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
