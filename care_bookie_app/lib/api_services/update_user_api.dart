import 'dart:convert';
import 'package:care_bookie_app/models/user_update.dart';
import 'package:http/http.dart' as http;
import '../utils/host_util.dart';

class UpdateUserApi {
  static Future<bool> updateAccountUser(UserUpdate userUpdate) async {
    String url = "${HostUtil.host}api/v1/care-bookie/user/update/information";

    Map<String, String> headers = {'content-type': 'application/json'};
    var response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(userUpdate.toJsonWithUser()));
    if (response.statusCode == 200) {
      print("CHANGE INFOR USER SUCCESS : ${jsonDecode(response.body)}");

      return true;
    } else {
      return false;
    }
  }


}
