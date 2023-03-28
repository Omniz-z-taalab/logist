import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logist/core/utilities/dio_helper.dart';
import 'package:overlay_support/overlay_support.dart';

import 'components/data_connection_checker.dart';
import 'components/data_connectivity_service.dart';
import 'components/network_error_indicator.dart';
import 'core/dependencies/bloc_provider.dart';
import 'core/local/cache_helper.dart';
import 'others/Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await CacheHelper.init();
  DioHelper.init();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    OverlaySupportEntry? entry;
    DataConnectivityService()
        .connectivityStreamController
        .stream
        .listen((event) {
      if (event == DataConnectionStatus.disconnected) {
        entry = showOverlayNotification((context) {
          return NetworkErrorAnimation();
        }, duration: Duration(hours: 1));
      } else {
        if (entry != null) {
          entry?.dismiss();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppMainProvider(
      child: GetMaterialApp(
        title: 'Logist',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: const splash(),
        //  home:  logout(),
      ),
    );
  }
}
