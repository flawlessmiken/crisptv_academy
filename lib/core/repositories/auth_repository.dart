import 'package:cripstv_academy/core/api/api_responses/api_response.dart';
import 'package:cripstv_academy/core/api/services/auth_service.dart';
import 'package:cripstv_academy/locator.dart';
import 'package:cripstv_academy/pages/shared/widgets/snack_bar.dart';
import 'package:cripstv_academy/responsive_state/base_view_model.dart';
import 'package:cripstv_academy/responsive_state/view_state.dart';

class AuthRepository extends BaseNotifier {
  final authApi = locator<AuthService>();

  Future<ApiResponse?> signUpRecruiter(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await authApi.signUpRecruiter(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      return null;
    }
  }

  Future<ApiResponse?> signInRecruiter(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await authApi.signInRecruiter(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      return null;
    }
  }

  Future<ApiResponse> signUpTalent(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await authApi.signUpTalent(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse?> signInTalent(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await authApi.signInTalent(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      return null;
    }
  }
}
