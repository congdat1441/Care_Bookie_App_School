import 'dart:convert';
import 'package:care_bookie_app/models/user_signup.dart';
import 'package:http/http.dart' as http;
import '../utils/host_util.dart';

class SignupApi {
  Future<bool> createAccountUser(UserSignup signupUser) async {
    String url = "${HostUtil.host}api/v1/care-bookie/user/register";

    Map<String, String> headers = {'content-type': 'application/json'};
    var response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(signupUser.toJsonWithUser()));
    if (response.statusCode == 200) {
      print("CREATE USER SUCCESS : ${jsonDecode(response.body)}");

      return true;
    } else {
      return false;
    }
  }
}
