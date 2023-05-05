import 'package:care_bookie_app/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../res/constants/colors.dart';
import '../../../view_model/bottom_navbar_provider.dart';
import 'main_page_widget/AppbarCustom.dart';
import 'clinic/clinic_widget/clinics_nearby.dart';
import 'main_page_widget/doctor_widget/doctors.dart';
import 'main_page_widget/favorite_infos.dart';
import '../search_page/search_button.dart';


class MainPage extends StatefulWidget {

  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var loadHospitalAndDoctor = Provider.of<HomePageViewModel>(context, listen: false);

    if (loadHospitalAndDoctor.doctors.isEmpty) {
      loadHospitalAndDoctor.getAllDoctor();
    }

    if (loadHospitalAndDoctor.hospitals.isEmpty) {
      loadHospitalAndDoctor.getAllHospital();
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      right: true,
      left: true,
      child: Consumer<BottomNavBarProvider>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: ColorConstant.BackGroundColor,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                //controller: value.scrollController,
                child: Column(
                  children: [
                    const AppbarCustom(),
                    hiPatient(),
                    const SearchButton(),
                    const FavoriteInfos(),
                    doctorTitle(),
                    const Doctors(),
                    clinicsNearbyTitles(),
                    const ClinicsNearby(),
                    // const SizedBox(height: 100)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget hiPatient() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 45, 35, 0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Chào Cong Dat",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Image.asset('assets/images/wavinghand.png',
              width: 30, height: 30, fit: BoxFit.cover),
        ],
      ),
    );
  }

  Widget doctorTitle() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 40, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0.0),
              child: Image.asset(
                'assets/images/doctor02.png',
                scale: 6,
              ),
            ),
            const Text(
              'DOCTORS',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  //textBaseline: TextBaseline.alphabetic,
                  color: Colors.black87,
                  letterSpacing: 1.5,
                  fontFamily: 'Poppins'),
            ),
          ],
        ));
  }

  Widget clinicsNearbyTitles() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
              child: Image.asset(
                'assets/images/clinic.png',
                scale: 4,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              //color: Colors.grey,
              width: 200,
              height: 80,
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "CLINICS",
                    style: TextStyle(
                        height: 1,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        //textBaseline: TextBaseline.alphabetic,
                        color: Color(0xff4fa2e7),
                        letterSpacing: 1.5,
                        fontFamily: 'Poppins'),
                  ),
                  WidgetSpan(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 25.0),
                    child: Text(
                      "NEARBY",
                      style: TextStyle(
                          height: 1,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          //textBaseline: TextBaseline.alphabetic,
                          color: Colors.green,
                          //letterSpacing: 1.5,
                          fontFamily: 'Poppins'),
                    ),
                  )),
                ]),
                //textScaleFactor: 0.8,
              ),
            )
          ],
        ));
  }

}
