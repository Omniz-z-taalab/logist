import 'package:flutter/material.dart';

class FullPhotoScreen extends StatelessWidget {
  const FullPhotoScreen({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        imageUrl,
        fit: BoxFit.scaleDown,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
