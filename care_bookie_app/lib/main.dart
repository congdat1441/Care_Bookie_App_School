
import 'package:care_bookie_app/view/pages/layouts_page/navbar_layout.dart';
import 'package:care_bookie_app/view/pages/login_signup_page/log_in.dart';
import 'package:care_bookie_app/view_model/bottom_navbar_provider.dart';
import 'package:care_bookie_app/view_model/doctor_detail_view_model.dart';
import 'package:care_bookie_app/view_model/favorite_page_view_model.dart';
import 'package:care_bookie_app/view_model/history_detail_page_view_model.dart';
import 'package:care_bookie_app/view_model/history_page_view_model.dart';
import 'package:care_bookie_app/view_model/home_page_view_model.dart';
import 'package:care_bookie_app/view_model/hospital_detail_page_view_model.dart';
import 'package:care_bookie_app/view_model/login_page_view_model.dart';
import 'package:care_bookie_app/view_model/order_hospital_data_view_model.dart';
import 'package:care_bookie_app/view_model/schedule_cancel_view_model.dart';
import 'package:care_bookie_app/view_model/schedule_detail_page_view_model.dart';
import 'package:care_bookie_app/view_model/schedule_doctor_info_page_view_model.dart';
import 'package:care_bookie_app/view_model/schedule_info_page_view_model.dart';
import 'package:care_bookie_app/view_model/schedule_page_view_model.dart';
import 'package:care_bookie_app/view_model/search_page_view_model.dart';
import 'package:care_bookie_app/view_model/user_login_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => HomePageViewModel(),),
        ChangeNotifierProvider(create: (context) => DoctorDetailPageViewModel(),),
        ChangeNotifierProvider(create: (context) => HospitalDetailPageViewModel(),),
        ChangeNotifierProvider(create: (context) => ScheduleInfoPageViewModel(),),
        ChangeNotifierProvider(create: (context) => ScheduleDoctorInfoPageViewModel(),),
        ChangeNotifierProvider(create: (context) => UserLoginInfoViewModel(),),
        ChangeNotifierProvider(create: (context) => HistoryPageViewModel(),),
        ChangeNotifierProvider(create: (context) => HistoryDetailPageViewModel(),),
        ChangeNotifierProvider(create: (context) => OrderHospitalDataViewModel(),),
        ChangeNotifierProvider(create: (context) => SchedulePageViewModel(),),
        ChangeNotifierProvider(create: (context) => ScheduleDetailPageViewModel(),),
        ChangeNotifierProvider(create: (context) => ScheduleCancelViewModel(),),
        ChangeNotifierProvider(create: (context) => FavoritePageViewModel(),),
        ChangeNotifierProvider(create: (context) => SearchPageViewModel(),),
        ChangeNotifierProvider(create: (context) => LoginPageViewModel(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Golos' 'Arimo' 'Poppins',
        ),
        home: StreamBuilder(
          //stream: isLoggedIn(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Lỗi khi kiểm tra đăng nhập');
            } else if (snapshot.data == true) {
              // Nếu đã đăng nhập, chuyển đến trang chủ
              return ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const NavbarLayout(index: 0)));
                },
                child: const Text('Trang chủ'),
              );
            } else {
              return const Login();
            }
          },
        ),
      ),
    );
  }
}
