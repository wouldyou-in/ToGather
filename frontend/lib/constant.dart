import 'package:flutter/material.dart';

import 'domain/question.dart';

BoxShadow defaultShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 2,
  offset: const Offset(0, 3), // changes position of shadow
);

const API_ADDRESS = "test.wouldyou.in";

final List<ChartData> chartData = [
  ChartData('7일', 12, 10, 14),
  ChartData('8일', 14, 11, 18),
  ChartData('9일', 16, 10, 15),
  ChartData('10일', 12, 10, 14),
  ChartData('11일', 14, 11, 18),
  ChartData('12일', 16, 10, 15),
  ChartData('7일', 12, 10, 14),
  ChartData('13일', 14, 11, 18),
  ChartData('14일', 16, 10, 15),
];
List mockPromo = [
  1,
  2,
  3,
  4,
  5,
  6,
];
List mockPromotion = [
  "poster",
  "page",
  "poster",
  "page",
  "poster",
  "page",
];
List clubList = ["투개더", "유퀴즈", "원티드"];

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3);
  final String x;
  final int y1;
  final int y2;
  final int y3;
}

List<String> categoriesItem = [
  "홍보",
  "모집",
  "이벤트",
  "공모전",
  "행사",
  "기타",
];

List<bool> categoriesSelected = [
  false,
  false,
  true,
  false,
  false,
  false,
];

List questions = [
  Question(
    title: '기본 중의 기본! 개인 정보와 연락처',
    items: [
      "이름",
      "나이",
      "성별",
      "학과/학번",
      "이메일",
      "전화번호",
    ],
    selected: [
      true,
      false,
      false,
      false,
      true,
      true,
    ],
  ),
  Question(
    title: '지원자가 뽐낼 수 있는 보유 능력치',
    items: [
      "토익",
      "수상내역",
      "교육 이수",
      "컴/활 능력",
      "포트폴리오",
      "병역",
      "직무 스킬",
    ],
    selected: [
      true,
      false,
      false,
      false,
      false,
      false,
      true,
    ],
  ),
  Question(
    title: '지원자의 대외 활동 및 경험 여',
    items: [
      "동아리",
      "학생회",
      "교내활동",
      "인턴",
      "아르바이트",
      "자원봉사",
    ],
    selected: [
      true,
      false,
      true,
      false,
      false,
      false,
    ],
  ),
];
List profileName = [
  "이민규",
  "문목화",
  "박남규",
  "김경택",
  "임진주",
  "이은정",
  "손범수",
  "주재훈",
];
