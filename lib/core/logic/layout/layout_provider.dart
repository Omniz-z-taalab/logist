import 'package:flutter/material.dart';
import '../../utilities/api_path.dart';
import '../../utilities/api_service.dart';

class LayoutProvider extends ChangeNotifier {
  // List<Widget> screens = [
  //   HomeScreen(),
  //   OrderScreen(),
  //   RestaurantsScreen(),
  //   ProfileScreen(),
  // ];
  int screenIndex = 0;

  void changeScreen(int index) {
    screenIndex = index;
    notifyListeners();
  }

}
