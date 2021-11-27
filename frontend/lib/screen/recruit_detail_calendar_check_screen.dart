import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:togather/components/basic_card.dart';

class RecruitDetailCalendarCheckScreen extends StatefulWidget {
  const RecruitDetailCalendarCheckScreen({Key? key}) : super(key: key);

  @override
  _RecruitDetailCalendarCheckScreenState createState() =>
      _RecruitDetailCalendarCheckScreenState();
}

class _RecruitDetailCalendarCheckScreenState
    extends State<RecruitDetailCalendarCheckScreen> {
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
                const Text(
                  "모집 폼 링크",
                  style: TextStyle(
                      color: Color(0xffaeaeae),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
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
                                Icons.arrow_back_ios,
                                color: Color(0xffaeaeae),
                              ),
                              onPressed: () {},
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
                const SizedBox(
                  height: 15,
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
    );
  }
}
