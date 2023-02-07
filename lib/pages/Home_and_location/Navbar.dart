import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  final int _currentindex = 0;
  List <Widget> pages = const [
    Text('eco'),
    Text('Home'),
    Text('person'),
    Text('video'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_currentindex],
      ),

    );
  }
}
