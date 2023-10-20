import 'package:card_settlement/common/util/money_format.dart';
import 'package:flutter/material.dart';

import '../../common/const/text_style.dart';
import 'custom_calendar.dart';

class CustomCalendarScreen extends StatefulWidget {
  const CustomCalendarScreen({super.key});

  @override
  State<CustomCalendarScreen> createState() => _CustomCalendarScreenState();
}

class _CustomCalendarScreenState extends State<CustomCalendarScreen> {
  int selectedItemIndex = 0;
  DateTime selectedDate = DateTime.now();
  int num1 = 10431511;
  int num2 = 20432222;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 48.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '기간별 매출 캘린더',
            style: MyTextStyle.headTitle,
          ),
          const SizedBox(height: 16.0),
          MainCalendar(
            selectedDate: selectedDate,
            onDaySelected: onDaySelected,
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '카드사 총 매출',
                  style: MyTextStyle.bodyBold,
                ),
                Text(
                  "${num2.convertIntToMoneyString()} 원",
                  style: MyTextStyle.bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '배달어플 총 매출',
                  style: MyTextStyle.bodyBold,
                ),
                Text(
                  "${num1.convertIntToMoneyString()} 원",
                  style: MyTextStyle.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
