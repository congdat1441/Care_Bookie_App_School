
import 'package:care_bookie_app/api_services/favorite_api.dart';
import 'package:flutter/cupertino.dart';

import '../models/favorite.dart';

class FavoritePageViewModel extends ChangeNotifier {

  FavoriteApi favoriteApi = FavoriteApi();

  List<DoctorFavorite> listDoctorFavorite = [];

  List<HospitalFavorite> listHospitalFavorite = [];

  Future<void> getAllDoctorFavoriteByUserId(String userId) async {
    if(listDoctorFavorite.isEmpty) {
      listDoctorFavorite = await favoriteApi.getAllDoctorFavoriteByUserIdApi(userId);
    }
  }

  Future<void> getAllHospitalFavoriteByUserId(String userId) async {
    if(listHospitalFavorite.isEmpty) {
      listHospitalFavorite = await favoriteApi.getAllHospitalFavoriteByUserIdApi(userId);
    }
  }

}