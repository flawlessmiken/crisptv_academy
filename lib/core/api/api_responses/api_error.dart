import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiError {
  late String message;
  late final String? description;
  late num statusCode;
  dynamic data;

  ApiError(this.message, [this.description]);

  ApiError.fromDio(Object dioError, {bool? callSucces}) {
    _handleError(dioError, callSucces: callSucces);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error, {bool? callSucces}) {
    if (error is DioException) {
      DioException dioError = error;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          message = "Request to server was cancelled";
          break;
        case DioExceptionType.connectionError:
          message = "Connection Error";
          break;
        case DioExceptionType.connectionTimeout:
          message =
              "Connection timeout with API server, please try again later";
          break;
        case DioExceptionType.unknown:
          message =
              "Connection to API server failed due to internet connection, please check and try again";
          break;
        case DioExceptionType.receiveTimeout:
          message =
              "Receive timeout in connection with API server, please try again later.";
          break;
        case DioExceptionType.badCertificate:
          message = "Bad Certificate, please try again later.";
          break;
        case DioExceptionType.badResponse:
          message = "An Unknown error occurred. "
              "We are currently working on it";
          statusCode = dioError.response?.statusCode ?? 500;
          final response = error.response;
          if (response == null) return;
          if (statusCode < 500) {
            List<String?> messages = [];
            try {
              Map errorStatements = response.data['errors'] ??
                  response.data['title'] ??
                  response.data["message"];
              for (var error in errorStatements.keys) {
                if (errorStatements[error] is String) {
                  errorStatements[error] = errorStatements[error].split(':');
                }
                for (var err in errorStatements[error]) {
                  messages.add(err);
                }
              }
            } catch (e) {
              messages.add(response.data['title'] ?? response.data['message']);
            }
            message = messages.join(',');
          }
          break;
        case DioExceptionType.sendTimeout:
          message =
              "Connection timeout with API server, please try again later";
          break;
      }
    } else {
      message = "An unknown error occurred!";
    }
  }

  static String handleApiError({required Map response}) {
    List<String?> message = [];
    try {
      Map errorStatements = response['responseData'] ??
          response['responseMessage'] ??
          response["message"];
      for (var error in errorStatements.keys) {
        if (errorStatements[error] is String) {
          errorStatements[error] = errorStatements[error].split(':');
        }
        for (var err in errorStatements[error]) {
          message.add(err);
        }
      }
    } catch (e) {
      message.add(response['responseMessage'] ?? response['message']);
    }
    if (kDebugMode) {
      print(message);
    }

    return message.join(',');
  }

  @override
  String toString() => message;
}
