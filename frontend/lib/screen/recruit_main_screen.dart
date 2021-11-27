import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:togather/components/basic_card.dart';
import 'package:togather/components/text_with_icon.dart';
import 'package:togather/screen/recruit_detail_application_confirmation_screen.dart';
import 'package:togather/screen/recruit_detail_calendar_check_screen.dart';

class RecruitMainScreen extends StatefulWidget {
  const RecruitMainScreen({Key? key}) : super(key: key);

  @override
  _RecruitMainScreenState createState() => _RecruitMainScreenState();
}

class _RecruitMainScreenState extends State<RecruitMainScreen> {
  bool status = true;
  final DateRangePickerController _pickerController =
      DateRangePickerController();

  @override
  void initState() {
    super.initState();
    _pickerController.selectedRange = PickerDateRange(
      DateTime.utc(2021, 11, 23),
      DateTime.utc(2021, 11, 30),
    );
  }

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
                      "모집 관리",
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
                const SizedBox(
                  height: 5,
                ),
                const TextWithIcon(
                  text: "모집 폼 링크",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffaeaeae),
                  icon: Icons.arrow_forward_ios,
                ),
                const SizedBox(
                  height: 10,
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
                              onPressed: () {
                                pushNewScreen(
                                  context,
                                  screen:
                                      const RecruitDetailApplicationConfirmationScreen(),
                                  withNavBar: false,
                                );
                              },
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
                                  "일정 확인",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff4d4d4d),
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Image.asset(
                                    "assets/images/calendar_check_logo.png"),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xffaeaeae),
                              ),
                              onPressed: () {
                                pushNewScreen(
                                  context,
                                  screen:
                                      const RecruitDetailCalendarCheckScreen(),
                                  withNavBar: false,
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SfDateRangePicker(
                          view: DateRangePickerView.month,
                          controller: _pickerController,
                          monthViewSettings:
                              const DateRangePickerMonthViewSettings(
                            firstDayOfWeek: 6,
                          ),
                          selectionMode: DateRangePickerSelectionMode.range,
                          startRangeSelectionColor:
                              Theme.of(context).primaryColor,
                          endRangeSelectionColor:
                              Theme.of(context).primaryColor,
                          rangeSelectionColor: const Color(0xffebe7ff),
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
