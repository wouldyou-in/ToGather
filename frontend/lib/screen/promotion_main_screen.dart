import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:togather/components/basic_card.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/constant.dart';
import 'package:togather/screen/promotion_detail_screen.dart';
import 'package:togather/screen/promotion_status_screen.dart';

class PromotionMainScreen extends StatefulWidget {
  const PromotionMainScreen({Key? key}) : super(key: key);

  @override
  _PromotionMainScreenState createState() => _PromotionMainScreenState();
}

class _PromotionMainScreenState extends State<PromotionMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffaeaeae)),
          onPressed: () {},
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined,
                color: Theme.of(context).primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 19, 16, 19),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "진행 중인 홍보",
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/promotion_add_btn.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWithIcon(
                  text: '홍보 현황',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffaeaeae),
                  icon: Icons.arrow_forward_ios,
                  onPressed: () => pushNewScreen(
                    context,
                    withNavBar: false,
                    screen: const PromotionStatusScreen(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mockPromotion.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => pushNewScreen(
                          context,
                          withNavBar: false,
                          screen: const PromotionDetailScreen(),
                        ),
                        child: BasicCard(
                          child: SizedBox(
                            height: 360,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 24, 16, 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Image.asset("assets/images/" +
                                                mockPromotion[index] +
                                                "_promo_icon.png"),
                                            const SizedBox(width: 5),
                                            Text(
                                              (mockPromotion[index] == "poster"
                                                      ? "포스터"
                                                      : "페이지") +
                                                  " 홍보",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "제 3기 투개더팀의 팀원을 모집합니다.",
                                            style: TextStyle(
                                                color: Color(0xff333333),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "투개더의 3기 팀원 모집 홍보입니다.",
                                            style: TextStyle(
                                                color: Color(0xff4d4d4d),
                                                fontSize: 13.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffffebab),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35.0),
                                        bottomRight: Radius.circular(35.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/poster2.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
