import 'dart:convert';

import 'package:care_bookie_app/view/pages/login_signup_page/reset_password.dart';
import 'package:care_bookie_app/view/pages/login_signup_page/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../layouts_page/navbar_layout.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;
  bool isLoading = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
      false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              customTopScreen(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 260,
                child: Container(
                  //color: Colors.greenAccent,
                  width: 380,
                  height: 580,
                  padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                  child: Column(
                    children: [
                      loginAndSignupTitle(),
                      addPhoneNumber(),
                      addPassword(),
                      forgotPassword(),
                      loginButton()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget customTopScreen() {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
              top: -240,
              right: 10,
              child: Container(
                width: 500,
                height: 500,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF0675D6)),
              )),
          Positioned(
              top: -280,
              right: 70,
              child: Container(
                width: 500,
                height: 500,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF0768D6)),
              )),
          Positioned(
              top: -325,
              right: 135,
              child: Container(
                width: 500,
                height: 500,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF005DC8)),
              )),
          Positioned(
              top: -310,
              right: 200,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF0057B9)),
              )),
        ],
      ),
    );
  }
  Widget loginAndSignupTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 45,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2F3948),
            ),
          ),
          const Text(
            "/ ",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2F3948),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Signup()));
            },
            child: const Text(
              "Sign up",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Color(0xFF168AD8),
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addPhoneNumber() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
      width: 330,
      child: TextFormField(
          controller: phoneController,
          style: const TextStyle(color: Colors.black),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Add your phone number";
            } else if (value.length <= 5) {
              return "Not enough required character";
            }
            return null;
          },
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                )),
            label: Text("Phone number", style: TextStyle(color: Colors.black)),
            hintText: "Please add your phone number",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 94, 92, 88),
            ),
            prefixIcon: SizedBox(
              width: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  IconlyLight.call,
                  color: Colors.black,
                ),
              ),
            ),
          )),
    );
  }

  Widget addPassword() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
      width: 330,
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        focusNode: textFieldFocusNode,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              )),
          label: const Text("Password", style: TextStyle(color: Colors.black)),
          hintText: "Password",
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 94, 92, 88),
          ),
          prefixIcon: const SizedBox(
            width: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                IconlyLight.lock,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          suffixIcon: SizedBox(
            width: 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: _toggleObscured,
                child: Icon(
                  _obscured
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
      child: TextButton(
        child: const Text(
          "Forgot password",
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF168AD8)),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const ResetPassword()));
        },
      ),
    );
  }

  Widget loginButton(){
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const NavbarLayout(
                  index: 0,
                )));
      },
      child: Container(
        width: 330,
        padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF431BFC),
                      Color(0xFF0675D6),
                    ]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF0675D6),
                    offset: Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius:
                    0.1, // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: isLoading ? null : () => _handleLogin(context),
                child: isLoading ? const CircularProgressIndicator() : const Text('Đăng nhập'),
              ),
            ),
            // RecentlyViewed()
          ],
        ),
      ),
    );
  }
  Future<http.Response> login(String phone, String password) async {
    final url = 'https://example.com/login';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'phone': phone,
        'password': password,
      },
    );
    return response;
  }

  void _handleLogin(BuildContext context) async {
    final phone = phoneController.text;
    final password = passwordController.text;

    final response = await login(phone, password);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final userId = responseBody['userId'];
      final userName = responseBody['userName'];
      print('Logged in successfully. User ID: $userId, User name: $userName');
    } else {
      final errorMessage = 'Login failed. Error code: ${response.statusCode}';
      print(errorMessage);
    }
  }
}

