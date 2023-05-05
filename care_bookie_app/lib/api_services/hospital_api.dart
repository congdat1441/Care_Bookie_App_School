import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:care_bookie_app/models/hospital.dart';

Future<List<Hospital>> getAllHospitalApi() async {

  String url = "https://3c1e-117-2-6-32.ngrok-free.app/api/v1/care-bookie/common/hospital/getAll";

  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200) {

    List dataJson = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    List<Hospital> hospitals = dataJson.map((e) => Hospital.fromJson(e)).toList();

    return hospitals;

  } else {
    throw Exception("Failed Data");
  }

}

Future<Hospital> getHospitalByIdApi(String id) async {

  String url = "https://3c1e-117-2-6-32.ngrok-free.app/api/v1/care-bookie/common/hospital/$id";

  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200) {

    var dataJson = jsonDecode(utf8.decode(response.bodyBytes));

    Hospital hospital = Hospital.fromJson(dataJson);

    return hospital;

  } else {
    throw Exception("Failed Data");
  }

}