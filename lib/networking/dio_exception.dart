// This class defines a custom exception handler for Dio errors.

// ignore_for_file: deprecated_member_use

import 'package:after_market_mobile_application/constants/app_strings.dart';
import 'package:dio/dio.dart';

class DioException implements Exception {
  String? errorMessage;
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = AppStrings.requestToServerWasCancelled;
        break;
      case DioErrorType.connectionTimeout:
        errorMessage = AppStrings.connectionTimedOut;
      case DioErrorType.receiveTimeout:
        errorMessage = AppStrings.receivingTimeOutOccurred;
      case DioErrorType.sendTimeout:
        errorMessage = AppStrings.requestSendTimeout;
      case DioErrorType.badResponse:
        errorMessage = _handleStatusCode(
            dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioErrorType.unknown:
        if (dioError.error.toString().contains(AppStrings.socketException) ==
            true) {
          errorMessage = AppStrings.noInternetAccess;
          break;
        }
        errorMessage = AppStrings.unexpectedErrorOccurred;
        break;
      default:
        errorMessage = AppStrings.somethingWentWrong;
        break;
    }
  }

  String _handleStatusCode(int? statusCode, Map<String, dynamic>? data) {
    if (data != null) {
      if (data['error'] != null) {
        if ((data['error'] as Map?)?['statusCode'] != null) {
          statusCode = data['error']['statusCode'];
        }
      }
    }
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
      case 404:
      case 409:
      case 405:
      case 415:
      case 422:
      case 429:
      case 500:
        {
          if (data != null) {
            if (data['error'] != null) {
              final errorData = data['error'] as Map<String, dynamic>?;

              if (errorData != null && errorData['message'] != null) {
                final message = errorData['message'];

                if (message is String && message.isNotEmpty) {
                  return message;
                }
              }
            }
          }
          return AppStrings.somethingWentWrong;
        }
      default:
        return AppStrings.somethingWentWrong;
    }
  }

  @override
  String toString() => errorMessage ?? AppStrings.emptyString;
}
