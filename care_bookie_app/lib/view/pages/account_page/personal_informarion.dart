import 'package:care_bookie_app/view_model/login_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../res/constants/colors.dart';
import '../../../utils/enums.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
              "Thông tin cá nhân",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              IconlyBroken.arrowLeft,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical, child: content()));
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 8.0),
      child: Column(
        children: [
          firstName(),
          lastName(),
          email(),
          phone(),
          gender(),
          birthDay(),
          address(),
          changePassword(),
          deleteAccount(),
        ],
      ),
    );
  }

  Widget avatar() {
    return Consumer<LoginPageViewModel>(
        builder: (context, value, child) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 135,
                    height: 135,
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
                    padding: const EdgeInsets.all(13),
                    child: Container(
                      width: 110,
                      height: 110,
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
                          value.userLogin.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget firstName() {
    return Consumer<LoginPageViewModel>(
      builder: (context, value, child) => Column(
        children: [
          avatar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tên",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.Grey01),
                  ),
                  Text(
                    value.userLogin.firstName,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      _textEditingController.text = value.userLogin.lastName;
                      return AlertDialog(
                        title: const Text("Sửa đổi tên"),
                        content: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            labelText: 'Tên',
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Hủy'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Lưu'),
                            onPressed: () {
                              setState(() {
                                value.userLogin.firstName =
                                    _textEditingController.text;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  IconlyBold.edit,
                  size: 30,
                  color: ColorConstant.Grey01,
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Color(0xFFF3EFEF),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }

  Widget lastName() {
    return Consumer<LoginPageViewModel>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tên",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.Grey01),
                  ),
                  Text(
                    value.userLogin.lastName,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      _textEditingController.text = value.userLogin.lastName;
                      return AlertDialog(
                        title: const Text("Sửa đổi tên"),
                        content: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            labelText: 'Tên',
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Hủy'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Lưu'),
                            onPressed: () {
                              setState(() {
                                value.userLogin.lastName =
                                    _textEditingController.text;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  IconlyBold.edit,
                  size: 30,
                  color: ColorConstant.Grey01,
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Color(0xFFF3EFEF),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }

  Widget email() {
    return Consumer<LoginPageViewModel>(
        builder: (context, value, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Địa chỉ Email",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.Grey01),
                        ),
                        Text(
                          value.userLogin.email,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            _textEditingController.text = value.userLogin.email;
                            return AlertDialog(
                              title: const Text("Thay đổi email"),
                              content: TextField(
                                controller: _textEditingController,
                                decoration: const InputDecoration(
                                  labelText: 'Tên',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Hủy'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Lưu'),
                                  onPressed: () {
                                    setState(() {
                                      value.userLogin.email =
                                          _textEditingController.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        IconlyBold.edit,
                        size: 30,
                        color: ColorConstant.Grey01,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Color(0xFFF3EFEF),
                  thickness: 1.5,
                ),
              ],
            ));
  }

  Widget phone() {
    return Consumer<LoginPageViewModel>(
        builder: (context, value, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Số điện thoại",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.Grey01),
                        ),
                        Text(
                          value.userLogin.phone,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            _textEditingController.text = value.userLogin.phone;
                            return AlertDialog(
                              title: const Text("Thay đổi số điện thoại"),
                              content: TextField(
                                controller: _textEditingController,
                                decoration: const InputDecoration(
                                  labelText: 'Tên',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Hủy'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Lưu'),
                                  onPressed: () {
                                    setState(() {
                                      value.userLogin.phone =
                                          _textEditingController.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        IconlyBold.edit,
                        size: 30,
                        color: ColorConstant.Grey01,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Color(0xFFF3EFEF),
                  thickness: 1.5,
                ),
              ],
            ));
  }

  Widget gender() {
    return Consumer<LoginPageViewModel>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Giới tính",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.Grey01,
                    ),
                  ),
                  Text(
                    value.userLogin.gender == Gender.male ? 'Nam' : 'Nữ',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Chọn giới tính"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text('Nam'),
                              leading: Radio<Gender>(
                                value: Gender.male,
                                groupValue: value.userLogin.gender == 1
                                    ? Gender.male
                                    : Gender.female,
                                onChanged: (Gender? newValue) {
                                  setState(() {
                                    value.userLogin.gender = newValue! as int;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Nữ'),
                              leading: Radio<Gender>(
                                value: Gender.female,
                                groupValue: value.userLogin.gender == 1
                                    ? Gender.male
                                    : Gender.female,
                                onChanged: (Gender? newValue) {
                                  setState(() {
                                    value.userLogin.gender = newValue! as int;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Hủy'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  IconlyBold.edit,
                  size: 30,
                  color: ColorConstant.Grey01,
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Color(0xFFF3EFEF),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }

  Widget birthDay() {
    return Consumer<LoginPageViewModel>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ngày sinh",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.Grey01),
                  ),
                  Text(
                    value.userLogin.birthDay,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      setState(() {
                        // Cập nhật giá trị ngày sinh
                        value.userLogin.birthDay =
                            DateFormat('dd/MM/yyyy').format(date);
                      });
                    },
                    currentTime: DateTime.now(),
                  );
                },
                icon: const Icon(
                  IconlyBold.edit,
                  size: 30,
                  color: ColorConstant.Grey01,
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Color(0xFFF3EFEF),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }

  Widget address() {
    return Consumer<LoginPageViewModel>(
        builder: (context, value, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Địa chỉ",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.Grey01),
                        ),
                        SizedBox(
                          width: 280,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            value.userLogin.address,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            _textEditingController.text =
                                value.userLogin.address;
                            return AlertDialog(
                              title: const Text("Thay đổi email"),
                              content: TextField(
                                controller: _textEditingController,
                                decoration: const InputDecoration(
                                  labelText: 'Tên',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Hủy'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Lưu'),
                                  onPressed: () {
                                    setState(() {
                                      value.userLogin.address =
                                          _textEditingController.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        IconlyBold.edit,
                        size: 30,
                        color: ColorConstant.Grey01,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Color(0xFFF3EFEF),
                  thickness: 1.5,
                ),
              ],
            ));
  }

  Widget changePassword() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Đổi mật khẩu",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }

  Widget deleteAccount() {
    return Container(
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Lưu chỉnh sửa",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }
}
