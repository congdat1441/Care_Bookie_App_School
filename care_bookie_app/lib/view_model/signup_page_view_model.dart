

import 'package:care_bookie_app/models/user_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../api_services/signup_api.dart';

class SignupPageViewModel extends ChangeNotifier {
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String email = '';
  String password = '';

  String errorPhone = '';
  String errorPassword = '';
  String errorFirstName = '';
  String errorLastName = '';
  String errorEmail = '';

  SignupApi signupApi = SignupApi();


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void updateFirstName(String value) {
    firstName = value;
  }

  void updateLastName(String value) {
    lastName = value;
  }

  void updatePhoneNumber(String value) {
    phoneNumber = value;
  }

  void updateEmail(String value) {
    email = value;
  }

  void updatePassword(String value) {
    password = value;
  }

  Future<bool> signup(UserSignup userSignup) async{
    bool isSuccess = await signupApi.createAccountUser(userSignup);
    return isSuccess;
  }

  // bool isSignupSuccessful() {
  //   // Perform your signup logic here
  //   // Return true if the signup is successful, false otherwise
  //   // You can check the values of firstName, lastName, phoneNumber, email, password properties to perform the signup
  //   // For example, you can validate the data and make an API request to create a new user account
  //   return true;
  // }

  bool validateFields(String firstName, String lastName, String phone, String email, String password) {
    bool isValid = true;
    if (firstName.isEmpty) {
      isValid = false;
      errorFirstName = "Vui lòng nhập vào họ của bạn";
    }
    if (lastName.isEmpty) {
      isValid = false;
      errorLastName = "Vui lòng nhập vào tên của bạn";
    }
    if (email.isEmpty) {
      isValid = false;
      errorEmail = "Vui lòng nhập vào email của bạn";
    }
    if (phone.isEmpty) {
      isValid = false;
      errorPhone = "Vui lòng nhập số điện thoại";
    }
    if (password.isEmpty) {
      isValid = false;
      errorPassword = "Vui lòng nhập đúng mật khẩu";
    }
    notifyListeners();
    return isValid;
  }

  void resetError() {
    errorPassword = "";
    errorPhone = "";
    _errorMessage = "";
    errorLastName = "";
    errorFirstName= "";
    errorEmail= "";

    notifyListeners();
  }
}