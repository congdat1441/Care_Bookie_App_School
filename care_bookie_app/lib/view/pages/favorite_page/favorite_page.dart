import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../res/constants/colors.dart';
import '../main_pages/main_page_widget/AppbarCustom.dart';
import 'clinic_favorite.dart';
import 'doctor_favorite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      right: true,
      left: true,
      child: Scaffold(
        backgroundColor: ColorConstant.BackGroundColor,
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const AppbarCustom(),
                  favoriteDoctor(),
                  const DoctorFavorite(),
                  favoriteClinic(),
                  const ClinicFavorite(),
                  const SizedBox(height: 120)
                ],
              ),
            )),
      ),
    );
  }

  Widget favoriteDoctor() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: 200,
              height: 80,
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Bác",
                    style: TextStyle(
                        height: 1,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        color: Color(0xff4fa2e7),
                        letterSpacing: 1.5,
                        fontFamily: 'Poppins'),
                  ),
                  WidgetSpan(
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                        child: Text(
                          "Sỹ",
                          style: TextStyle(
                              height: 0.8,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: Colors.green,
                              fontFamily: 'Poppins'),
                        ),
                      )),
                ]),
                //textScaleFactor: 0.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0.0),
              child: SvgPicture.asset(
                'assets/images/schedule.svg',
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ));
  }

  Widget favoriteClinic() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: 200,
              height: 80,
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Bệnh",
                    style: TextStyle(
                        height: 1,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        color: Colors.orange,
                        letterSpacing: 1.5,
                        fontFamily: 'Poppins'),
                  ),
                  WidgetSpan(
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                        child: Text(
                          "Viện",
                          style: TextStyle(
                              height: 0.8,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: Colors.blueAccent,
                              fontFamily: 'Poppins'),
                        ),
                      )),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0.0),
              child: SvgPicture.asset(
                'assets/images/schedule.svg',
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ));
  }
}
