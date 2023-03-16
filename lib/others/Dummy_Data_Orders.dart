//Orders Data
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logist/Classes/Order_Class.dart';

// List<Order> Orders = [
//
//   Order('1', 25, '2812','Sidi moumen Casablanca','Casablanca Morocco', 'Casablanca Tit Mellil Airport','Casablanca Morocco', Ordertruck(1, 'شاحنة ALX', 'شاحنه مغلقة', 'شاحنه مبردة', 'حولة أدوية'), 250, driver,driverRating,  1664982178917, const LatLng(33.5812314,-7.4921715), const LatLng(33.5867002,-7.5444425), 'Single', 'Delivered'),
//
//   Order('2', 12.4, '2812', 'Sidi moumen Casablanca','Casablanca Morocco', 'Casablanca Tit Mellil Airport','Casablanca Morocco', Ordertruck(1, 'شاحنة HALA AA19', 'شاحنه مغلقة', 'حمولة بضائع', 'حولة أدوية'), 250, driver,driverRating, 1664982178917,  const LatLng(33.5812314,-7.4921715), const LatLng(33.5867002,-7.5444425), 'Single', 'Accepted'),
//
//   Order('3', 12.4, '2812','Sidi moumen Casablanca','Casablanca Morocco', 'Casablanca Tit Mellil Airport','Casablanca Morocco', Ordertruck(1, 'شاحنة BIG MONSTER', 'شاحنه مغلقة', 'حمولة اطعمة', 'حمولة حديد'), 250, driver,driverRating,  1664982178917,  const LatLng(33.5812314,-7.4921715), const LatLng(33.5867002,-7.5444425), 'Single', 'Canceled'),
//
//   Order('4', 12.4, '2812','Sidi moumen Casablanca','Casablanca Morocco', 'Casablanca Tit Mellil Airport','Casablanca Morocco', Ordertruck(1, 'شاحنة BIG MONSTER', 'شاحنه مغلقة', 'حمولة حديد', 'حولة أدوية'), 250, driver,driverRating, 1664982178917,  const LatLng(33.5812314,-7.4921715), const LatLng(33.5867002,-7.5444425), 'Single', 'Pending'),
//
//   Order('5', 12.4, '2812','Sidi moumen Casablanca','Casablanca Morocco', 'Casablanca Tit Mellil Airport','Casablanca Morocco', Ordertruck(1, 'شاحنة BIG MONSTER', 'شاحنه مغلقة', 'حمولة حديد', 'حولة أدوية'), 250, driver,driverRating, 1664982178917,  const LatLng(24.7474501,46.7274109), const LatLng(24.7718399,46.7874393), 'Single', 'Delivered'),
//   Order('5', 12.4, '2812','Sidi moumen Casablanca','Casablanca Morocco', 'Casablanca Tit Mellil Airport','Casablanca Morocco', Ordertruck(1, 'شاحنة BIG MONSTER', 'شاحنه مغلقة', 'حمولة حديد', 'حولة أدوية'), 250, driver,driverRating, 1664982178917,  const LatLng(24.7474501,46.7274109), const LatLng(24.7718399,46.7874393), 'Single', 'Waiting'),
//
// ];

  truck DriverTruck = truck(
      'USER1',
      'شاحنة TRILLA',
      'SAS / 816',
      '71007120'
  );

  // Driver driver= Driver(
  //     '1',
  //     'محمد علي كلاي',
  //     'سائق شاحنة كبيرة الحجم',
  //     'https://i.imgur.com/74sByqd.jpg',
  //     DriverTruck
  // );
  //
  // DriverRating driverRating = DriverRating('120', '3.3', 90, 5, 5, 0, 0);