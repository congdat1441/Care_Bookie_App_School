
import 'package:care_bookie_app/api_services/hospital_api.dart';
import 'package:flutter/material.dart';

import '../api_services/doctor_api.dart';
import '../models/comment.dart';
import '../models/doctor.dart';
import '../models/hospital.dart';
import '../models/working_day_detail.dart';

class HospitalDetailPageViewModel extends ChangeNotifier {

  DoctorApi doctorApi = DoctorApi();

  HospitalApi hospitalApi = HospitalApi();

  Hospital? hospitalDetail;

  List<Doctor> doctors = [];

  List<Comment> comments = [];

  List<WorkingDayDetail> workingDayDetailsCheck = [];

  void setHospitalDetail(Hospital hospital) {
    hospitalDetail = hospital;
  }

  Future<void> getAllDoctorByHospitalId(String hospitalId) async {

    doctors = await doctorApi.getAllDoctorByHospitalIdApi(hospitalId);

  }

  Future<void> getAllCommentByHospitalId(String hospitalId) async {

    comments = await hospitalApi.getAllCommentByHospitalIdApi(hospitalId);

  }

  void setWorkingDayDetailsCheck(List<WorkingDayDetail> workingDayDetails,int weekday) {
    workingDayDetailsCheck = [];
    for (var element in workingDayDetails) {
      if(element.date.isNotEmpty) {
        if(weekday + 1 == int.parse(element.date)) {
          workingDayDetailsCheck.add(element);
        }
      }
    }
  }



}