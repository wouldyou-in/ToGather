import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/screen/recruit_basic_question_manage_screen.dart';

class RecruitQuestionManageScreen extends StatefulWidget {
  const RecruitQuestionManageScreen({Key? key}) : super(key: key);

  @override
  _RecruitQuestionManageScreenState createState() =>
      _RecruitQuestionManageScreenState();
}

class _RecruitQuestionManageScreenState
    extends State<RecruitQuestionManageScreen> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffaeaeae)),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 2,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined,
                color: Theme.of(context).primaryColor),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "질문 관리",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff333333),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      "미리보기",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffaeaeae),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(80.0),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => pushNewScreen(context,
                  screen: const RecruitBasicQuestionManageScreen(),
                  withNavBar: false),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        '기본 질문 관리',
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14.0,
                        color: Color(0xff333333),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35.0),
                  topLeft: Radius.circular(35.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ],
              ),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "투개더의 팀원을 모집합니다.",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff333333),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          margin:
                              const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: const Color(0xfff6f6f6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            '창업 동아리 투개더는 더욱 성장하기 위해 가능성이 있는 제 3기 팀원을 모집합니다.',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin:
                              const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: const Color(0xfff6f6f6),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8.0, 16.0, 8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      "이름",
                                      style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14.0),
                                    ),
                                    Icon(
                                      Icons.layers,
                                      color: Color(0xff3333333),
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: const Text(
                                  "단답형 텍스트",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xffebe7ff),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            16.0, 8.0, 16.0, 8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: TextWithIcon(
                                          text: "단답형 질문",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).primaryColor,
                                          icon: Icons.expand_more,
                                        ),
                                      ),
                                      Image.asset(
                                          "assets/images/promotion_add_btn.png"),
                                      Image.asset(
                                          "assets/images/trash_icon.png"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "필수",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      FlutterSwitch(
                                        height: 30,
                                        width: 45,
                                        activeText: "",
                                        inactiveText: "",
                                        value: status,
                                        showOnOff: true,
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        onToggle: (v) {
                                          setState(() {
                                            status = v;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin:
                              const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: const Color(0xfff6f6f6),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8.0, 16.0, 8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      "이름",
                                      style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14.0),
                                    ),
                                    Icon(
                                      Icons.layers,
                                      color: Color(0xff3333333),
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: const Text(
                                  "단답형 텍스트",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xffebe7ff),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            16.0, 8.0, 16.0, 8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: TextWithIcon(
                                          text: "단답형 질문",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).primaryColor,
                                          icon: Icons.expand_more,
                                        ),
                                      ),
                                      Image.asset(
                                          "assets/images/promotion_add_btn.png"),
                                      Image.asset(
                                          "assets/images/trash_icon.png"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "필수",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      FlutterSwitch(
                                        height: 30,
                                        width: 45,
                                        activeText: "",
                                        inactiveText: "",
                                        value: status,
                                        showOnOff: true,
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        onToggle: (v) {
                                          setState(() {
                                            status = v;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin:
                              const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: const Color(0xfff6f6f6),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8.0, 16.0, 8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      "이름",
                                      style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14.0),
                                    ),
                                    Icon(
                                      Icons.layers,
                                      color: Color(0xff3333333),
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: const Text(
                                  "단답형 텍스트",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Color(0xffebe7ff),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            16.0, 8.0, 16.0, 8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: TextWithIcon(
                                          text: "단답형 질문",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).primaryColor,
                                          icon: Icons.expand_more,
                                        ),
                                      ),
                                      Image.asset(
                                          "assets/images/promotion_add_btn.png"),
                                      Image.asset(
                                          "assets/images/trash_icon.png"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "필수",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      FlutterSwitch(
                                        height: 30,
                                        width: 45,
                                        activeText: "",
                                        inactiveText: "",
                                        value: status,
                                        showOnOff: true,
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        onToggle: (v) {
                                          setState(() {
                                            status = v;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: const Center(
                            child: Text(
                              '적용하기',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
