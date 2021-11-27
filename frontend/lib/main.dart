import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togather/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToGather',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xff7042BC),
        backgroundColor: const Color(0xffF6F6F6),
        fontFamily: 'one-mobile',
      ),
      home: const LoginScreen(),
    );
  }
}
