import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../res/constants/colors.dart';
import '../../review_page/review_doctor_page/review_doctor.dart';
import '../../schedule/schedule_detail_cancel.dart';
import '../main_page_widget/order_widget/select_day_order.dart';
import '../order_sumary.dart';

class OrderDetailDoctor extends StatefulWidget {
  const OrderDetailDoctor({Key? key}) : super(key: key);

  @override
  State<OrderDetailDoctor> createState() => _OrderDetailDoctorState();
}

class _OrderDetailDoctorState extends State<OrderDetailDoctor> {
  bool _isAppBarCollapsed = false;
  int _selectedIndex = -1;
  bool _isExpanded = false;
  int _selectedTime = -1;
  bool isSelectedServices = false;
  bool _isChecked = false;

  late ScrollController _scrollController;
  final TextEditingController _controllerTextWord = TextEditingController();

  final List<String> _timeList = [
    "8:00 - 12:00",
    "13:00 - 17:00",
    "18:00 - 21:00",
  ];

  final List<String> _timeDay = [
    "Sáng",
    "Chiều",
    "Tối",
  ];

  final List<String> _options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _isAppBarCollapsed = true;
        });
      } else {
        setState(() {
          _isAppBarCollapsed = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.BackGroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          sliverAppbar(),
          basicInfoDoctor(),
          bookingForOtherPerson(),
          selectServices(),
          selectDay(),
          selectTime(),
          symptom(),
          shareHistory(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget sliverAppbar() {
    return SliverAppBar(
      title: Text(
        'Dr. Nguyễn Văn A',
        style: TextStyle(
            color: _isAppBarCollapsed ? Colors.black : Colors.white,
            overflow: TextOverflow.ellipsis,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ),
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0))),
      backgroundColor: _isAppBarCollapsed ? Colors.white : Colors.transparent,
      leading: IconButton(
        icon: _isAppBarCollapsed
            ? const Icon(
                IconlyLight.arrowLeft,
                color: Colors.black,
                size: 30,
              )
            : const Icon(IconlyLight.arrowLeft, size: 30, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      expandedHeight: 280,
      //collapsedHeight: 70,
      //floating: true,

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
              child: Image.asset(
                "assets/images/doctor03.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
                child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [Colors.black87, Colors.transparent])),
            ))
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  //bottomRight: Radius.circular(10),
                  // bottomLeft: Radius.circular(10)
                )),
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            //padding: const EdgeInsets.only(),
            width: double.maxFinite,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    width: 210,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "Dr. Nguyễn Văn A",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget basicInfoDoctor() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: const Offset(0, 10))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        IconlyLight.location,
                        size: 25,
                        color: Colors.amber,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        width: 320,
                        child: const Text("The CIS Free Clinic",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                height: 0.9,
                                fontSize: 16,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Merriweather Sans')),
                      ),
                    ],
                  ), //hospital of doctor
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0.0),
                        child: Icon(
                          FontAwesomeIcons.userDoctor,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: const Text("Chuyên khoa răng hàm mặt",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                height: 1.9,
                                fontSize: 16,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Merriweather Sans')),
                      ),
                    ],
                  ), // Speciality of doctor
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ...[1].map((e) => Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: const Icon(
                              IconlyBold.star,
                              size: 25,
                              color: Colors.amber,
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("4.5",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ReviewDoctor()));
                          },
                          child: const Text("xem đánh giá",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')))
                    ],
                  ), // star doctor
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0.0),
                        child: Icon(
                          FontAwesomeIcons.stethoscope,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: const Text("15 năm kinh nghiệm ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                height: 0.9,
                                fontSize: 16,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Merriweather Sans')),
                      ),
                    ],
                  ), //experience doctor
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0.0),
                        child: Icon(
                          FontAwesomeIcons.phone,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: const Text("0363755320",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                height: 1.9,
                                fontSize: 16,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Merriweather Sans')),
                      ),
                    ],
                  ), // number phone doctor
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bookingForOtherPerson() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ExpansionTile(
            title: Column(
              children: [
                RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(children: const [
                              Text(
                                'Đặt lịch cho người thân',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    color: Colors.black),
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Thêm thông tin người thân của bạn',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                        color: ColorConstant.BLueText),
                                  ))
                            ]),
                          ],
                        )),
                  ]),
                ),
              ],
            ),
            onExpansionChanged: (isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
            initiallyExpanded: _isExpanded,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 350,
                    //height: 40,
                    child: TextFormField(
                      // textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              )),
                          label: Text("Họ tên",
                              style: TextStyle(color: Colors.black)),
                          hintText: "Vui lòng nhập họ tên người bệnh",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 94, 92, 88),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 350,
                    //height: 40,
                    child: TextFormField(
                      // textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              )),
                          label: Text("Tuổi",
                              style: TextStyle(color: Colors.black)),
                          hintText: "Vui lòng nhập tuổi người bệnh",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 94, 92, 88),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 350,
                    //height: 40,
                    child: TextFormField(
                      // textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              )),
                          label: Text("Giới tính ",
                              style: TextStyle(color: Colors.black)),
                          hintText: "Vui lòng nhập giới tính người bệnh",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 94, 92, 88),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget selectServices() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Dịch vụ ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                )),
            GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: (1 / 0.4),
                children: List.generate(
                    5,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorConstant.BLue05),
                        borderRadius: BorderRadius.circular(25),
                        color: isSelectedServices
                            ? Colors.blue
                            : Colors.white, // Chuyển đổi màu nền
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelectedServices =
                            !isSelectedServices; // Chuyển đổi trạng thái
                          });
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "#Chăm sóc răng miệng",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: isSelectedServices
                                      ? Colors.white
                                      : ColorConstant.BLue05,
                                  // Chuyển đổi màu chữ
                                  height: 0.9,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans',
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "150,000đ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    height: 0.9,
                                    fontSize: 15,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Merriweather Sans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  Widget selectDay() {
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Container(
            width: double.maxFinite,
            height: 220,
            decoration: const BoxDecoration(
              // color: Colors.amber
            ),
            child: const SelectDay(
              title: 'SelectDayForU',
            ),
          ),
        ));
  }

  Widget selectTime() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Thời gian ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              GridView.count(
                //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: (1 / .4),
                children: List.generate(
                  _timeList.length,
                      (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTime = index;
                        });
                      },
                      child: Container(
                        //height: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: _selectedTime == index
                              ? ColorConstant.BLue02
                              : const Color(0xFFf6f6f6),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Text(
                                _timeDay[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  color: _selectedTime == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                _timeList[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  color: _selectedTime == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget symptom() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ExpansionTile(
            title: const Text(
              'Triệu chứng của bạn',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            onExpansionChanged: (isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
            initiallyExpanded: _isExpanded,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: TextFormField(
                  controller: _controllerTextWord,
                  maxLines: 10,
                  maxLength: 350,
                  decoration: const InputDecoration(
                    hintText: 'Triệu chứng của bạn',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shareHistory() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ExpansionTile(
            title: const Text(
              'Chia sẻ lịch sử khám chữa bệnh',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            onExpansionChanged: (isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
            initiallyExpanded: _isExpanded,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 0, top: 20, bottom: 10),
                  height: 110,
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
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const ScheduleDetailCancel()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                    'https://www.stanleywellnesscentre.com/images/blogs/142/FREE_CLINIC_thumbnail_ok.png',
                                    fit: BoxFit.cover,
                                    scale: 4),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                                child: Column(
                                  children: const [
                                    SizedBox(
                                        width: 190,
                                        child: Text("Supporting the CIS",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff1c335b),
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                'Merriweather Sans '))),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                          width: 190,
                                          child: Text(
                                              "Restore Medical Clinic CIS",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: ColorConstant.Grey01,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                  'Merriweather Sans'))),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                          width: 190,
                                          child: Text(
                                              "19 Tháng 4 2023 lúc 11:00AM",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: ColorConstant.Grey01,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                  'Merriweather Sans '))),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChecked = newValue!;
                            });
                          },
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      height: 80,
      color: Colors.transparent,
      child: Column(
        children: [tiepTuc()],
      ),
    );
  }

  Widget tiepTuc() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderSumary()));
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Tiếp Tục",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              )),
        ));
  }
}
