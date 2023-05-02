import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../res/constants/colors.dart';
import '../review_page/review_clinic_page/add_review_clinic.dart';
import '../review_page/review_doctor_page/add_review_doctor.dart';

class HistoryDetailInvoice extends StatefulWidget {
  const HistoryDetailInvoice({Key? key}) : super(key: key);

  @override
  State<HistoryDetailInvoice> createState() => _HistoryDetailInvoiceState();
}

class _HistoryDetailInvoiceState extends State<HistoryDetailInvoice> {
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
          backgroundColor: Colors.grey,
          title: const Center(
            child: Text(
              "Thông tin đặt lịch",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              IconlyBroken.arrowLeft,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          shadowColor: Colors.white,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                infoOrderDetail(),
                symptom(),
                noteFromDoctor(),
                contentNoteDrug(),
                price(),
                const SizedBox(
                  height: 30,
                )
              ],
            )),
        bottomNavigationBar: bottomNavigatorBar());
  }

  Widget infoOrderDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Trung tâm khám bệnh",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("The CIS Free Clinic",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Bác sỹ điều trị",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Nguyễn Văn A",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Thời gian",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 140,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("15 Tháng 5, 2023 || Sáng 8:00 - 12:00 AM",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Bệnh nhân điều trị",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Nguyễn Văn B",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Tuổi",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("10",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Giới tính",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Nam",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Chia sẻ lịch sử",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Có",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
        ],
      ),
    );
  }

  Widget symptom() {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("Mô tả triệu chứng",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: double.maxFinite,
          decoration: BoxDecoration(
            //color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border:
              Border.all(color: CupertinoColors.systemGrey3, width: 0.5)),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eleifend risus a ex ultricies blandit. Mauris venenatis nunc ut est dapibus, ac suscipit eros bibendum. Integer sagittis, enim vel convallis hendrerit, mauris sapien tristique mi, sed bibendum massa metus eu dolor. Sed vestibulum tellus quis ex eleifend auctor. Sed sed velit eget enim tristique ultricies at at massa. In lacinia magna nec arcu dignissim, eu laoreet leo tincidunt. Nulla lobortis nunc at est facilisis faucibus. Sed eget semper enim. Vestibulum id urna nec nulla porttitor accumsan vel quis nisi. Quisque congue ligula at mauris suscipit, ut pellentesque ex iaculis. Maecenas vestibulum, magna vel tempor varius, tortor ex dapibus ipsum, nec bibendum sapien diam auctor metus. In eget mi ex. Nulla varius, massa ac feugiat blandit, dolor libero feugiat magna, ac scelerisque sapien turpis eu felis. Donec pulvinar, arcu eu rutrum malesuada, sapien lectus cursus eros, eget placerat nisl arcu vitae lectus.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    height: 1.4,
                    fontSize: 17,
                  )),
            ),
          ),
        ),
        const Divider(
          height: 30,
          color: Colors.grey,
          thickness: 0.25,
        ),
      ],
    );
  }

  Widget price() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("Dịch vụ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text("Khám lợi",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
            ),
            SizedBox(
              width: 200,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("150,000đ",
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.amber,
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text("Trám răng",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
            ),
            SizedBox(
              width: 200,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("150,000đ",
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.amber,
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("Chi phí dự kiến",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
            ),
            SizedBox(
              width: 200,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("300,000đ",
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.amber,
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis)),
              ),
            ),
          ],
        ),
        const Divider(
          height: 30,
          color: Colors.grey,
          thickness: 0.25,
        ),
      ],
    );
  }

  Widget noteFromDoctor() {
    return Column(
      children: [
        const Divider(
          height: 50,
          color: Colors.transparent,
          thickness: 0.25,
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("Dặn dò từ Bác sỹ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: double.maxFinite,
          decoration: BoxDecoration(
            //color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border:
              Border.all(color: CupertinoColors.systemGrey3, width: 0.5)),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eleifend risus a ex ultricies blandit. Mauris venenatis nunc ut est dapibus, ac suscipit eros bibendum. Integer sagittis, enim vel convallis hendrerit, mauris sapien tristique mi, sed bibendum massa metus eu dolor. Sed vestibulum tellus quis ex eleifend auctor. Sed sed velit eget enim tristique ultricies at at massa. In lacinia magna nec arcu dignissim, eu laoreet leo tincidunt. Nulla lobortis nunc at est facilisis faucibus. Sed eget semper enim. Vestibulum id urna nec nulla porttitor accumsan vel quis nisi. Quisque congue ligula at mauris suscipit, ut pellentesque ex iaculis. Maecenas vestibulum, magna vel tempor varius, tortor ex dapibus ipsum, nec bibendum sapien diam auctor metus. In eget mi ex. Nulla varius, massa ac feugiat blandit, dolor libero feugiat magna, ac scelerisque sapien turpis eu felis. Donec pulvinar, arcu eu rutrum malesuada, sapien lectus cursus eros, eget placerat nisl arcu vitae lectus.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    height: 1.4,
                    fontSize: 17,
                  )),
            ),
          ),
        ),
        const Divider(
          height: 30,
          color: Colors.transparent,
          thickness: 0.25,
        ),
      ],
    );
  }

  Widget contentNoteDrug() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1.0, color: ColorConstant.Grey01)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Đơn thuốc",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  overflow: TextOverflow.visible)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Thuốc A",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("10 viên",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Thuốc A",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 180,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("20 viên",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Thuốc C",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("10 viên",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Thuốc A",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 180,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("20 viên",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget cancelBook(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 10, 15),
          height: 50,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey)),
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Lý do hủy lịch'),
                    content: const TextField(
                      decoration:
                      InputDecoration(hintText: 'Nhập lý do hủy lịch'),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Hủy'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Gửi'),
                        onPressed: () {
                          // Xử lý lưu thông tin lý do hủy lịch tại đây
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Hủy Lịch",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.delete,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomNavigatorBar() {
    return Container(
      height: 130,
      color: Colors.white,
      child: Column(
        children: [
          notifyReview(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reviewDoctor(),
              reviewClinic()
            ],
          )
        ],
      ),
    );
  }

  Widget notifyReview() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 50,
              width: 320,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    "Vui lòng thêm nhận xét của bạn về bác sỹ và dịch vụ phòng khám",
                    style: TextStyle(fontSize: 17, color: Colors.grey)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget reviewDoctor() {
    return Container(

      width: 160,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddReviewDoctor()));
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,

          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Đánh giá",
                  style: TextStyle(
                      fontSize: 15, color: Colors.amber, fontWeight: FontWeight.w600),
                ),
                Text(
                  "bác sỹ",
                  style: TextStyle(
                      fontSize: 16, color: Colors.amber, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Icon(
              IconlyBold.editSquare,
              color: Colors.amber,
              size: 25,
            )
          ],
        ),
      ),
    );
  }

  Widget reviewClinic() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10,0,0,0),
      width: 160,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddReviewClinic()));
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,

          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Đánh giá",
                  style: TextStyle(
                      fontSize: 15, color: Colors.amber, fontWeight: FontWeight.w600),
                ),
                Text(
                  "phòng khám",
                  style: TextStyle(
                      fontSize: 16, color: Colors.amber, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Icon(
              IconlyBold.editSquare,
              color: Colors.amber,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
