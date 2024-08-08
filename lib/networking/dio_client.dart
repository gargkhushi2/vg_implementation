// This class helps set up a Dio HTTP client. It has methods to add headers, logging,
// and authentication, making it simple to customize Dio before using it for network
// requests.

import 'package:dio/dio.dart';

class DioClient {
  Dio? _dio;

  DioClient() {
    _dio = Dio();
  }

  DioClient addHeaders() {
    assert(_dio != null);
    _dio!.options.headers['access-token'] = "";

    return this;
  }

  DioClient addLogger() {
    assert(_dio != null);
    _dio!.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: (object) => print(
          object.toString(),
        ),
      ),
    );
    return this;
  }

  DioClient addAuthInterceptor() {
    assert(_dio != null);
    _dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers['access-token'] = "";
      handler.next(options);
    }, onError: (error, handler) {
      handler.next(error);
    }));
    return this;
  }

  Dio build() {
    return _dio!;
  }
}
