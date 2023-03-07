import 'package:flutter/material.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../others/variables.dart';
import '../My_orders/payloading.dart';
import 'PaymentSucess.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({Key? key}) : super(key: key);

  @override
  _paymentPageState createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _cardform = GlobalKey<FormState>();

  final months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  final years = [22, 23, 24, 25, 26, 27, 28, 29, 30, 31];

  final TextEditingController _num = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  final TextEditingController _MM = TextEditingController();
  TextEditingController _YY = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _controllerFirstName = TextEditingController();

    // String card_type = "6288";
    // var type = detectCCType(card_type);
    // String strNew = type.toString().replaceAll("CreditCardType.", "");
    // print(strNew);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Obackground,
      appBar: AppBar(
        backgroundColor: Obackground,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "عملية الدفع",
          style: TextStyle(
            color: const Color(
              0xff191F28,
            ),
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: "Montserrat",
            letterSpacing: 0,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.navigate_next,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Container(
            child: Stack(
              children: [
                //Credit Card Form
                Container(
                  width: 335,
                  child: Form(
                    key: _cardform,
                    child: Column(
                      children: [
                        //Credit card title
                        Container(
                          width: double.infinity,
                          child: Text(
                            "رقم البطاقة",
                            style: TextStyle(
                              color: Color(
                                0xff3a3c3f,
                              ),
                              fontSize: 11,
                              fontFamily: "ArabotoMedium",
                              letterSpacing: 0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),

                        //to add space
                        SizedBox(height: 8),

                        //Credit card input
                        Container(
                          height: 55,
                          margin: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Color(0x60eaecee),
                          ),
                          width: double.infinity,
                          child: TextFormField(
                            controller: _num,
                            keyboardType: TextInputType.number,
                            maxLength: 19,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CardNumberFormatter(),
                            ],
                            onChanged: (String) {
                              var type = detectCCType(String);
                              var strNeww = type
                                  .toString()
                                  .replaceAll("CreditCardType.", "");
                              var strNew =
                                  strNeww.toString().replaceAll("unknown", "");
                              strNeww = strNeww.trim();
                              print(String.length);
                            },
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 10),
                              errorStyle: TextStyle(height: 0),
                              counterText: "",
                              errorText: null,
                              suffix: Icon(
                                Icons.credit_card,
                                size: 23,
                                color: Colors.black,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xff424D59),
                                fontFamily: 'circular std',
                                fontWeight: FontWeight.w600),
                            validator: (value) {
                              if (value!.isEmpty && value.length != 16) {
                                return '';
                              }
                            },
                          ),
                        ),

                        //to add space
                        const SizedBox(height: 20),

                        //Credit card owner
                        Container(
                          width: double.infinity,
                          child: const Text(
                            "اسم حامل البطاقة",
                            style: TextStyle(
                              color: Color(
                                0xff3a3c3f,
                              ),
                              fontSize: 11,
                              fontFamily: "ArabotoMedium",
                              letterSpacing: 0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),

                        //to add space
                        SizedBox(height: 8),

                        //Credit card input
                        Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Color(
                              0x60eaecee,
                            ),
                          ),
                          child: TextFormField(
                            controller: _name,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 20),
                              errorStyle: TextStyle(height: 0),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xff424D59),
                                fontFamily: 'circular std',
                                fontWeight: FontWeight.w600),
                            textDirection: TextDirection.rtl,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value) ||
                                  value.length < 3) {
                                return '';
                              }
                            },
                          ),
                        ),

                        //to add space
                        const SizedBox(height: 20),

                        //CCV + Expire date
                        SizedBox(
                          height: 140,
                          width: 335,
                          child: Stack(
                            children: [
                              //CVV/CVC
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  //Text
                                  const Text(
                                    "CVV / CVC",
                                    style: TextStyle(
                                      color: Color(
                                        0xff3a3c3f,
                                      ),
                                      fontSize: 11.52,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Montserrat",
                                      letterSpacing: 0,
                                    ),
                                  ),

                                  //to add space
                                  const SizedBox(height: 8),

                                  //input
                                  Container(
                                      width: 146,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: const Color(
                                          0x60eaecee,
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: _cvv,
                                        maxLength: 3,
                                        textAlign: TextAlign.center,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        // keyboardType: TextInputType.numberWithOptions(signed: true),
                                        keyboardType: const TextInputType
                                            .numberWithOptions(signed: true),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff424D59),
                                            fontFamily: 'circular std',
                                            fontWeight: FontWeight.w600),
                                        decoration: const InputDecoration(
                                          errorStyle: TextStyle(height: 0),
                                          counterText: "",
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.red),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 3) {
                                            return '';
                                          }
                                        },
                                      )),
                                ],
                              ),

                              //Expire Date
                              Positioned(
                                right: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //Text
                                    const Text(
                                      "تاريخ الإنتهاء",
                                      style: TextStyle(
                                        color: Color(
                                          0xff3a3c3f,
                                        ),
                                        fontSize: 11,
                                        fontFamily: "ArabotoMedium",
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),

                                    //to add space
                                    const SizedBox(
                                      height: 8,
                                    ),

                                    //Input
                                    SizedBox(
                                      width: 140,
                                      height: 54,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: const Color(
                                                    0x60eaecee,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: _MM,
                                                  maxLength: 2,
                                                  keyboardType:
                                                      const TextInputType
                                                              .numberWithOptions(
                                                          signed: true),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff424D59),
                                                      fontFamily:
                                                          'circular std',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  decoration:
                                                      const InputDecoration(
                                                    counterText: "",
                                                    hintText: "MM",
                                                    errorStyle:
                                                        TextStyle(height: 0),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty ||
                                                        (int.parse(value) >
                                                            12) ||
                                                        int.parse(value) == 0) {
                                                      return '';
                                                    }
                                                  },
                                                )),
                                          ),
                                          Expanded(
                                              child: Container(
                                            height: double.infinity,
                                            alignment: Alignment.center,
                                            child: const Text(''),
                                          )),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: const Color(
                                                    0x60eaecee,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: _YY,
                                                  maxLength: 2,
                                                  textAlign: TextAlign.center,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  keyboardType:
                                                      const TextInputType
                                                              .numberWithOptions(
                                                          signed: true),
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff424D59),
                                                      fontFamily:
                                                          'circular std',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  decoration:
                                                      const InputDecoration(
                                                    counterText: "",
                                                    hintText: "YY",
                                                    errorStyle:
                                                        TextStyle(height: 0),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty ||
                                                        value.length < 2 ||
                                                        (int.parse(value) <
                                                            21)) {
                                                      return '';
                                                    }
                                                  },
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 35 * 2,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(37.5),
                          color: const Color(
                            0xff191F28,
                          ),
                        ),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          width: double.infinity,
                          height: 66,
                          child: const Text(
                            "إضافة بطاقة",
                            style: TextStyle(
                              color: Color(
                                0xffffffff,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat",
                              letterSpacing: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        height: 58.58,
                      ),
                      onPressed: () {
                        // print('pressed going to payment');
                        if (_cardform.currentState!.validate()) {
                          Get.to(
                            () => const payloading(),
                            transition: Transition.rightToLeft,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
