import 'package:cripstv_academy/core/api/api_responses/api_response.dart';
import 'package:cripstv_academy/core/network/network_provider.dart';
import 'package:cripstv_academy/core/network/url_config.dart';

abstract class AccountService {
  Future<ApiResponse> verifyEmail(Map<String, dynamic> data);
  Future<ApiResponse> passwordResetOtp(Map<String, dynamic> data);
  Future<ApiResponse> passwordReset(Map<String, dynamic> data);
  Future<ApiResponse> verifyEmailOtp(Map<String, dynamic> data);
  Future<ApiResponse> refresh(Map<String, dynamic> data);
  Future<ApiResponse> deleteAccount(Map<String, dynamic> data);
  Future<ApiResponse> updateAccount(Map<String, dynamic> data);
  Future<ApiResponse> getUserProfile();
}

class AccountServiceImpl extends AccountService {
  NetworkProvider get networkProvider => globalNetworkProvider;

  @override
  Future<ApiResponse> verifyEmail(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.verifyEmail,
      RequestMethod.post,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> passwordResetOtp(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.passwordResetOtp,
      RequestMethod.post,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> passwordReset(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.passwordReset,
      RequestMethod.post,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> verifyEmailOtp(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.verifyEmailOtp,
      RequestMethod.post,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> refresh(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.refresh,
      RequestMethod.post,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> deleteAccount(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.deleteAccount,
      RequestMethod.delete,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> updateAccount(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.updateAccount,
      RequestMethod.put,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> getUserProfile() async {
    var response = await networkProvider.call(
      UrlConfig.userProfile,
      RequestMethod.get,
    );
    return ApiResponse.fromJson(response.data);
  }
}
