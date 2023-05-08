import 'package:care_bookie_app/view_model/home_page_view_model.dart';
import 'package:care_bookie_app/view_model/hospital_detail_page_view_model.dart';
import 'package:care_bookie_app/view_model/schedule_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../res/constants/colors.dart';
import '../detail_clinic.dart';

class ClinicsNearby extends StatefulWidget {
  const ClinicsNearby({Key? key}) : super(key: key);

  @override
  State<ClinicsNearby> createState() => _ClinicsNearbyState();
}

class _ClinicsNearbyState extends State<ClinicsNearby> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (context, homePageViewModel, child) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child:
        homePageViewModel.hospitals.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: homePageViewModel.hospitals.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                    height: 120,
                    //width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: const Offset(0, 10))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async{

                              final hospitalDetailPageProvider = Provider.of<HospitalDetailPageViewModel>(context,listen: false);

                              final schedulePageViewModel = Provider.of<SchedulePageViewModel>(context,listen: false);

                              hospitalDetailPageProvider.setHospitalDetail(homePageViewModel.hospitals[index]);

                              hospitalDetailPageProvider.setScheduleWithHospital(schedulePageViewModel.schedules);

                              await hospitalDetailPageProvider.getAllDoctorByHospitalId(homePageViewModel.hospitals[index].id);


                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const DetailClinic()));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                homePageViewModel.hospitals[index].image,
                                fit: BoxFit.fill,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 190,
                                      //height: 40,
                                      //color: Colors.grey,
                                      child: Text(
                                          homePageViewModel.hospitals[index]
                                              .hospitalName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff1c335b),
                                              fontWeight: FontWeight.w600,
                                              fontFamily:
                                              'Merriweather Sans '))),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                              homePageViewModel
                                                  .hospitals[index]
                                                  .address,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  height: 0.9,
                                                  fontSize: 13,
                                                  color: ColorConstant.Grey01,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                  'Merriweather Sans')),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      width: 210,
                                      //color: Colors.black,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        //textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 19,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              homePageViewModel
                                                  .hospitals[index].star
                                                  .toString(),
                                              style: const TextStyle(
                                                  height: 0.9,
                                                  fontSize: 15,
                                                  color: ColorConstant.Grey01,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                  'Merriweather Sans')),
                                          RichText(
                                              text: const TextSpan(children: [
                                                WidgetSpan(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.only(left: 15),
                                                      child: Text("1.2 km ",
                                                          style: TextStyle(
                                                              letterSpacing: 0.2,
                                                              fontSize: 15,
                                                              color: ColorConstant
                                                                  .Grey01,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontFamily:
                                                              'Merriweather Sans')),
                                                    )),
                                              ])),
                                          const Text("| ",
                                              style: TextStyle(
                                                  height: 0.8,
                                                  fontSize: 18,
                                                  letterSpacing: 0.1,
                                                  color: ColorConstant.Grey01,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                  'Merriweather Sans')),
                                          const Text("Chi tiết",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  letterSpacing: 0.1,
                                                  color:
                                                  ColorConstant.BLueText,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                  'Merriweather Sans'))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //  Container(height: 110,
            //    color: Colors.transparent,
            // )
          ],
        ),
      ),
    );
  }
}
