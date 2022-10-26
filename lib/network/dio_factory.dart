import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:video_360/application/constants.dart';

class DioFactory {
  // final AppPreferences appPreferences;
  // DioFactory(this.appPreferences);
  Future<Dio> getDio() async {
    Dio dio = Dio();

    // String? language = await appPreferences.getAppLanguage();
    Map<String, String> headers = {
      Constants.CONTENT_TYPE: Constants.APPLICATION_JSON,
      Constants.ACCEPT: Constants.APPLICATION_JSON,
      Constants.AUTHORIZATION: Constants.token,
      Constants.DEFAULT_LANGUAGE: 'en'
    };

    dio.options = BaseOptions(
      headers: headers,
      baseUrl: Constants.baseUrl,
      sendTimeout: Constants.timeOut,
      receiveTimeout: Constants.timeOut,
    );

    if (!kReleaseMode) {
      // app show logs of APIs in debug mode only not in release mode
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
