import 'dart:developer';

import 'package:cripstv_academy/core/api/api_responses/api_error.dart';
import 'package:cripstv_academy/core/session_manager/default.dart';
import 'package:cripstv_academy/utils/event_bus.dart';
import 'package:cripstv_academy/utils/file_upload_progress_event.dart';
import 'package:cripstv_academy/utils/logger.dart';
import 'package:dio/dio.dart';

import 'network.dart';

/// description: A network provider class which manages network connections
/// between the app and external services. This is a wrapper around [Dio].
///
/// Using this class automatically handle, token management, logging, global
/// interceptors and general parameters such as country and language.
///
///
///
NetworkProvider globalNetworkProvider = NetworkProvider();

class NetworkProvider {
  static const Duration connectTimeout = Duration(milliseconds: 60000);
  static const Duration receiveTimeout = Duration(milliseconds: 60000);

  late Dio dio;
  String? baseUrl;
  String? authToken;
  late bool showLog;

  NetworkProvider({this.baseUrl, String? token, this.showLog = false}) {
    baseUrl ??= UrlConfig.baseUrl;
    authToken = token ?? SessionManager.instance.authToken;
    _initialiseDio();
  }

  /// Initialize essential class properties
  void _initialiseDio() {
    dio = Dio(BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      baseUrl: baseUrl!,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ));

    if (authToken != null) {
      dio.interceptors.add(KuepassInterceptor(authToken));
    }
    if (showLog) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        logPrint: printDioLogs,
      ));
    }
  }

  /// Factory constructor used mainly for injecting an instance of [Dio] mock
  NetworkProvider.test(this.dio);

  Future<Response> call(
    String path,
    RequestMethod method, {
    Map<String, dynamic>? queryParams,
    data,
    FormData? formData,
    ResponseType responseType = ResponseType.json,
    String classTag = '',
    bool? showLog,
  }) async {
    Response response;
    var params = queryParams ?? {};

    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio.post(path,
              queryParameters: params,
              data: data,
              options: Options(
                  responseType: responseType,
                  headers: SessionManager.instance.userLoggedIn
                      ? {
                          "Authorization":
                              "Bearer ${SessionManager.instance.authToken!}",
                        }
                      : null));
          break;
        case RequestMethod.get:
          response = await dio.get(path, queryParameters: params);
          break;
        case RequestMethod.put:
          response = await dio.put(
            path,
            queryParameters: params,
            data: data ?? formData,
            options: Options(
                headers: SessionManager.instance.userLoggedIn
                    ? {
                        "Authorization":
                            "Bearer ${SessionManager.instance.authToken!}",
                      }
                    : null),
          );
          break;
        case RequestMethod.delete:
          response =
              await dio.delete(path, queryParameters: params, data: data);
          break;
        case RequestMethod.upload:
          response = await dio.post(path,
              data: formData,
              queryParameters: params,
              options: Options(headers: {
                "Authorization": "Bearer ${SessionManager.instance.authToken!}",
                "Content-Disposition": "form-data",
                "Content-Type": "multipart/form-data",
              }), onSendProgress: (sent, total) {
            eventBus.fire(FileUploadProgressEvent(sent, total, classTag));
          });
          break;
      }
      if (showLog ?? false) log("$path API response: $response");
      if (response.data["isSuccessful"] != null &&
          !response.data["isSuccessful"]) {
        var apiError = ApiError.fromDio(response);
        return Future.error(apiError);
      }
      return response;
    } catch (error, stackTrace) {
      if ((showLog ?? false) && error is DioException) {
        log("$path: ${error.response?.statusCode} code");
        log("API response: ${error.response}");
      }
      var apiError = ApiError.fromDio(error);
      // return Future.error(apiError);
      return Future.error(apiError, stackTrace);
    }
  }
}

enum RequestMethod { post, get, put, delete, upload }
