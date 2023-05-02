import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../res/constants/colors.dart';

class ScheduleDetailPending extends StatefulWidget {
  const ScheduleDetailPending({Key? key}) : super(key: key);

  @override
  State<ScheduleDetailPending> createState() => _ScheduleDetailPendingState();
}

class _ScheduleDetailPendingState extends State<ScheduleDetailPending> {
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
          backgroundColor: Colors.orangeAccent,
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
                price(),
                cancelBook(),
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

  Widget cancelBook() {
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
      height: 120,
      color: Colors.white,
      child: Column(
        children: [notifyPending(), pending()],
      ),
    );
  }

  Widget notifyPending() {
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
              child: Text(
                  "Thông tin đặt lịch của bạn đã hoàn tất, vui lòng đợi phòng khám xác nhận phản hồi",
                  style: TextStyle(fontSize: 17, color: Colors.grey)),
            ),
          )
        ],
      ),
    );
  }

  Widget pending() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Container(
          width: double.maxFinite,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.orange),
              borderRadius: BorderRadius.circular(20)),
          child: const Center(
            child: Text(
              "Chờ Xác Nhận",
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.orange,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
