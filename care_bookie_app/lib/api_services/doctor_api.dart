import 'dart:convert';

import 'package:care_bookie_app/models/doctor.dart';
import 'package:http/http.dart' as http;

import '../models/comment.dart';


class DoctorApi {

  Future<List<Doctor>> getAllDoctorApi() async {

    String url = "https://3c1e-117-2-6-32.ngrok-free.app/api/v1/care-bookie/common/doctor/getAll";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {

      List dataJson = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      List<Doctor> doctors = dataJson.map((e) => Doctor.fromJson(e)).toList();

      return doctors;

    } else {
      throw Exception("Failed Data");
    }

  }

  Future<List<Doctor>> getAllDoctorByHospitalIdApi(String hospitalId) async {

    String url = "https://3c1e-117-2-6-32.ngrok-free.app/api/v1/care-bookie/common/doctor/$hospitalId";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {

      List dataJson = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      List<Doctor> doctors = dataJson.map((e) => Doctor.fromJson(e)).toList();

      return doctors;

    } else {
      throw Exception("Failed Data");
    }

  }

  Future<List<Comment>> getAllCommentByDoctorIdApi(String doctorId) async {

    String url = "https://3c1e-117-2-6-32.ngrok-free.app/api/v1/care-bookie/common/doctor/comment/$doctorId";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {

      List dataJson = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      List<Comment> comments = dataJson.map((e) => Comment.fromJson(e)).toList();

      return comments;

    } else {
      throw Exception("Failed Data");
    }

  }

}
