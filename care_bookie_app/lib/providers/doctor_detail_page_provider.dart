
import 'package:care_bookie_app/models/doctor.dart';
import 'package:care_bookie_app/models/hospital.dart';
import 'package:flutter/material.dart';
import '../api_services/hospital_api.dart';


class DoctorDetailPageProvider extends ChangeNotifier {

  Doctor? doctorDetail;

  Hospital? hospital;

  void setDoctorDetail(Doctor doctor) {
    doctorDetail = doctor;
  }

  Future<void> getHospitalById(String id) async {
    hospital = await getHospitalByIdApi(id);
  }

}