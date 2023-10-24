import 'dart:developer';

import 'package:card_settlement/common/util/datetime.dart';
import 'package:card_settlement/common/util/map_with_index.dart';
import 'package:card_settlement/data/card/chart_card_day_data.dart';
import 'package:card_settlement/data/card/chart_card_week_data.dart';
import 'package:card_settlement/data/delivery/chart_delivery_data.dart';
import 'package:card_settlement/data/delivery/chart_delivery_day_data.dart';
import 'package:card_settlement/data/delivery/chart_delivery_month_data.dart';
import 'package:card_settlement/data/delivery/chart_delivery_week_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_container_button.dart';
import '../../common/const/text_style.dart';
import '../../data/card/chart_card_month_data.dart';
import '../view/sales_delivary_detail_screen.dart';
import '../view/sales_detail_screen.dart';
import 'custom_chart.dart';

class CustomCalculateScreen extends StatefulWidget {
  final String title;
  final bool isCard;

  const CustomCalculateScreen({
    super.key,
    required this.title,
    required this.isCard,
  });

  @override
  State<CustomCalculateScreen> createState() => _CustomCalculateScreenState();
}

class _CustomCalculateScreenState extends State<CustomCalculateScreen> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Day
    // int maxValue = 0;
    // var zxc = chartDeliveryData.mapWithIndex<FlSpot>((p0, i) {
    //   if (maxValue < p0.last) {
    //     maxValue = p0.last;
    //   }
    //   return FlSpot(i.toDouble(), p0.last.toDouble() / 1000);
    // }).toList();
    // log(zxc.toString());
    // log(maxValue.toString());

    // Week
    // Map<int, double> temp = {};
    // for(dynamic e in chartDeliveryData) {
    //   DateTime date = e.first;
    //   double money = (e.last / 1000).roundToDouble();
    //
    //   if (temp.containsKey(date.getWeekNumber())) {
    //     temp[date.getWeekNumber()] = (temp[date.getWeekNumber()]! + money);
    //   } else {
    //     temp[date.getWeekNumber()] = money;
    //   }
    // }
    // log(temp.toString());

    // // Month
    // Map<int, double> temp = {};
    // for(dynamic e in chartDeliveryData) {
    //   DateTime date = e.first;
    //   double money = (e.last / 1000).roundToDouble();
    //
    //
    //   if (temp.containsKey(date.month)) {
    //     temp[date.month] = (temp[date.month]! + money);
    //   } else {
    //     temp[date.month] = money;
    //   }
    // }
    // log(temp.toString());

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 48.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: MyTextStyle.headTitle,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => widget.isCard ? const SalesDetailScreen() : const SalesDeliveryDetailScreen(),
                    ),
                  );
                },
                child: const Text(
                  '매출 상세보기',
                  style: MyTextStyle.descriptionRegular,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomContainerButton(
                  title: '일',
                  isSelected: selectedItemIndex == 0,
                  onTap: () {
                    selectedItemIndex = 0;
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: CustomContainerButton(
                  title: '주',
                  isSelected: selectedItemIndex == 1,
                  onTap: () {
                    selectedItemIndex = 1;
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: CustomContainerButton(
                  title: '월',
                  isSelected: selectedItemIndex == 2,
                  onTap: () {
                    selectedItemIndex = 2;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          CustomChart(
            leftTitle: '매출(천원)',
            bottomTitle: '기간( 23-01-01 ~ )',
            data: getData(),
            maxValue: getMaxValue(),
          ),
        ],
      ),
    );
  }

  List<FlSpot> getData() {
    late List<FlSpot> returnData;
    switch (selectedItemIndex) {
      case 0:
        widget.isCard
            ? returnData = chartCardDayData
            : returnData = chartDeliveryDayData;
      case 1:
        widget.isCard
            ? returnData = chartCardWeekData
            : returnData = chartDeliveryWeekData;
      case 2:
        widget.isCard
            ? returnData = chartCardMonthData
            : returnData = chartDeliveryMonthData;
      default:
        returnData = [];
    }
    return returnData;
  }

  double getMaxValue() {
    late double returnData;
    switch (selectedItemIndex) {
      case 0:
        widget.isCard
            ? returnData = maxChartCardDayData
            : returnData = maxChartDeliveryDayData;
      case 1:
        widget.isCard
            ? returnData = maxChartCardWeekData
            : returnData = maxChartDeliveryWeekData;
      case 2:
        widget.isCard
            ? returnData = maxChartCardMonthData
            : returnData = maxChartDeliveryMonthData;
      default:
        returnData = 0.0;
    }
    return returnData;
  }
}

