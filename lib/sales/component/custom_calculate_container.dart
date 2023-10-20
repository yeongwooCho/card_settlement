import 'package:flutter/material.dart';

import '../../common/component/custom_container_button.dart';
import '../../common/const/text_style.dart';
import 'custom_chart.dart';

class CustomCalculateScreen extends StatefulWidget {
  const CustomCalculateScreen({super.key});

  @override
  State<CustomCalculateScreen> createState() => _CustomCalculateScreenState();
}

class _CustomCalculateScreenState extends State<CustomCalculateScreen> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
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
              const Text(
                '기간별 카드사 매출',
                style: MyTextStyle.headTitle,
              ),
              TextButton(
                onPressed: () {},
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
            bottomTitle: '시간(월)',
            data: [],
          ),
        ],
      ),
    );
  }
}

