import 'package:flutter/material.dart';

class AppMessage extends StatelessWidget {
  const AppMessage({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // constraints: const BoxConstraints(minWidth: 205, maxWidth: 250),
            decoration: BoxDecoration(
                color: const Color(0xffF3F7FA),
                borderRadius: BorderRadius.circular(19)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 26, right: 27),
              child: Text(
                message,
                // textDirection: TextDirection.rtl,
                style: const TextStyle(
                    fontSize: 11,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }
}
