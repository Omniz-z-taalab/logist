// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// import '../bloc/index.dart';
// import '../models/base/index.dart';
// import '../models/user.dart';
// import '../repository/index.dart';
// import 'index.dart';

// @Injectable()
// class TokenInterceptor {
//   TokenInterceptor(this._authRepository, @Named('Dio') this._dio, @Named('Interceptor') this._refreshTokenDio, this._authenticationBloc, this.appLogger) {
//     _listenOnRequests();
//   }
//   final AuthRepository _authRepository;
//   final Dio _dio;
//   final AppLogger appLogger;
//   final Dio _refreshTokenDio;
//   final AuthenticationBloc _authenticationBloc;

//   void _listenOnRequests() {
//     _dio.interceptors.add(
//       InterceptorsWrapper(onError: (DioError error, ErrorInterceptorHandler handler) async {
//         // handle unauthorized case
//         if (error.response != null && error.response!.statusCode == HttpStatus.unauthorized) {
//           // lock the default Dio instance
//           _dio.lock();
//           _dio.interceptors.requestLock.lock();
//           _dio.interceptors.responseLock.lock();

//           try {
//             //call refresh token to get new token
//             AppResponseSingleResult<User> response = await _authRepository.refreshTheToken(_refreshTokenDio);
//             if (response.isSuccess) {
//               // save the new tokens
//               // await _authRepository.setToken(response.result!.accessToken!, response.result!.refreshToken!);

//               // unlock the apis
//               _dio.unlock();
//               _dio.interceptors.requestLock.unlock();
//               _dio.interceptors.responseLock.unlock();
//               // re send the faild request with the new token
//               final Map<String, String> headers = <String, String>{
//                 'Content-type': 'application/json',
//                 'Authorization': "Bearer ${response.result!.accessToken}",
//                 'Accept-Language': 'en',
//               };
//               final Response<dynamic> res = await _dio.request(error.requestOptions.path,
//                   data: error.requestOptions.data,
//                   options: Options(
//                     headers: headers,
//                     method: error.requestOptions.method,
//                   ));
//               error.response!.data = res.data;
//               error.response!.statusCode = res.statusCode;
//               return handler.resolve(error.response!);
//             } else {
//               // unlock the apis
//               _dio.unlock();
//               _dio.interceptors.requestLock.unlock();
//               _dio.interceptors.responseLock.unlock();
//               // if refresh fail log out the user
//               _authenticationBloc.add(AuthenticationEventLoggedOut());

//               return handler.reject(error);
//             }
//           } catch (e) {
//             // unlock the apis
//             _dio.unlock();
//             _dio.interceptors.requestLock.unlock();
//             _dio.interceptors.responseLock.unlock();
//             // if refresh fail log out the user
//             _authenticationBloc.add(AuthenticationEventLoggedOut());
//             return handler.next(error); // continue
//           }
//         } else {
//           appLogger.info(<dynamic>["::::::::    :::::   _dio.interceptors :::: ", error]);
//           handler.next(error);
//         }
//       }),
//     );
//   }
// }
