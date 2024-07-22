// import 'package:cripstv_academy/core/api/api_responses/api_response.dart';
// import 'package:cripstv_academy/core/network/network_provider.dart';
// import 'package:cripstv_academy/core/network/url_config.dart';
// import 'package:cripstv_academy/logic/models/user.dart';

// abstract class AuthService {
//   Future<UserResponse> signUp({
//     required String fullName,
//     required String userName,
//     required String phoneNumber,
//     required String email,
//     required String password,
//     required String country,
//     required String language,
//     required String currency,
//   });

//   Future<UserResponse> signIn({
//     required String email,
//     required String password,
//   });

//   Future<ApiResponse> verifyEmail({
//     required String email,
//     required String otp,
//   });

//   Future<ApiResponse> passwordResetOtp({
//     required String email,
//   });

//   Future<ApiResponse> passwordReset(
//       {required String email,
//       required String password,
//       required String confirmPassword,
//       required String otp});

//   Future<ApiResponse> verifyEmailOtp({
//     required String email,
//   });

//   Future<ApiResponse> refresh();

//   Future<ApiResponse> deleteAccount({
//     required String email,
//   });
// }

// class AuthServiceImpl extends AuthService {
//   NetworkProvider get networkProvider => globalNetworkProvider;
//   @override
//   Future<ApiResponse> deleteAccount({required String email}) async{
//      Map<String, dynamic> data = {
//       "email": email,
//     };

//     var response = await networkProvider.call(
//         UrlConfig.deleteAccount, RequestMethod.delete,
//         data: data, showLog: true);

//     return ApiResponse.fromJson(response.data);
//   }

//   @override
//   Future<ApiResponse> passwordReset(
//       {required String email,
//       required String password,
//       required String confirmPassword,
//       required String otp}) async {
//     Map<String, dynamic> data = {
//       "email": email,
//       "password": password,
//       "confirmPassword": confirmPassword,
//       "otp": otp
//     };
//     var response = await networkProvider.call(
//       UrlConfig.passwordReset,
//       RequestMethod.post,
//       data: data,
//       showLog: true,
//     );

//     return ApiResponse.fromJson(response.data);
//   }

//   @override
//   Future<ApiResponse> passwordResetOtp({required String email}) async {
//     Map<String, dynamic> data = {
//       "email": email,
//     };
//     var response = await networkProvider.call(
//       UrlConfig.passwordResetOtp,
//       RequestMethod.post,
//       data: data,
//       showLog: true,
//     );

//     return ApiResponse.fromJson(response.data);
//   }

//   @override
//   Future<ApiResponse> refresh() {
//     // TODO: implement refresh
//     throw UnimplementedError();
//   }

//   @override
//   Future<UserResponse> signIn(
//       {required String email, required String password}) async {
//     Map<String, dynamic> data = {
//       "email": email,
//       "password": password,
//     };

//     var response = await networkProvider
//         .call(UrlConfig., RequestMethod.post, data: data, showLog: true);

//     return UserResponse.fromJson(response.data);
//   }

//   @override
//   Future<UserResponse> signUp(
//       {required String fullName,
//       required String userName,
//       required String phoneNumber,
//       required String email,
//       required String password,
//       required String country,
//       required String language,
//       required String currency}) async {
//     Map<String, dynamic> data = {
//       "fullName": fullName,
//       "userName": userName,
//       "phoneNumber": phoneNumber,
//       "email": email,
//       "password": password,
//       "country": country,
//       "language": "",
//       "currency": ""
//     };
//     var response = await networkProvider
//         .call(UrlConfig.signUp, RequestMethod.post, data: data, showLog: true);
//     return UserResponse.fromJson(response.data);
//   }

//   @override
//   Future<ApiResponse> verifyEmail(
//       {required String email, required String otp}) async {
//     Map<String, dynamic> data = {
//       "email": email,
//       "otp": otp,
//     };

//     var response = await networkProvider.call(
//         UrlConfig.verifyEmail, RequestMethod.post,
//         data: data, showLog: true);

//     return ApiResponse.fromJson(response.data);
//   }

//   @override
//   Future<ApiResponse> verifyEmailOtp({required String email}) async {
//     Map<String, dynamic> data = {
//       "email": email,
//     };

//     var response = await networkProvider.call(
//         UrlConfig.verifyEmailOtp, RequestMethod.post,
//         data: data, showLog: true);

//     return ApiResponse.fromJson(response.data);
//   }
// }

import 'package:cripstv_academy/core/api/api_responses/api_response.dart';
import 'package:cripstv_academy/core/network/network_provider.dart';
import 'package:cripstv_academy/core/network/url_config.dart';

abstract class AuthService {
  Future<ApiResponse> signUpRecruiter(Map<String, dynamic> data);
  Future<ApiResponse> signInRecruiter(Map<String, dynamic> data);
  Future<ApiResponse> signUpTalent(Map<String, dynamic> data);
  Future<ApiResponse> signInTalent(Map<String, dynamic> data);
}

class AuthServiceImpl extends AuthService {
  NetworkProvider get networkProvider => globalNetworkProvider;

  @override
  Future<ApiResponse> signUpRecruiter(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
        UrlConfig.signUpRecruiter, RequestMethod.post,
        data: data, showLog: true);
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> signInRecruiter(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
        UrlConfig.signInRecruiter, RequestMethod.post,
        data: data, showLog: true);
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> signUpTalent(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
        UrlConfig.signUpTalent, RequestMethod.post,
        data: data, showLog: true);
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> signInTalent(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
        UrlConfig.signInTalent, RequestMethod.post,
        data: data, showLog: true);
    return ApiResponse.fromJson(response.data);
  }
}
