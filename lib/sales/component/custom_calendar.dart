import 'package:card_settlement/common/const/colors.dart';
import 'package:card_settlement/common/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final OnDaySelected onDaySelected;

  const MainCalendar({
    Key? key,
    required this.selectedDate,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_kr',
      focusedDay: selectedDate,
      firstDay: DateTime(2000, 1, 1),
      lastDay: DateTime(3000, 1, 1),
      selectedDayPredicate: (DateTime dateTime) {
        return dateTime.year == selectedDate.year &&
            dateTime.month == selectedDate.month &&
            dateTime.day == selectedDate.day;
      },
      onDaySelected: onDaySelected,
      headerStyle: getHeaderStyle(),
      calendarStyle: getCalendarStyle(),
    );
  }

  HeaderStyle getHeaderStyle() {
    return const HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: MyTextStyle.bodyBold,
    );
  }

  CalendarStyle getCalendarStyle() {
    return CalendarStyle(
      cellMargin: const EdgeInsets.all(4),
      isTodayHighlighted: false,
      defaultDecoration: BoxDecoration(
        color: MyColor.lightGrey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      weekendDecoration: BoxDecoration(
        color: MyColor.lightGrey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      selectedDecoration: BoxDecoration(
        border: Border.all(
          color: MyColor.primary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      defaultTextStyle: MyTextStyle.descriptionMedium,
      weekendTextStyle: MyTextStyle.descriptionMedium,
      selectedTextStyle: MyTextStyle.descriptionBold.copyWith(
        color: MyColor.primary,
      ),
    );
  }
}
