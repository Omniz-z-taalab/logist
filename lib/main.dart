import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logist/pages/MainHomePage.dart';
import 'package:logist/pages/Order_Setup/ChooseExtentions.dart';
import 'others/Splash.dart';
import 'core/dependencies/bloc_provider.dart';
import 'core/local/cache_helper.dart';

void main() async {
  await GetStorage.init();
  CacheHelper.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainProvider(
      child: GetMaterialApp(
        title: 'Logist',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: const chooseExtentions(),
        //  home:  logout(),
      ),
    );
  }
}
