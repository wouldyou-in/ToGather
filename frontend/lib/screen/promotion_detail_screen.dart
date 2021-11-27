import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/constant.dart';

class PromotionDetailScreen extends StatefulWidget {
  const PromotionDetailScreen({Key? key}) : super(key: key);

  @override
  _PromotionDetailScreenState createState() => _PromotionDetailScreenState();
}

class _PromotionDetailScreenState extends State<PromotionDetailScreen> {
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
                  "포스터 홍보",
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                              "assets/images/" + "poster" + "_promo_icon.png"),
                          const SizedBox(width: 5),
                          Text(
                            "포스터" + " 홍보",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          size: 20.0,
                          color: Color(0xffaeaeae),
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
                      style:
                          TextStyle(color: Color(0xff4d4d4d), fontSize: 13.0),
                    ),
                  ),
                ],
              ),
            ),
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          const Text(
                            "홍보 현황",
                            style: TextStyle(
                              color: Color(0xff4d4d4d),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset("assets/images/promo_status_icon.png"),
                        ],
                      ),
                      const TextWithIcon(
                        text: "자세히 보기",
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffaeaeae),
                        icon: Icons.arrow_forward_ios,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            size: 14.0,
                            color: Color(0xffaeaeae),
                          ),
                          Text(
                            "11월 14일",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 14.0,
                            color: Color(0xffaeaeae),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffebe7ff),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              "일간",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff808080),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              "주간",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffebe7ff),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              "월간",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff808080),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.share,
                            size: 14.0,
                            color: Color(0xffaeaeae),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.refresh,
                            size: 14.0,
                            color: Color(0xffaeaeae),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SfCartesianChart(
                      // Initialize category axis
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        AreaSeries<SalesData, String>(
                            borderColor: Theme.of(context).primaryColor,
                            borderWidth: 2,
                            color: const Color(0xffffebab),
                            // Bind data source
                            dataSource: <SalesData>[
                              SalesData('3일', 35),
                              SalesData('10일', 28),
                              SalesData('17일', 34),
                              SalesData('24일', 32),
                              SalesData('31일', 40)
                            ],
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales)
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
