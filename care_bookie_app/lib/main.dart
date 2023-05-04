import 'package:care_bookie_app/providers/bottom_navbar_provider.dart';
import 'package:care_bookie_app/providers/doctor_detail_page_provider.dart';
import 'package:care_bookie_app/providers/home_page_provider.dart';
import 'package:care_bookie_app/providers/hospital_detail_page_provider.dart';
import 'package:care_bookie_app/providers/schedule_doctor_info_page_provider.dart';
import 'package:care_bookie_app/providers/schedule_info_page_provider.dart';
import 'package:care_bookie_app/view/pages/layouts_page/navbar_layout.dart';
import 'package:care_bookie_app/view/pages/login_signup_page/log_in.dart';
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
        ChangeNotifierProvider(create: (context) => HomePageProvider(),),
        ChangeNotifierProvider(create: (context) => DoctorDetailPageProvider(),),
        ChangeNotifierProvider(create: (context) => HospitalDetailPageProvider(),),
        ChangeNotifierProvider(create: (context) => ScheduleInfoPageProvider(),),
        ChangeNotifierProvider(create: (context) => ScheduleDoctorInfoPageProvider(),)
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
