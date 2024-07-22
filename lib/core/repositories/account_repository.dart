import 'package:cripstv_academy/core/api/api_responses/api_response.dart';
import 'package:cripstv_academy/core/api/services/account_service.dart';
import 'package:cripstv_academy/locator.dart';
import 'package:cripstv_academy/pages/shared/widgets/snack_bar.dart';
import 'package:cripstv_academy/responsive_state/base_view_model.dart';
import 'package:cripstv_academy/responsive_state/view_state.dart';

class AccountRepository extends BaseNotifier {
  final accountApi = locator<AccountService>();

  Future<ApiResponse?> verifyEmail(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await accountApi.verifyEmail(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      return null;
    }
  }

  Future<ApiResponse> passwordResetOtp(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await accountApi.passwordResetOtp(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> passwordReset(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await accountApi.passwordReset(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> verifyEmailOtp(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await accountApi.verifyEmailOtp(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> refresh(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await accountApi.refresh(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> deleteAccount(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await accountApi.deleteAccount(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> updateAccount(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await accountApi.updateAccount(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> getUserProfile() async {
    try {
      setState(ViewState.busy);
      var apiResponse = await accountApi.getUserProfile();
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }
}
