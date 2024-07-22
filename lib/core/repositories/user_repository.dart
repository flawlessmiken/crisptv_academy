
import 'package:cripstv_academy/core/api/services/user_service.dart';
import 'package:cripstv_academy/core/session_manager/default.dart';
import 'package:cripstv_academy/locator.dart';
import 'package:cripstv_academy/logic/models/user.dart';
import 'package:cripstv_academy/responsive_state/base_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class UserRepository extends BaseNotifier {
  final _api = locator<UserService>();

  

  Future<void> pickImage(context) async {
    // try {
    //   FilePickerResult? result = await FilePicker.platform.pickFiles(
    //     type: FileType.image,
    //   );
    //   if (result == null) return;
    //   _imageFile = result.files.first;
    //   setState(ViewState.success);
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(e.toString()),
    //     ),
    //   );
    // }
  }

  Future<void> updateUser({
    required String fullName,
    required String userName,
    required String phoneNumber,
    String? country,
    String? language,
  }) async {
    // try {
    //   var response = await _api.updateUser(
    //       fullName: fullName,
    //       userName: userName,
    //       phoneNumber: phoneNumber,
    //       country: country,
    //       language: language,
    //       profileUrl: _imageFile!.bytes);
    //   if (response.isSuccessful ?? false) {
    //     await getProfile();
    //     Snack.show(message: "Profile Updated Successfully", type: SnackBarType.success);
    //   }

    //   return true;
    // } catch (e) {
    //   debugPrint(e.toString());
    //   return false;
    // }

  }

  Future<bool> getProfile() async {
    try {
      var response = await _api.getProfile();
      if (response.isSuccessful ?? false) {
        var user = User.fromJson(response.data);
        await SessionManager.instance.setUser(user);
        if (kDebugMode) {
          print(user.country);
        }
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
