import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class InterceptorLogs extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'RESPONSE Status[${response.requestOptions}] => PATH: ${response.requestOptions.extra}',
    );
    logger.d(
      'RESPONSE Object[${response.data}] => PATH: ${response.requestOptions.path}',
    );

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.d(
      'ERROR[${err.response?.statusMessage}] => PATH: ${err.requestOptions.data}',
    );
    // showToast('Something wrong!!!', false);
    // if (err.response?.statusMessage == 'Unauthorized') {
    //  PreferencesManager.removeToken();
    // }
    // if (err.response?.data != null) showToast("${err.response?.data}", false);

    logger.d(
      'ERROR object[${err.response?.data}] => PATH: ${err.requestOptions.path}',
    );

    return super.onError(err, handler);
  }
}

Logger logger = Logger(
  printer: PrettyPrinter(
    printTime: true,
    methodCount: 1,
    errorMethodCount: 2,
    colors: false,
  ),
);
