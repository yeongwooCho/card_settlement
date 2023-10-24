import 'package:card_settlement/common/const/colors.dart';
import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/util/money_format.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomChart extends StatefulWidget {
  final String leftTitle;
  final String bottomTitle;
  final List<FlSpot> data;
  final double maxValue;

  const CustomChart({
    Key? key,
    required this.leftTitle,
    required this.bottomTitle,
    required this.data,
    required this.maxValue,
  }) : super(key: key);

  @override
  State<CustomChart> createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> {
  // 그라데이션
  List<Color> gradientColors = [
    MyColor.chartLinePrimary,
    MyColor.chartLineSecondary,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: MyColor.chartBackground,
      ),
      child: SizedBox(
        height: 300.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: LineChart(
            getLineChardData(),
            duration: const Duration(milliseconds: 1000), // Optional
            curve: Curves.linear, // Optional
          ),
        ),
      ),
    );
  }

  FlLine getDividerLine(double value) {
    // 내부 라인
    return const FlLine(
      color: MyColor.darkGrey,
      strokeWidth: 1,
    );
  }

  FlBorderData getFlBorderData() {
    // 테두리 라인
    return FlBorderData(
      show: true,
      border: Border.all(
        color: MyColor.darkGrey,
        width: 1,
      ),
    );
  }

  SideTitles getLeftSideTitles() {
    int valueLength = 6; //widget.data.length;
    // widget.festivalModel.cumulativeParticipantCount.toString().length;
    double dotLength = valueLength > 3 ? (valueLength > 6 ? 2 : 1) : 2;
    double valueWidth = 9.0; // 숫자 width
    double dotWidth = 6.0; // , 문자 width

    return SideTitles(
      showTitles: true,
      reservedSize: (valueLength * valueWidth) + (dotLength * dotWidth),
      // interval: widget.festivalModel.cumulativeParticipantCount == 0
      //     ? 1.0
      //     : widget.festivalModel.cumulativeParticipantCount / 3,
      interval: widget.maxValue / 4.0, // 2000, //widget.data[0].y / 4.0,
      //widget.festivalModel.cumulativeParticipantCount ~/ 3 != 0
      // ? widget.festivalModel.cumulativeParticipantCount / 3
      // : 1.0,
      getTitlesWidget: (double value, TitleMeta meta) {
        late String title;
        switch (value.toInt()) {
          default:
            title = value.toInt().convertIntToMoneyString();
        }
        return Text(
          title,
          style: MyTextStyle.descriptionRegular.copyWith(
            color: MyColor.whiteText,
          ),
          textAlign: TextAlign.center,
        );
      },
    );
  }

  SideTitles getBottomSideTitles() {
    // List<String> participants =
    //     widget.festivalModel.participantsByTimezone.split('/');

    return SideTitles(
      showTitles: true,
      reservedSize: 22,
      // text height
      interval: widget.data.length ~/ 3 != 0 ? widget.data.length / 3 : 1.0,
      // participants.length ~/ 8 != 0 ? participants.length / 8 : 1.0,
      getTitlesWidget: (double value, TitleMeta meta) {
        late String title;
        switch (value.toInt()) {
          default:
            title = "${value.toInt() + 1}";
        }
        return Text(
          title,
          style: MyTextStyle.descriptionRegular.copyWith(
            color: MyColor.whiteText,
          ),
          textAlign: TextAlign.start,
        );
      },
    );
  }

  LineChartData getLineChardData() {
    return LineChartData(
      minY: 0.0,
      maxY: widget.maxValue,
      lineBarsData: getLineBarsData(),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: getDividerLine,
        getDrawingVerticalLine: getDividerLine,
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: getLeftSideTitles(),
          // drawBelowEverything: true,
          axisNameWidget: Text(
            widget.leftTitle,
            style: MyTextStyle.bodyBold.copyWith(
              color: MyColor.whiteText,
            ),
          ),
          axisNameSize: 24.0,
        ),
        bottomTitles: AxisTitles(
          sideTitles: getBottomSideTitles(),
          // drawBelowEverything: true,
          axisNameWidget: Text(
            widget.bottomTitle,
            style: MyTextStyle.bodyBold.copyWith(
              color: MyColor.whiteText,
            ),
          ),
          axisNameSize: 24.0,
          drawBelowEverything: true,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: getFlBorderData(),
    );
  }

  List<LineChartBarData> getLineBarsData() {
    // List<FlSpot> flSpotList = [
    //   FlSpot(0, 0),
    //   FlSpot(1, 30),
    //   FlSpot(2, 50),
    //   FlSpot(3, 0),
    //   FlSpot(4, 70),
    //   FlSpot(5, 10),
    //   FlSpot(6, 90),
    //   FlSpot(7, 30),
    // ];

    return [
      LineChartBarData(
        spots: widget.data,
        isCurved: false,
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: gradientColors
                .map(
                  (color) => color.withOpacity(0.3),
                )
                .toList(),
          ),
        ),
      ),
    ];
  }
}
