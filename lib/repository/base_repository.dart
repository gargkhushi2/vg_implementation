// This class used for handling network requests using Dio. It integrates error handling, response
// parsing, and state management.

// Features:
// Executes network requests with error handling using Dio.
// Manages response states (loading, success, empty, error) through ResponseDataState.
// Handles specific Dio errors and exceptions, logging debug messages in development
// mode.

import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:after_market_mobile_application/models/base_response.dart';
import 'package:after_market_mobile_application/networking/api_interface.dart';
import 'package:after_market_mobile_application/networking/dio_exception.dart';
import 'package:after_market_mobile_application/networking/response_data_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BaseRepository {
  final apiInterface = ApiInterface();
  Future<ResponseDataState<T?>> executeNetworkRequest<T extends BaseResponse>(
      Future<T?> Function() request) async {
    try {
      ResponseDataState.loading();
      T? response = await request();
      if (response?.statusCode == 1) {
        if (kDebugMode) {
          print(AppStrings.successNetworkRequest);
        }
        return ResponseDataState.success(responseData: response);
      }
      return ResponseDataState.empty(emptyDataMessage: AppStrings.noDataFound);
    } on DioError catch (e, stk) {
      var message = AppStrings.emptyString;
      message =
          DioException.fromDioError(e).errorMessage ?? AppStrings.emptyString;
      if (kDebugMode) {
        print("error message : $stk $T");
      }
      return ResponseDataState.error(errorMessage: message);
    } catch (e, stk) {
      if (kDebugMode) {
        print("error message from data failed : $stk");
      }

      return ResponseDataState.error(errorMessage: e.toString());
    }
  }
}
