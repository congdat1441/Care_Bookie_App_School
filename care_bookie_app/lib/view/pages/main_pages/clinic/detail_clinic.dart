import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../../../../res/constants/colors.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../providers/doctor_detail_page_provider.dart';
import '../../../../providers/hospital_detail_page_provider.dart';
import '../../review_page/review_clinic_page/review_clinic.dart';
import '../doctor/detail_doctor.dart';
import '../main_page_widget/doctor_widget/doctors.dart';
import 'order_detail_clinic.dart';

class DetailClinic extends StatefulWidget {
  const DetailClinic({Key? key}) : super(key: key);

  @override
  State<DetailClinic> createState() => _DetailClinicState();
}

class _DetailClinicState extends State<DetailClinic>
    with TickerProviderStateMixin {
  final String longText =
      'sit amet saidunt ante. Nullam fringilla, justo nec ultrices euismod, velit ipsum congue arcu, vel gravida eros mauris sit amet lorem. Mauris tincidunt justo sed nunc pretium fermentum. Vivamus vel aliquam enim. Vivamus tincidunt nunc eu orci venenatis, ut bibendum lorem bibendum. Sed feugiat tincidunt ipsum non feugiat. Suspendisse nec bibendum arcu Sed dictum ante eu purus finibus, eu tristique tellus feugiat. Sed faucibus, elit et luctus malesuada, ipsum mauris faucibus odio, eget laoreet ipsum dolor nec nisi. Duis id vestibulum nulla. Nulla at magna vel nulla pharetra fermentum. Sed vitae ante malesuada, malesuada felis vitae, scelerisque arcu. Morbi pellentesque est eu mauris venenatis volutpat. In hac habitasse platea dictumst. Nulla feugiat lectus velit, nec dapibus purus lobortis et. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec eu eros ut orci commodo consequat a quis neque. Sed non justo non quam ultrices tempus sit amet non nulla. Nam vel arcu Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget convallis tortor. Suspendisse potenti. Sed dictum ante eu purus finibus, eu tristique tellus feugiat. Sed faucibus, elit et luctus malesuada, ipsum mauris faucibus odio, eget laoreet ipsum dolor nec nisi. Duis id vestibulum nulla. Nulla at magna vel nulla pharetra fermentum. Sed vitae ante malesuada, malesuada felis vitae, scelerisque arcu. Morbi pellentesque tellus maximus bibendum .';
  bool isExpanded = false;
  late TabController _tabController;

  List<num> removeDuplicates(List<num> numbers) {
    Set<num> numberSet = Set<num>.from(numbers);
    List<num> uniqueNumbers = numberSet.toList();
    return uniqueNumbers;
  }

  List<num> numbers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    numbers = [];

    for (var element in hospitalDetailPageProvider.hospitalDetail!.workingDayDetails) {
      if(element.date.isNotEmpty) {
        numbers.add(num.parse(element.date));
      }
    }

    numbers = removeDuplicates(numbers);

    _tabController = TabController(length: numbers.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.BackGroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar(),
          addressAndReview(),
          doctorClinic(),
          timeWorking(),
          infoClinic(),
          certificationClinic(),
          bookingClinic(context)
        ],
      ),
    );
  }

  Widget sliverAppBar() {

    final hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    return SliverAppBar(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
          hospitalDetailPageProvider.hospitalDetail!.hospitalName,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              //letterSpacing: 2,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ),
      ),
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      collapsedHeight: 80,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          IconlyLight.arrowLeft,
          size: 30,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconlyLight.heart,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconlyLight.upload,
            size: 30,
          ),
        ),
      ],
      expandedHeight: 350,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(34),
                  bottomRight: Radius.circular(34)),
              child: Image.network(
                hospitalDetailPageProvider.hospitalDetail!.image,
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
        preferredSize: const Size.fromHeight(30),
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
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 210,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      hospitalDetailPageProvider.hospitalDetail!.hospitalName,
                      style:
                          const TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Text("${hospitalDetailPageProvider.hospitalDetail!.priceFrom}00đ - ${hospitalDetailPageProvider.hospitalDetail!.priceTo}00đ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                              color: Color(0xfffcb13d),
                              fontSize: 18)),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget addressAndReview() {

    final hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Container(
          height: 200,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 215,
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Text(hospitalDetailPageProvider.hospitalDetail!.address,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              height: 1,
                              fontSize: 16,
                              color: ColorConstant.Grey01,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Merriweather Sans')),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: const Text("LH: 0805179559",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              height: 1,
                              fontSize: 16,
                              color: ColorConstant.Grey01,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Merriweather Sans')),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: hospitalDetailPageProvider.hospitalDetail!.star.toDouble(),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("${hospitalDetailPageProvider.hospitalDetail!.star}",
                              style: const TextStyle(
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
                                        const ReviewClinic()));
                          },
                          child: const Text("Đánh giá",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
                      width: 350,
                      child: const Text("Dịch vụ khám",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              height: 0.9,
                              fontSize: 19,
                              //color: ColorConstant.Grey01,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Merriweather Sans')),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...hospitalDetailPageProvider.hospitalDetail!.services.map((e) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstant.BLue05),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("#${e.serviceName}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: ColorConstant.BLue05,
                                          height: 0.9,
                                          fontSize: 15,
                                          //color: ColorConstant.Grey01,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Merriweather Sans')),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text("${e.price},000đ",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            height: 0.9,
                                            fontSize: 15,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Merriweather Sans')),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorClinic() {

    final hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: SizedBox(
          height: 225,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hospitalDetailPageProvider.doctors.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(right: 15),
              height: 200,
              width: 155,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        height: 135,
                        width: 140,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset: const Offset(0, 20))
                          ],
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            onTap: () async{

                              final doctorDetailPageProvider = Provider.of<DoctorDetailPageProvider>(context,listen: false);

                              doctorDetailPageProvider.setDoctorDetail(hospitalDetailPageProvider.doctors[index]);

                              await doctorDetailPageProvider.getHospitalById(hospitalDetailPageProvider.doctors[index].hospitalId);

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DetailDoctor()));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                hospitalDetailPageProvider.doctors[index].image,
                                fit: BoxFit.fill,
                                width: 100,
                                height: 100,
                                //scale: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 130,
                            height: 20,
                            //color: Colors.grey,
                            child: Text(
                                "Dr. ${hospitalDetailPageProvider.doctors[index].firstName} ${hospitalDetailPageProvider.doctors[index].lastName}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14,
                                    //overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Merriweather Sans'))),
                        Row(
                          children: [
                            Expanded(
                              child: Text(hospitalDetailPageProvider.doctors[index].speciality,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      //overflow: TextOverflow.ellipsis,
                                      color: ColorConstant.Grey01,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Merriweather Sans')),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget timeWorking() {

    final hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          height: 190,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Thời gian làm việc',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                //padding: const EdgeInsets.symmetric(horizontal: 40),
                width: 500,
                height: 60,
                child: TabBar(
                  controller: _tabController,
                  tabs: [

                    ...numbers.map((e) {
                      if(e != 8) {
                        return Tab(
                          child: Text(
                            "T$e",
                            style: const TextStyle(fontSize: 19),
                          ),
                        );
                      } else {
                        return const Tab(
                            child: Text(
                            "CN",
                            style: TextStyle(fontSize: 16),
                          )
                        );
                      }
                    })
                  ],
                  indicatorWeight: 2,
                  //indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                  labelColor: Colors.blue,
                  unselectedLabelColor: ColorConstant.Grey01,
                ),
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  ...numbers.map((e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            ...hospitalDetailPageProvider.hospitalDetail!.workingDayDetails.map((day) {

                              if(day.date.isNotEmpty) {
                                if(e == num.parse(day.date)) {
                                  if(day.session == "MORNING") {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                      height: 60,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.BLue01,
                                        border: Border.all(color: ColorConstant.BLue05),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Text("Sáng",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.white,
                                                    height: 1,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Merriweather Sans')),
                                            Text("${day.startHour} - ${day.endHour}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.white,
                                                    height: 1,
                                                    letterSpacing: 0.05,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Merriweather Sans')),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  else {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                      height: 60,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.BLue02,
                                        border: Border.all(color: ColorConstant.BLue05),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children:[
                                            const Text("Chiều ",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.white,
                                                    height: 1,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Merriweather Sans')),
                                            Text("${day.startHour} - ${day.endHour}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.white,
                                                    height: 1,
                                                    letterSpacing: 0.05,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Merriweather Sans'))
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                }
                              }

                              return Container();

                            })
                          ],
                        ),
                      )),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoClinic() {

    final hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 10))
            ],
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 20.0),
            title: const Text(
              'Thông tin phòng khám',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_down),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children:[
                    ExpandableText(
                      hospitalDetailPageProvider.hospitalDetail!.information,
                      trimType: TrimType.lines,
                      trim: 8,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        height: 1.4,
                        fontSize: 16,
                      ),
                      readMoreText: 'Xem thêm',
                      readLessText: 'Thu gọn',
                      linkTextStyle:
                          const TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget certificationClinic() {

    final hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 10))
            ],
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 20.0),
            title: const Text(
              'Chứng nhận đi kèm',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_down),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "M.B.S.F.C.P.S. Cardio Specialist",
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                height: 1.4,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Icon(Icons.ac_unit)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "M.B.S.F.C.P.S. Cardio Specialist",
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                height: 1.4,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Icon(Icons.ac_unit)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "M.B.S.F.C.P.S. Cardio Specialist",
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                height: 1.4,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Icon(Icons.ac_unit)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bookingClinic(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Container(
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) {
                      return const FractionallySizedBox(
                        heightFactor: 0.93,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            child: OrderDetailClinic()),
                      );
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Đặt lịch khám",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                )),
          )),
    );
  }
}
