import 'package:card_settlement/common/const/colors.dart';
import 'package:flutter/material.dart';

import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';
import '../component/custom_calculate_container.dart';
import '../component/custom_calendar_container.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '매출 조회'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomCalculateScreen(),
            Container(
              height: 10.0,
              color: MyColor.lightGrey,
            ),
            CustomCalculateScreen(),
            Container(
              height: 10.0,
              color: MyColor.lightGrey,
            ),
            CustomCalendarScreen(),
          ],
        ),
      ),
    );
  }
}
