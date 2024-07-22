import 'package:cripstv_academy/core/api/api_responses/api_response.dart';
import 'package:cripstv_academy/core/network/network_provider.dart';
import 'package:cripstv_academy/core/network/url_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


abstract class UserService {
  Future<ApiResponse> updateUser({
    required String fullName,
    required String userName,
    required String phoneNumber,
    Uint8List? profileUrl,
    String? country,
    String? language,
  });

  Future<ApiResponse> getProfile();
}

class UserServiceImpl extends UserService {
  NetworkProvider get networkProvider => globalNetworkProvider;

  @override
  Future<ApiResponse> updateUser(
      {required String fullName,
      required String userName,
      required String phoneNumber,
      Uint8List? profileUrl,
      String? country,
      String? language}) async {
    FormData formData = FormData.fromMap({
      'ProfileUrl': await uint8ListToMultipartFile(profileUrl!),
      "FullName": fullName,
      "Country": country,
      "Language": language,
      "UserName": userName,
      "BannerUrl": '',
      "PhoneNumber": phoneNumber,
    });

    FormData data = FormData.fromMap({
      "FullName": fullName,
      "Country": country,
      "Language": language,
      "UserName": userName,
      "PhoneNumber": phoneNumber,
    });
    var response = await networkProvider.call(
      UrlConfig.updateAccount,
      RequestMethod.put,
      data: profileUrl.isEmpty ? data : formData,
    );
    return ApiResponse.fromJson(response.data);
  }

  Future<MultipartFile> uint8ListToMultipartFile(Uint8List uint8List,
      {String fileName = 'file'}) async {
    // Convert Uint8List to MultipartFile
    MultipartFile file = MultipartFile.fromBytes(
      uint8List,
      filename: fileName,
    );

    return file;
  }

  @override
  Future<ApiResponse> getProfile() async {
    var response = await networkProvider.call(
      UrlConfig.userProfile,
      RequestMethod.get,
    );
    return ApiResponse.fromJson(response.data);
  }
}
