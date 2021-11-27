import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:togather/components/basic_card.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/constant.dart';
import 'package:togather/domain/nav_bar_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: scaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 19, 16, 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 25.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Get.find<NavBarController>().switchStatus();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Image.asset("assets/images/icon.png"),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "투",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                  color: Theme.of(context).primaryColor)),
                          const TextSpan(
                              text: "개더",
                              style: TextStyle(
                                color: Color(0xff1a1a1a),
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Color(0xffebe7ff),
                            ),
                          ),
                        ),
                        height: 60,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: const Color(0xfff6f6f6),
                                border: Border.all(
                                  color: const Color(0xffebe7ff),
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  clubList[index],
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: clubList[index] + " ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                  const TextSpan(
                                      text: "동아리방",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 16.0,
                                      )),
                                ],
                              ),
                            ),
                          ],
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.pending, color: Theme.of(context).primaryColor),
          onPressed: () {
            Get.find<NavBarController>().switchStatus();
            scaffoldKey.currentState!.openDrawer();
          },
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
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "투개더 ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30.0,
                              color: Theme.of(context).primaryColor)),
                      const TextSpan(
                          text: "동방에",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 30.0,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 9.0),
                const Text(
                  "오신걸 환영합니다",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 35.0),
                BasicCard(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWithIcon(
                              text: "진행 중인 홍보",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4d4d4d),
                              icon: Icons.arrow_forward_ios,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xffaeaeae),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const Text(
                          "11월 14일 기준",
                          style: TextStyle(
                            color: Color(0xffaeaeae),
                            fontSize: 13.0,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 260.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mockPromo.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200.0,
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffebe7ff),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          "assets/images/poster.png",
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 7,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xfff6f6f6),
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 8, 16, 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Image.asset(
                                                            "assets/images/poster_promo_icon.png"),
                                                        const SizedBox(
                                                            width: 5),
                                                        Text(
                                                          "포스터 홍보",
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontSize: 10.0,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                      "제 3기 투개터의 팀원을 모집합니다",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff4d4d4d),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
                const SizedBox(
                  height: 15,
                ),
                BasicCard(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "신청서 확인",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff4d4d4d),
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Image.asset(
                                    "assets/images/application_confirmation_logo.png"),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xffaeaeae),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 80.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 30.0,
                                width: 300.0,
                                height: 40.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffebe7ff)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 15.0,
                                width: 300.0,
                                height: 40.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffebe7ff)
                                        .withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                height: 40.0,
                                width: 300.0,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffebe7ff),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      const Text(
                                        "안녕하세요.공고 보고 연락드립니다:)...",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Color(0xff4d4d4d),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BasicCard(
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
                                const Text(
                                  "홍보 현황",
                                  style: TextStyle(
                                    color: Color(0xff4d4d4d),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Image.asset(
                                    "assets/images/promo_status_icon.png"),
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
                          height: 15,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 3),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 3),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 3),
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
                          height: 15,
                        ),
                        SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <ChartSeries>[
                            StackedColumnSeries<ChartData, String>(
                                color: const Color(0xffffca07),
                                dataSource: chartData,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y1),
                            StackedColumnSeries<ChartData, String>(
                                color: const Color(0xffffebab),
                                dataSource: chartData,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y2),
                            StackedColumnSeries<ChartData, String>(
                                color: Color(0xffebe7ff),
                                dataSource: chartData,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y3),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(width: 5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xff7938c3),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "전체",
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Color(0xffaeaeae),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xffebe7ff),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "SNS",
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Color(0xffaeaeae),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xffffebab),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "포스터",
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Color(0xffaeaeae),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xffffca07),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "페이지",
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Color(0xffaeaeae),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Image.asset(
                                        "assets/images/poster_promo_icon.png"),
                                    const SizedBox(width: 5),
                                    Text(
                                      "포스터 홍보",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
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
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
