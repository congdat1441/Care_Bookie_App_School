
import 'package:care_bookie_app/api_services/hospital_api.dart';
import 'package:care_bookie_app/models/schedule.dart';
import 'package:flutter/material.dart';

import '../api_services/doctor_api.dart';
import '../models/comment.dart';
import '../models/doctor.dart';
import '../models/hospital.dart';
import '../models/service.dart';
import '../models/working_day_detail.dart';

class HospitalDetailPageViewModel extends ChangeNotifier {

  DoctorApi doctorApi = DoctorApi();

  HospitalApi hospitalApi = HospitalApi();

  Hospital? hospitalDetail;

  List<Doctor> doctors = [];

  List<Comment> comments = [];

  List<WorkingDayDetail> workingDayDetailsCheck = [];

  List<Service> listServiceCheck = [];

  bool check = false;

  Schedule? scheduleWithHospital;

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

  void setCheck(bool value) {
    check = value;
  }

  void setListServiceCheck(Service service) {
    if(check) {
      listServiceCheck.remove(service);
    } else {
      listServiceCheck.add(service);
    }
  }

  void setScheduleWithHospital(List<Schedule> schedules) {
    for (var element in schedules) {
      if(element.bookInformation.hospitalId == hospitalDetail!.id && element.bookInformation.status != "CANCEL") {
        scheduleWithHospital = element;
      }
    }
  }

}