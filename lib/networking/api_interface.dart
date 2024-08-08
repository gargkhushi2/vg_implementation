// This class defines methods for making API calls using specified endpoints and
// parameters.

import 'package:after_market_mobile_application/networking/dio_client.dart';
import 'package:after_market_mobile_application/networking/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_interface.g.dart';

@RestApi(baseUrl: '')
abstract class ApiInterface {
  factory ApiInterface({String? baseUrl}) {
    final dio =
        DioClient().addHeaders().addAuthInterceptor().addLogger().build();

    return _ApiInterface(dio, baseUrl: baseUrl ?? Endpoints.baseUrl);
  }
}
