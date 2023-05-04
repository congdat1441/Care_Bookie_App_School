
import 'package:flutter/material.dart';

import '../api_services/doctor_api.dart';
import '../models/doctor.dart';
import '../models/hospital.dart';

class HospitalDetailPageProvider extends ChangeNotifier {

  Hospital? hospitalDetail;

  List<Doctor> doctors = [];

  void setHospitalDetail(Hospital hospital) {
    hospitalDetail = hospital;
  }

  Future<void> getAllDoctorByHospitalId(String hospitalId) async {

    doctors = await getAllDoctorByHospitalIdApi(hospitalId);

  }

}