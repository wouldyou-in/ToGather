import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/constant.dart';
import 'package:togather/screen/promotion_manage_screen.dart';

class PromotionStatusScreen extends StatefulWidget {
  const PromotionStatusScreen({Key? key}) : super(key: key);

  @override
  _PromotionStatusScreenState createState() => _PromotionStatusScreenState();
}

class _PromotionStatusScreenState extends State<PromotionStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffaeaeae)),
          onPressed: () {
            Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "홍보 현황",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextWithIcon(
                text: "홍보 관리",
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                color: const Color(0xffaeaeae),
                icon: Icons.arrow_forward_ios,
                onPressed: () => pushNewScreen(
                  context,
                  screen: const PromotionManageScreen(),
                  withNavBar: false,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "전체 홍보 현황",
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
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("assets/images/promo_tip_icon.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "투개더's tip",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Color(0xff8a51cb),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [defaultShadow],
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Center(
                          child: Text(
                            '투개더 님이 궁금해 할 홍보를 가져왔어요!',
                            style: TextStyle(
                              color: Color(0xff7938c3),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
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
                              "포스터 홍보 현황",
                              style: TextStyle(
                                color: Color(0xff4d4d4d),
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Image.asset("assets/images/poster_promo_icon.png"),
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
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
                              "페이지 홍보 현황",
                              style: TextStyle(
                                color: Color(0xff4d4d4d),
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Image.asset("assets/images/page_promo_icon.png"),
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
                            color: const Color(0xffebe7ff),
                            // Bind data source
                            dataSource: <SalesData>[
                              SalesData('3일', 25),
                              SalesData('10일', 38),
                              SalesData('17일', 14),
                              SalesData('24일', 24),
                              SalesData('31일', 20)
                            ],
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales)
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("assets/images/promo_tip_icon.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "투개더's tip",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Color(0xff8a51cb),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [defaultShadow],
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Center(
                          child: Text(
                            '최근 접속량 하락 중! 새페이지를 제작하는건 어떨까요?',
                            style: TextStyle(
                              color: Color(0xff7938c3),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
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
                              "SNS 홍보 현황",
                              style: TextStyle(
                                color: Color(0xff4d4d4d),
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Image.asset("assets/images/sns_promo_icon.png"),
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
                      height: 40.0,
                    ),
                    const Text(
                      "콘텐츠 도달",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 13.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircularPercentIndicator(
                          radius: 120.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: 0.625,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "62.5%",
                                style: TextStyle(
                                  color: Color(0xffffca07),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "지난주 대비",
                                style: TextStyle(
                                  color: Color(0xff4d4d4d),
                                  fontSize: 10.0,
                                ),
                              ),
                              Text(
                                "30% 하락",
                                style: TextStyle(
                                  color: Color(0xff4d4d4d),
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: const Color(0xffffca07),
                          backgroundColor: const Color(0xfff6f6f6),
                        ),
                        CircularPercentIndicator(
                          radius: 120.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: 0.875,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "87.5%",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                "지난주 대비",
                                style: TextStyle(
                                  color: Color(0xff4d4d4d),
                                  fontSize: 10.0,
                                ),
                              ),
                              const Text(
                                "30% 하락",
                                style: TextStyle(
                                  color: Color(0xff4d4d4d),
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Theme.of(context).primaryColor,
                          backgroundColor: const Color(0xfff6f6f6),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("assets/images/promo_tip_icon.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "투개더's tip",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Color(0xff8a51cb),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [defaultShadow],
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Center(
                          child: Text(
                            '스토리 도달룰을 높이려면 카피를 수정해 보아요!',
                            style: TextStyle(
                              color: Color(0xff7938c3),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
