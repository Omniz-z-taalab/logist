// import 'dart:async';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'index.dart';
//
// import '../local/cache_helper.dart';
// import 'intersiptor_log.dart';
//
// const _defaultConnectTimeout = Duration.millisecondsPerMinute;
// const _defaultReceiveTimeout = Duration.millisecondsPerMinute;
// class DioManager {
//   Dio? _dio = Dio();
//
//   List<Interceptor>? interceptors;
//
//   DioManager({this.interceptors,}) {
//     _dio!
//       ..options.baseUrl = AppApiPaths.base
//       ..httpClientAdapter
//       ..options.headers = {
//         'Content-Type': 'application/json',
//         "Accept": "application/json",
//          'Authorization': "Bearer ${CacheHelper.getData(key:'accessToken')??''}"
//       };
//     final options = CacheOptions(
//       // A default store is required for interceptor.
//       store: MemCacheStore(),
//       // Default.
//       policy: CachePolicy.request,
//       // Optional. Returns a cached response on error but for statuses 401 & 403.
//       hitCacheOnErrorExcept: [401, 403],
//       // Optional. Overrides any HTTP directive to delete entry past this duration.
//       // maxStale: const Duration(days: 7),
//       // Default. Allows 3 cache sets and ease cleanup.
//       priority: CachePriority.normal,
//       // Default. Body and headers encryption with your own algorithm.
//       cipher: null,
//       // Default. Key builder to retrieve requests.
//       keyBuilder: CacheOptions.defaultCacheKeyBuilder,
//       // Default. Allows to cache POST requests.
//       // Overriding [keyBuilder] is strongly recommended.
//       allowPostMethod: false,
//
//     );
//
//     if (interceptors?.isNotEmpty ?? false) {
//       _dio?.interceptors.addAll(interceptors!);
//       _dio?.interceptors.add(DioCacheInterceptor(options: options));
//     }
//
//     _dio?.interceptors.add(InterceptorLogs());
//     _dio?.interceptors.add(DioCacheInterceptor(options: options));
//   }
//
//   Future<dynamic> get(String uri,
//       {data,
//       Map<String, dynamic>? queryParameters,
//       Options? options,
//       // CancelToken? cancelToken,
//       ProgressCallback? onReceiveProgress,
//
//       bool isAuth = true}) async {
//     if (isAuth) {
//       await authorize();
//     }
//     try {
//       var response = await _dio?.request(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: Options(headers: _dio!.options.headers),
//         // cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       print(_dio!.options.headers);
//       return  response?.data;
//     } on SocketException catch (e) {
//       throw SocketException(e.toString());
//     } on FormatException catch (_) {
//       throw FormatException("Unable to process the data");
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<dynamic> post(String uri,
//       {data,
//       Map<String, dynamic>? queryParameters,
//       Options? options,
//       CancelToken? cancelToken,
//       ProgressCallback? onSendProgress,
//       ProgressCallback? onReceiveProgress,
//       bool isAuth = true}) async {
//     if (isAuth) {
//       await authorize();
//     }
//     try {
//       var response = await _dio!.post(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//
//       return response.data;
//     } on SocketException catch (error) {
//       if (error.toString() != "") {
//         showToast(error.toString(), true, false);
//       }
//       throw SocketException(error.toString());
//     } on FormatException catch (_) {
//       throw FormatException("Unable to process the data");
//     } on DioError catch (error) {
//       if (error.type == DioErrorType.response) {
//         // //  showToast(error.toString(), true);
//         throw (error.response!.data);
//       }
//       if (error.type == DioErrorType.connectTimeout) {
//         logger.d('Server is not reachable');
//         showToast("Server is not reachable", false, false);
//         throw TimeoutException(
//             "Server is not reachable. Please verify your internet connection and try again");
//       }
//
//       if (error.type == DioErrorType.receiveTimeout) {
//         logger.d('unable to connect to the server');
//         showToast("unable to connect to the server", false, false);
//         throw TimeoutException("unable to connect to the server");
//       }
//
//       if (error.type == DioErrorType.other) {
//         if (error.message.contains('SocketException')) {
//           showToast("connection lost", false, false);
//           throw TimeoutException('connection lost');
//         }
//       }
//       logger.d(error);
//     } catch (error) {
//       logger.d(error);
//     }
//   }
//
//   Future<dynamic> delete(String url,
//       {data,
//       Map<String, dynamic>? queryParameters,
//       Options? options,
//       CancelToken? cancelToken,
//       ProgressCallback? onSendProgress,
//       ProgressCallback? onReceiveProgress,
//       bool isAuth = true}) async {
//     if (isAuth) {
//       await authorize();
//     }
//     try {
//       final Response response = await _dio!.delete(
//         url,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       return response.data;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<dynamic> put(String url,
//       {data,
//       Map<String, dynamic>? queryParameters,
//       Options? options,
//       CancelToken? cancelToken,
//       ProgressCallback? onSendProgress,
//       ProgressCallback? onReceiveProgress,
//       bool isAuth = true}) async {
//     if (isAuth) {
//       await authorize();
//     }
//     try {
//       final Response response = await _dio!.put(
//         url,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       return response.data;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<dynamic> uploadFiles(String url,
//       {required File file, bool isAuth = true}) async {
//     if (isAuth) {
//       await authorize();
//     }
//     String fileName = file.path.split('/').last;
//     FormData formData = FormData.fromMap({
//       "file": await MultipartFile.fromFile(file.path, filename: fileName),
//     });
//     try {
//       final Response response = await _dio!.post(url,
//           data: formData,
//           options: Options(
//               validateStatus: (int? status) {
//                 return true;
//               },
//               contentType: "multipart/form-data"));
//       return response.data;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   // ${CacheHelper.getData(key: 'accessToken') ?? ''}
//   Future<void> authorize() async {
//     print(CacheHelper.getData(key: 'accessToken'));
//     final String? token = _dio!.options.headers['Authorization'] =
//         "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiYXZhdGFyIjoiaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3N0b3JhZ2VfYnVrZXRfMS9tYWxlLXByb2ZpbGUtaW1hZ2UtcGxhY2Vob2xkZXIucG5nIiwiZnVsbF9uYW1lIjoiSHVzc2VpbiBSZWRhIiwicGhvbmVfbnVtYmVyIjoiKzIwMTI4NjEwMDA4OCIsImdlbmRlciI6Ik4vQSIsImJpcnRoX2RhdGUiOiIyMDIzLTAxLTEzVDIyOjAwOjAwLjAwMFoiLCJhZHJyZXNzIjoiMjZzdCBlbC1tb3N0c2hmYSBzaHVicmEiLCJlbWFpbCI6InRlc3QyQHRlc3QuY29tIiwidXNlcl9sb2NhdGlvbiI6MSwiY3JlYXRlZF9kYXRlIjoiMjAyMy0wMS0xM1QyMjowMDowMC4wMDBaIiwiaWF0IjoxNjczNzM5OTY1fQ.g6ZXqouV_xHtgSsYBQBQrMC5LxySRJxnOyS3GaB9UN4";
//   }
// }
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// import 'api_path.dart';
//
// abstract class DioHelper {
//   Future<dynamic> post({
//     String? base,
//     required String endPoint,
//     dynamic data,
//     dynamic query,
//     String? token,
//     ProgressCallback? progressCallback,
//     CancelToken? cancelToken,
//     int? timeOut,
//     bool isMultipart = false,
//   });
//
//   Future<dynamic> get({
//     String? base,
//     required String endPoint,
//     dynamic data,
//     dynamic query,
//     String? token,
//     CancelToken? cancelToken,
//     int? timeOut,
//     bool isMultipart = false,
//   });
// }
//
// class DioImpl extends DioHelper {
//   final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: '${AppApiPaths.base}',
//       receiveDataWhenStatusError: true,
//       connectTimeout: 5000,
//     ),
//   );
//
//   @override
//   Future<dynamic> get({
//     String? base,
//     required String endPoint,
//     dynamic data,
//     dynamic query,
//     String? token,
//     CancelToken? cancelToken,
//     int? timeOut,
//     bool isMultipart = false,
//   }) async {
//     if (timeOut != null) {
//       dio.options.connectTimeout = timeOut;
//     }
//
//     dio.options.headers = {
//       if (isMultipart) 'Content-Type': 'multipart/form-data',
//       if (!isMultipart) 'Content-Type': 'application/json',
//       if (!isMultipart) 'Accept': 'application/json',
//       if (token != null) 'token': token,
//     };
//
//     debugPrint('URL => ${dio.options.baseUrl + endPoint}');
//     debugPrint('Header => ${dio.options.headers.toString()}');
//     debugPrint('Body => $data');
//     debugPrint('Query => $query');
//     debugPrint('accessToken => $token');
//
//     return await request(
//       call: () async => await dio.get(
//         endPoint,
//         queryParameters: query,
//         cancelToken: cancelToken,
//       ),
//     );
//   }
//
//   @override
//   Future<dynamic> post({
//     String? base,
//     required String endPoint,
//     dynamic data,
//     dynamic query,
//     String? token,
//     ProgressCallback? progressCallback,
//     CancelToken? cancelToken,
//     int? timeOut,
//     bool isMultipart = false,
//   }) async {
//     if (timeOut != null) {
//       dio.options.connectTimeout = timeOut;
//     }
//
//     dio.options.headers = {
//       if (isMultipart) 'Content-Type': 'multipart/form-data',
//       if (!isMultipart) 'Content-Type': 'application/json',
//       if (!isMultipart) 'Accept': 'application/json',
//       if (token != null) 'token': token,
//     };
//
//     debugPrint('URL => ${dio.options.baseUrl + endPoint}');
//     debugPrint('Header => ${dio.options.headers.toString()}');
//     debugPrint('Body => $data');
//     debugPrint('Query => $query');
//
//     return await request(
//       call: () async => await dio.post(
//         endPoint,
//         data: data,
//         queryParameters: query,
//         onSendProgress: progressCallback,
//         cancelToken: cancelToken,
//       ),
//     );
//   }
// }
//
// extension on DioHelper {
//   Future request({
//     required Future<Response> Function() call,
//   }) async {
//     try {
//       final r = await call.call();
//       debugPrint("Response_Data => ${r.data}");
//       debugPrint("Response_Code => ${r.statusCode}");
//       if (r.data['status']['type'] == '0' &&
//           r.data['data']['data'] != null &&
//           r.data['data']['data'].isEmpty) {
//         return r.data;
//       }
//       if (r.data['status']['type'] == '0') {
//         dynamic title = r.data['status']['title'];
//         print(title);
//         throw PrimaryServerException(
//           message: title == null
//               ? ''
//               : title is String
//               ? title
//               : r.data['status']['title']['ar'],
//           code: r.statusCode ?? 500,
//           error: title == null
//               ? ''
//               : title is String
//               ? title
//               : r.data['status']['title']['en'],
//         );
//       } else {
//         return r.data;
//       }
//     } on DioError catch (e) {
//       debugPrint("Error_Message => ${e.message}");
//       debugPrint("Error_Error => ${e.error.toString()}");
//       debugPrint("Error_Type => ${e.type.toString()}");
//
//       throw PrimaryServerException(
//         code: 100,
//         error: e.error.toString(),
//         message: e.message,
//       );
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:dio/dio.dart';


import '../local/cache_helper.dart';
import 'api_path.dart';

// Dio dio() {
//   String accessToken = CacheHelper.getData(key: 'token');
//   var headers = {
//     'accept': "application/json",
//     'content-type': "application/json",
//     'Accept-Language' : 'en',
//   };
//   if (accessToken != null) {
//     headers['Authorization'] = "Bearer $accessToken";
//   }
//
//   var dio = new Dio(
//     BaseOptions(
//       baseUrl: 'http://3.126.221.243:8080/api',
//       headers: headers,
//
//     ),
//   );
//   print(headers.toString());
//   print('ddddddddddddddd');
//   print(accessToken.toString());
//   return dio;
// }

class DioHelper{
  static  Dio? dio;
  static init(){
    String? token = CacheHelper.getData(key: 'token');


    BaseOptions options = BaseOptions(
     baseUrl: AppApiPaths.base,
    connectTimeout: 20 * 1000,
    receiveTimeout: 20 * 1000,
    receiveDataWhenStatusError: true,
  );
    dio = Dio(options);

  }
  static Future<Response> getData({
    required String url,
     Map<String, dynamic>? query,
    data,

  }) async{
    String? token = CacheHelper.getData(key: 'accessToken');
    return await dio!.get(url,queryParameters: query,options: Options(headers:{"Authorization":"Bearer $token"},));

  }
  static Future<Response> postData({
    required String url,
   data,
    // String? token,

  }) async{
    print('ee4444');
    String? token = CacheHelper.getData(key: 'accessToken');
    return await dio!.post(url, data:data,options:  Options(headers:{"Authorization":"Bearer $token"},)
    );

  }
}
void showToast(String text, bool webShowClose, bool success) {
  Fluttertoast.showToast(
      webShowClose: webShowClose,
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: success ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

