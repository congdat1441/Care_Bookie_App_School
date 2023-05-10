
import 'package:care_bookie_app/api_services/login_api.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_login.dart';

class LoginPageViewModel extends ChangeNotifier {

  LoginApi loginApi = LoginApi();

  UserLogin? userLogin;


  Future<void> signIn(String phone, String password) async {
      userLogin = await loginApi.signIn(phone, password);
  }

}