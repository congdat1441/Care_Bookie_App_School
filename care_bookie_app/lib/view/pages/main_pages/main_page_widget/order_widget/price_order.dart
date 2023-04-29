import 'package:flutter/material.dart';

class ChiPhiDuKien extends StatefulWidget {
  const ChiPhiDuKien({Key? key}) : super(key: key);

  @override
  State<ChiPhiDuKien> createState() => _ChiPhiDuKienState();
}

class _ChiPhiDuKienState extends State<ChiPhiDuKien> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
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
    );
  }
}
