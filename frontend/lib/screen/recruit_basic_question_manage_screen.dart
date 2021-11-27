import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:togather/constant.dart';

class RecruitBasicQuestionManageScreen extends StatefulWidget {
  const RecruitBasicQuestionManageScreen({Key? key}) : super(key: key);

  @override
  _RecruitBasicQuestionManageScreenState createState() =>
      _RecruitBasicQuestionManageScreenState();
}

class _RecruitBasicQuestionManageScreenState
    extends State<RecruitBasicQuestionManageScreen> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffaeaeae)),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "기본 질문",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0),
                  ),
                  FlutterSwitch(
                    value: status,
                    showOnOff: true,
                    activeColor: Theme.of(context).primaryColor,
                    onToggle: (v) {
                      setState(() {
                        status = v;
                      });
                    },
                  ),
                ],
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
                      const Center(
                        child: Text(
                          "투개더의 팀원을 모집합니다.",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Center(
                        child: Text(
                          "신청서에 작성하실 기본 항목을 선택해주세요",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffaeaeae),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        questions[0].title,
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffaeaeae),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 5,
                        childAspectRatio: 3 / 1,
                        children: List.generate(
                          questions[0].items.length,
                          (index) => InkWell(
                            onTap: () {
                              var tmp = questions[0].selected[index];
                              setState(() {
                                questions[0].selected[index] = !tmp;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: questions[0].selected[index]
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xffaeaeae),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 12.0,
                                    height: 12.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: questions[0].selected[index]
                                          ? Theme.of(context).primaryColor
                                          : const Color(0xffaeaeae),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    questions[0].items[index],
                                    style: TextStyle(
                                      color: questions[0].selected[index]
                                          ? Theme.of(context).primaryColor
                                          : const Color(0xffaeaeae),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        questions[1].title,
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffaeaeae),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 5,
                        childAspectRatio: 3 / 1,
                        children: List.generate(
                          questions[1].items.length,
                          (index) => InkWell(
                            onTap: () {
                              var tmp = questions[1].selected[index];
                              setState(() {
                                questions[1].selected[index] = !tmp;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: questions[1].selected[index]
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xffaeaeae),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 12.0,
                                    height: 12.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: questions[1].selected[index]
                                          ? Theme.of(context).primaryColor
                                          : const Color(0xffaeaeae),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    questions[1].items[index],
                                    style: TextStyle(
                                      color: questions[1].selected[index]
                                          ? Theme.of(context).primaryColor
                                          : const Color(0xffaeaeae),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        questions[2].title,
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffaeaeae),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 5,
                        childAspectRatio: 3 / 1,
                        children: List.generate(
                          questions[2].items.length,
                          (index) => InkWell(
                            onTap: () {
                              var tmp = questions[2].selected[index];
                              setState(() {
                                questions[2].selected[index] = !tmp;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: questions[2].selected[index]
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xffaeaeae),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 12.0,
                                    height: 12.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: questions[2].selected[index]
                                          ? Theme.of(context).primaryColor
                                          : const Color(0xffaeaeae),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    questions[2].items[index],
                                    style: TextStyle(
                                      color: questions[2].selected[index]
                                          ? Theme.of(context).primaryColor
                                          : const Color(0xffaeaeae),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
