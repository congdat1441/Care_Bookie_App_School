
import 'package:care_bookie_app/models/user_login.dart';
import 'package:flutter/foundation.dart';

class UserLoginInfoViewModel extends ChangeNotifier {

  UserLogin userLogin = UserLogin(
      id: "DLpoanh1007",
      firstName: "Dũng 1",
      lastName: "Lê Thị",
      birthDay: "11-08-2002",
      email: "poanh1007@gmail.com",
      gender: 1,
      phone: "0363755306",
      address: "TDP An Cư Tây, TT Lăng Cô, Huyện A Lưới",
      image: "https://toigingiuvedep.vn/wp-content/uploads/2022/11/avatar-dep-nu-cho-con-gai.jpg"
  );

  void setUserLogin(UserLogin user) {
    userLogin = user;
    notifyListeners();
  }

}