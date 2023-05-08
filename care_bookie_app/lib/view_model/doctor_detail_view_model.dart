
import 'package:care_bookie_app/api_services/doctor_api.dart';
import 'package:care_bookie_app/models/doctor.dart';
import 'package:care_bookie_app/models/hospital.dart';
import 'package:care_bookie_app/models/service.dart';
import 'package:flutter/material.dart';
import '../api_services/hospital_api.dart';
import '../models/comment.dart';
import '../models/schedule.dart';
import '../models/working_day_detail.dart';


class DoctorDetailPageViewModel extends ChangeNotifier {

  DoctorApi doctorApi = DoctorApi();

  HospitalApi hospitalApi = HospitalApi();

  Doctor? doctorDetail;

  Hospital? hospital;

  List<Comment> comments = [];

  List<WorkingDayDetail> workingDayDetailsCheck = [];

  List<Service> listServiceCheck = [];

  bool check = false;

  Schedule? scheduleWithDoctor;

  void setDoctorDetail(Doctor doctor) {
    doctorDetail = doctor;
  }


  Future<void> getHospitalById(String id) async {
    hospital = await hospitalApi.getHospitalByIdApi(id);
  }

  Future<void> getAllCommentByDoctorId(String doctorId) async {

    comments = await doctorApi.getAllCommentByDoctorIdApi(doctorId);

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

  void setScheduleWithDoctor(List<Schedule> schedules) {
    for (var element in schedules) {
      if(element.bookInformation.doctorId == doctorDetail!.id && element.bookInformation.status != "CANCEL") {
        scheduleWithDoctor = element;
      }
    }
  }

  void setSchedule(Schedule schedule) {
    scheduleWithDoctor = schedule;
  }

  void resetScheduleWithDoctor() {
    scheduleWithDoctor = null;
  }

}