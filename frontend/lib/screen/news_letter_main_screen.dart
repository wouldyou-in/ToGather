import 'package:flutter/material.dart';
import 'package:togather/components/basic_card.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/constant.dart';

class NewsLetterMainScreen extends StatefulWidget {
  const NewsLetterMainScreen({Key? key}) : super(key: key);

  @override
  _NewsLetterMainScreenState createState() => _NewsLetterMainScreenState();
}

class _NewsLetterMainScreenState extends State<NewsLetterMainScreen> {
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "뉴스레터 생성",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              TextWithIcon(
                text: "전달 현황",
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                color: const Color(0xffaeaeae),
                icon: Icons.arrow_forward_ios,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              BasicCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 5,
                        childAspectRatio: 3 / 1,
                        children: List.generate(
                          categoriesItem.length,
                          (index) => InkWell(
                            onTap: () {
                              var tmp = categoriesSelected[index];
                              setState(() {
                                categoriesSelected[index] = !tmp;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: categoriesSelected[index]
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
                                      color: categoriesSelected[index]
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
                                    categoriesItem[index],
                                    style: TextStyle(
                                      color: categoriesSelected[index]
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
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BasicCard(
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
                          "작성 내용",
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
                          "뉴스레터로 전달될 내용을 작성해주세요",
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
                        "제목",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xffaeaeae),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xfff6f6f6),
                          hintText: "제목을 작성해주세요",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffebe7ff),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "부제목",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xffaeaeae),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xfff6f6f6),
                          hintText: "부제목을 작성해주요",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffebe7ff),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "내용",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xffaeaeae),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        maxLines: 7,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xfff6f6f6),
                          hintText: "내용을 작성해주세요",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffebe7ff),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                      '보내기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
