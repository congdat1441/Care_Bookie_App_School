
import 'package:care_bookie_app/view_model/doctor_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../../res/constants/colors.dart';

class ReviewDoctor extends StatefulWidget {
  const ReviewDoctor({Key? key}) : super(key: key);

  @override
  State<ReviewDoctor> createState() => _ReviewDoctorState();
}

class _ReviewDoctorState extends State<ReviewDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.BackGroundColor,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          backgroundColor: ColorConstant.BackGroundColor,
          title: const Center(
            child: Text(
              "Đánh giá bác sỹ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 19,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              IconlyBroken.arrowLeft,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottomOpacity: 0,
          elevation: 0,
        ),
        body: customBody());
  }

  Widget customBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
        child: Column(
          children: [starAndVoted(), commentsDoctor()],
        ),
      ),
    );
  }

  Widget starAndVoted() {

    final doctorDetailPageViewModel = Provider.of<DoctorDetailPageViewModel>(context,listen: false);

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${doctorDetailPageViewModel.doctorDetail!.star}",
                    style: const TextStyle(
                        fontSize: 45,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: ColorConstant.BLue03),
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: doctorDetailPageViewModel.doctorDetail!.star.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: VerticalDivider(
                  thickness: 2,
                  indent: 9,
                  color: ColorConstant.Grey00.withOpacity(
                      0.5), // Màu sắc của divider
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${doctorDetailPageViewModel.comments.length}",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: ColorConstant.BLue03),
                  ),
                  const Text(
                    "VOTED",
                    style: TextStyle(
                        fontSize: 25,
                        height: 0.9,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: ColorConstant.Grey02),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.1,
                              blurRadius: 2,
                              offset: const Offset(0, 5))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 5))
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                              doctorDetailPageViewModel.doctorDetail!.image,
                              width: 60, height: 60, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 2,
          color: ColorConstant.Grey00.withOpacity(0.5),
        )
      ],
    );
  }

  Widget commentsDoctor() {

    final doctorDetailPageViewModel = Provider.of<DoctorDetailPageViewModel>(context,listen: false);


    return Column(
      children: [
        ...doctorDetailPageViewModel.comments.map((comment) => Container(
              margin: const EdgeInsets.fromLTRB(0, 15, 5, 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 0.1,
                                          blurRadius: 2,
                                          offset: const Offset(0, 5))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0, 5))
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.network(
                                          comment.image,
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment.fullName,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      height: 0.8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: comment.star.toDouble(),
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        comment.
                        dateTime.substring(0,10),
                        style: const TextStyle(
                            color: ColorConstant.Grey01,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 70, top: 20),
                    width: 280,
                    child: Text(
                      comment.content,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 1.4,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
