
import 'dart:convert';

import 'package:care_bookie_app/models/history.dart';
import 'package:http/http.dart' as http;

class HistoryApi {

  Future<List<History>> getAllHistoryByUserIdApi(String userId) async {

    String url = "https://84c1-210-245-110-144.ngrok-free.app/api/v1/care-bookie/user/invoice/$userId";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {

      List historiesJson = jsonDecode(utf8.decode(response.bodyBytes));

      List<History> histories = historiesJson.map((e) => History.fromJson(e)).toList();

      return histories;

    } else {
      throw Exception("Failed Data");
    }

  }

}