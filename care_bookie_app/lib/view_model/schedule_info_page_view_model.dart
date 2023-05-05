
import 'package:flutter/foundation.dart';


class ScheduleInfoPageViewModel extends ChangeNotifier {

  int weekday = DateTime.now().weekday;

  void setWeekday(int day) {
    weekday = day;
    notifyListeners();
  }

}