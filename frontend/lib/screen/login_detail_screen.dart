import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togather/domain/nav_bar_controller.dart';
import 'package:togather/screen/navigation_layout_screen.dart';

class LoginDetailScreen extends StatefulWidget {
  const LoginDetailScreen({Key? key}) : super(key: key);

  @override
  _LoginDetailScreenState createState() => _LoginDetailScreenState();
}

class _LoginDetailScreenState extends State<LoginDetailScreen> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffaeaeae)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "인증번호",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  "입력해 주세요.",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "인증번호를 입력하세요.",
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.put(NavBarController());
                  Get.to(() => const NavigationLayoutScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Center(
                    child: Text(
                      '입장하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
