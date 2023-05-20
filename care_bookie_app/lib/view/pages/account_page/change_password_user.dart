import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../res/constants/colors.dart';
import '../login_signup_page/reset_password.dart';

class ChangePasswordUser extends StatefulWidget {
  const ChangePasswordUser({Key? key}) : super(key: key);

  @override
  State<ChangePasswordUser> createState() => _ChangePasswordUserState();
}

class _ChangePasswordUserState extends State<ChangePasswordUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.BackGroundColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.BackGroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconlyLight.arrowLeft,
              color: Colors.black,
              size: 30,
            ),
          ),
          title: const Text('Đổi mật khẩu cá nhân',
              style: TextStyle(
                  fontSize: 20,
                  //textBaseline: TextBaseline.alphabetic,
                  color: Colors.black,
                  fontFamily: 'Montserrat')),
        ),
        body: customScrollViewBody());
  }

  Widget sliverAppBar() {
    return SliverAppBar(
      title: const Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
          "Đổi mật khẩu ",
          style: TextStyle(
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
      // actions: [
      //   hospitalDetailPageViewModel.isFavoritePage
      //       ? const SizedBox()
      //       : IconButton(
      //     onPressed: () async {
      //       setState(() {});
      //
      //       hospitalDetailPageViewModel
      //           .setIsFavorite(!hospitalDetailPageViewModel.isFavorite);
      //
      //       await hospitalDetailPageViewModel.changeFavoriteHospital(
      //           hospitalDetailPageViewModel.hospitalDetail!.id,
      //           loginPageViewModel.userLogin.id);
      //
      //       favoritePageViewModel.resetListHospitalFavorite();
      //
      //       await favoritePageViewModel.getAllHospitalFavoriteByUserId(
      //           loginPageViewModel.userLogin.id);
      //     },
      //     icon: hospitalDetailPageViewModel.isFavorite
      //         ? const Icon(
      //       IconlyBold.heart,
      //       size: 30,
      //       color: Colors.redAccent,
      //     )
      //         : const Icon(
      //       IconlyLight.heart,
      //       size: 30,
      //     ),
      //   ),
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       IconlyLight.upload,
      //       size: 30,
      //     ),
      //   ),
      // ],
      expandedHeight: 350,
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
        ),
      ),
    );
  }

  Widget customScrollViewBody() {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                      const InputDecoration(labelText: 'Mật khẩu cũ'),
                    ),
                    TextFormField(
                      decoration:
                      const InputDecoration(labelText: 'Mật khẩu mới'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Nhập lại mật khẩu mới',
                          hintStyle: TextStyle(
                              fontSize: 15,
                              //textBaseline: TextBaseline.alphabetic,
                              color: Colors.blueAccent,
                              fontFamily: 'Montserrat')),
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(width: 15),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPassword()));
                        },
                        child: const Text('Thay đổi mật khẩu',
                            style: TextStyle(
                                fontSize: 18,
                                //textBaseline: TextBaseline.alphabetic,
                                color: Colors.white,
                                fontFamily: 'Montserrat')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
