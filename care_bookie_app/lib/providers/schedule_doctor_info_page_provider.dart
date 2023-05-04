
import 'package:flutter/foundation.dart';

class ScheduleDoctorInfoPageProvider extends ChangeNotifier {

  int weekday = DateTime.now().weekday;

  void setWeekday(int day) {
    weekday = day;
    notifyListeners();
  }

}