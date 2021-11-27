import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:togather/components/basic_card.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/constant.dart';
import 'package:togather/screen/recruit_question_manage_screen.dart';

class RecruitDetailApplicationConfirmationScreen extends StatefulWidget {
  const RecruitDetailApplicationConfirmationScreen({Key? key})
      : super(key: key);

  @override
  _RecruitDetailApplicationConfirmationScreenState createState() =>
      _RecruitDetailApplicationConfirmationScreenState();
}

class _RecruitDetailApplicationConfirmationScreenState
    extends State<RecruitDetailApplicationConfirmationScreen> {
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
                  "신청서 확인",
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
                  children: <Widget>[
                    TextWithIcon(
                      text: "질문 관리",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffaeaeae),
                      icon: Icons.arrow_forward_ios,
                      onPressed: () => pushNewScreen(context,
                          screen: const RecruitQuestionManageScreen(),
                          withNavBar: false),
                    ),
                    const Text(
                      "즐겨 찾기",
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Color(0xffaeaeae),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(80.0),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35.0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 19, 16, 19),
        child: GridView.count(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 1,
          children: List.generate(
            profileName.length,
            (index) => BasicCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("assets/images/recruit_profile" +
                      ((index < 3) ? (index + 1).toString() : "") +
                      ".png"),
                  Text(
                    profileName[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 11.0,
                      color: Color(0xff333333),
                    ),
                  ),
                  const Text(
                    "manzi@wouldyou.in",
                    style: TextStyle(
                      fontSize: 6.0,
                      color: Color(0xffaeaeae),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
