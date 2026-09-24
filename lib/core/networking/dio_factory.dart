import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';



class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          sendTimeout: timeOut,
          headers: {'Accept': 'application/json'},
        ),
      );

      dio?.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode,
        ),
      );

      // dio?.interceptors.add(
      //   InterceptorsWrapper(
      //     onRequest: (options, handler) {
      //       // You can modify the request options here if needed

      //       return handler.next(options);
      //     },
      //     onResponse: (response, handler) {
      //       // You can modify the response here if needed
      //       return handler.next(response);
      //     },
      //     onError: (DioException e, handler) {
      //       if (e.type == DioExceptionType.badResponse &&
      //           e.response?.statusCode == 401) {
      //         debugPrint('Unauthorized error: ${e.response?.data}');
      //         // Navigate to the login page
      //         // Handle unauthorized error (e.g., token expired)
      //         // You can perform actions like logging out the user or refreshing the token
      //       }
      //       // You can handle errors here if needed
      //       return handler.next(e);
      //     },
      //   ),
      // );

      return dio!;
    } else {
      return dio!;
    }
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

}
