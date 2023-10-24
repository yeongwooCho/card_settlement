import 'package:card_settlement/common/util/money_format.dart';
import 'package:flutter/material.dart';

import '../../common/const/text_style.dart';
import '../../data/card/chart_data.dart';
import '../../data/delivery/chart_delivery_data.dart';
import 'custom_calendar.dart';

class CustomCalendarScreen extends StatefulWidget {
  const CustomCalendarScreen({super.key});

  @override
  State<CustomCalendarScreen> createState() => _CustomCalendarScreenState();
}

class _CustomCalendarScreenState extends State<CustomCalendarScreen> {
  int selectedItemIndex = 0;

  // DateTime selectedDate = DateTime(
  //   DateTime.now().year,
  //   DateTime.now().month,
  //   DateTime.now().day,
  // );
  DateTime selectedDate = DateTime(2023, 9, 1);
  List<dynamic> cardMoney = [];
  List<dynamic> deliveryMoney = [];
  int cardMoneyString = 0;
  int deliveryMoneyString = 0;

  @override
  Widget build(BuildContext context) {
    cardMoney = chartCard
        .where((element) =>
            selectedDate.year == element.first.year &&
            selectedDate.month == element.first.month &&
            selectedDate.day == element.first.day)
        .toList();
    deliveryMoney = chartDeliveryData
        .where((element) =>
            selectedDate.year == element.first.year &&
            selectedDate.month == element.first.month &&
            selectedDate.day == element.first.day)
        .toList();
    cardMoney.isNotEmpty ? cardMoneyString = cardMoney.first.last : cardMoneyString = 0;
    deliveryMoney.isNotEmpty ? deliveryMoneyString = deliveryMoney.first.last : deliveryMoneyString = 0;

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
                  "${cardMoney.isNotEmpty ? cardMoneyString.convertIntToMoneyString() : '0'} 원",
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
                  "${deliveryMoney.isNotEmpty ? deliveryMoneyString.convertIntToMoneyString() : 0} 원",
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
