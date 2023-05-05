
import 'package:care_bookie_app/models/doctor.dart';
import 'package:care_bookie_app/models/hospital.dart';
import 'package:flutter/cupertino.dart';

class OrderDataViewModel extends ChangeNotifier {

  Doctor? doctorSelected;

  List<int> services = [];

  String? dateTimeSelected;

  String? weekdaySelected;

  String? symptom;

  Hospital? hospital;

  int? age;

  String? name;

  List<int> shareHistoryList = [];

  void setDoctorSelected(Doctor doctor) {
    doctorSelected = doctor;
  }

  void setDateTimeSelected(String dateTime) {
    dateTimeSelected = dateTime;
  }

  void setWeekdaySelected(String weekday) {
    weekdaySelected = weekday;
  }

  void setSymptom(String symptom) {
    this.symptom = symptom;
  }

  void setHospital(Hospital hospital) {
    this.hospital = hospital;
  }

  void setAge(int age) {
    this.age = age;
  }

  void setName(String name) {
    this.name = name;
  }


}