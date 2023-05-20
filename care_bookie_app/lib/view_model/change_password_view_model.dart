import 'package:care_bookie_app/api_services/signup_api.dart';
import 'package:flutter/material.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  String? oldPassword;
  String? newPassword;
  String? passwordReset;

  String errorResetPassword = "";

  bool validateResetPassword() {
    if (newPassword!.isEmpty || passwordReset!.isEmpty) {
      errorResetPassword = "Vui lòng nhập đầy đủ thông tin";
      notifyListeners();
      return false;
    }

    if (newPassword! != passwordReset!) {
      errorResetPassword = "Vui lòng kiểm tra lại mật khẩu";
      notifyListeners();
      return false;
    }
    return true;
  }

  void setOldPassword(String value) {
    oldPassword = value;
  }

  void setNewPassword(String value) {
    oldPassword = value;
  }

  void setPasswordReset(String value) {
    oldPassword = value;
  }

  Future<bool> changePassword() async {
    return await SignupApi.changePassword(
        oldPassword!, newPassword!, passwordReset!);
  }
}
