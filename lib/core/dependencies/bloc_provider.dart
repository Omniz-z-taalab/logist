import 'package:flutter/material.dart';
import 'package:logist/core/logic/price_payment/price_payment.dart';
import 'package:provider/provider.dart';

import '../logic/auth/auth_provider.dart';
import '../logic/config_location/location_provider.dart';
import '../logic/drivers/driver_provider.dart';
import '../logic/layout/home/home_provider.dart';
import '../logic/layout/layout_provider.dart';
import '../logic/layout/order/order_provider.dart';
import '../logic/layout/profile/profile_provider.dart';
import '../logic/messages/chat_provider.dart';
import '../logic/review/review_provider.dart';
import '../logic/viecles/viecles_provider.dart';

class AppMainProvider extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AppMainProvider({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LayoutProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => ReviewProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(
            create: (context) => VieclesProvider()
              ..getTrailersTypes()
              ..getTrailers()
              ..getViecle()
              ..getVieclesTypes(),
            lazy: false),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => DriversProvider()),
        ChangeNotifierProvider(create: (context) => PriceProvider()),
      ],
      child: child!,
    );
  }
}
