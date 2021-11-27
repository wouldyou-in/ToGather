import 'package:flutter/material.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/constant.dart';

class PromotionManageScreen extends StatefulWidget {
  const PromotionManageScreen({Key? key}) : super(key: key);

  @override
  _PromotionManageScreenState createState() => _PromotionManageScreenState();
}

class _PromotionManageScreenState extends State<PromotionManageScreen> {
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
                  "홍보 관리",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff333333),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      TextWithIcon(
                        text: "포스터 홍보 관리",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffaeaeae),
                        icon: Icons.arrow_forward_ios,
                      ),
                      Text(
                        "즐겨 찾기",
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Color(0xffaeaeae),
                        ),
                      ),
                    ],
                  ),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [defaultShadow],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Center(
                  child: Text(
                    '포스터 홍보 관리',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [defaultShadow],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Center(
                  child: Text(
                    '페이지 홍보 관리',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [defaultShadow],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Center(
                  child: Text(
                    '자주 묻는 질문 관리',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [defaultShadow],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Center(
                  child: Text(
                    '홍보 SNS 관리',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [defaultShadow],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Center(
                  child: Text(
                    '신청서 확인',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
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
