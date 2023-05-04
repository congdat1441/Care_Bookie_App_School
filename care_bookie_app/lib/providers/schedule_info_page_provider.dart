
import 'package:flutter/foundation.dart';


class ScheduleInfoPageProvider extends ChangeNotifier {

  int weekday = DateTime.now().weekday;

  void setWeekday(int day) {
    weekday = day;
    notifyListeners();
  }

}