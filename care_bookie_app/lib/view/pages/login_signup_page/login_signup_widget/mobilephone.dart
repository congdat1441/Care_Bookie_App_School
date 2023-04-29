import 'package:flutter/material.dart';

class MobilePhone extends StatefulWidget {
  const MobilePhone({Key? key}) : super(key: key);

  @override
  State<MobilePhone> createState() => _MobilePhoneState();
}

class _MobilePhoneState extends State<MobilePhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
      // color: Colors.orange,
      width: 330,
      child: const TextField(
        // textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black),
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "add your account";
          //   } else if (value.length <= 5) {
          //     return "account is not enough length characters";
          //   }
          //   return null;
          // },
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                )),
            label: Text("Phone number",
                style:
                TextStyle(color: Colors.black,
                fontFamily: 'Poppins')),
            hintText: "",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 94, 92, 88),
            ),
            prefixIcon: SizedBox(
              width: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
