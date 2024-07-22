import 'package:dio/dio.dart';

class KuepassInterceptor extends Interceptor {
  final String? authToken;
  KuepassInterceptor(this.authToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authToken != null) {
      options.headers.addAll({
        "Authorization": "Bearer ${authToken}",
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403) {
      // eventBus.fire(SessionExpiredEvent());
    }
    handler.next(err);
  }

  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   ///Perform general action based on response
  //   ///
  //   return super.onResponse(response, handler);
  // }
}
