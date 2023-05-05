import 'package:care_bookie_app/api_services/doctor_api.dart';
import 'package:care_bookie_app/api_services/hospital_api.dart';
import 'package:care_bookie_app/models/hospital.dart';
import 'package:flutter/foundation.dart';

import '../models/doctor.dart';



class HomePageViewModel extends ChangeNotifier {


  List<Doctor> doctors = [];

  List<Hospital> hospitals = [];


  Future<void> getAllDoctor() async {
    doctors = await getAllDoctorApi();
    notifyListeners();
  }

  Future<void> getAllHospital() async {
    hospitals = await getAllHospitalApi();
    notifyListeners();
  }

}