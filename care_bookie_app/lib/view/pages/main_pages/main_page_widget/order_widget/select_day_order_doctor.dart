
import 'package:care_bookie_app/view_model/schedule_doctor_info_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:care_bookie_app/utils/date_utils.dart' as date_util;
import 'package:provider/provider.dart';
import '../../../../../res/constants/colors.dart';
import '../../../../../utils/colors_util.dart';
import '../../../../../view_model/order_hospital_data_view_model.dart';

class SelectDayDoctor extends StatefulWidget {

  const SelectDayDoctor({Key? key}) : super(key: key);

  @override
  _SelectDayDoctorState createState() => _SelectDayDoctorState();
}

class _SelectDayDoctorState extends State<SelectDayDoctor> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  late int day;

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  Widget selectDayTitle() {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 20, 0),
        child: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Ngày khám bệnh',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
        ));
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget horizontalCapsuleListView() {
    return SizedBox(
      width: width,
      height: 110,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {

    final scheduleDoctorInfoPageViewModel = Provider.of<ScheduleDoctorInfoPageViewModel>(context,listen: false);

    final orderHospitalDataViewModel = Provider.of<OrderHospitalDataViewModel>(context,listen: false);

    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];

              scheduleDoctorInfoPageViewModel.setWeekday(currentDateTime.weekday + 1);

              orderHospitalDataViewModel.setWeekdaySelected(currentDateTime.weekday + 1);

              orderHospitalDataViewModel.setDateTimeSelected(date_util.DateUtils.convertDateString(currentDateTime.toString()));

            });
          },
          child: Container(
            width: 60,
            height: 0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: (currentMonthList[index].day != currentDateTime.day)
                      ? [
                    const Color(0xFFf6f6f6),
                    const Color(0xFFf6f6f6),
                    const Color(0xFFf6f6f6),
                  ]
                      : [
                    HexColor("237be5"),
                    HexColor("1e81e7"),
                    HexColor("1885ea"),
                  ],
                  begin: const FractionalOffset(-20.0, 10.0),
                  end: const FractionalOffset(100.0, 20.0),
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  currentMonthList[index].day.toString(),
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color:
                      (currentMonthList[index].day != currentDateTime.day)
                          ? Colors.black
                          : Colors.white),
                ),
                Text(
                  date_util
                      .DateUtils.weekdays[currentMonthList[index].weekday - 1],
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color:
                      (currentMonthList[index].day != currentDateTime.day)
                          ? Colors.black
                          : Colors.white),
                )
              ],
            ),
          ),
        ));
  }

  Widget topView() {
    return SizedBox(
      height: 220,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectDayTitle(),
            titleView(),
            horizontalCapsuleListView(),
          ]),
    );
  }

  Widget todoList() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, height * 0.38, 10, 10),
      width: width,
      height: height * 0.60,
      child: ListView.builder(
          itemCount: todos.length,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              width: width - 20,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white12,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 3)
                  ]),
              child: Center(
                child: Text(
                  todos[index],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstant.BackGroundColor,
      body: topView(),
    );
  }
}
