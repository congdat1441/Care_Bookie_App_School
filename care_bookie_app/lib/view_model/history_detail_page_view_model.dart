

import 'package:care_bookie_app/models/history.dart';
import 'package:flutter/widgets.dart';

class HistoryDetailPageViewModel extends ChangeNotifier{

  History? historyDetail;

  void setHistoryDetail(History history) {
    historyDetail = history;
  }

}