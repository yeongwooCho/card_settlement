import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_button.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/variable/routes.dart';

class CalculateScreen extends StatelessWidget {
  const CalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '정산 조회'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: MyColor.lightGrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '정산 가능한 금액',
                      style: MyTextStyle.bodyTitleBold,
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      '12,732,232 원',
                      style: MyTextStyle.bodyMedium.copyWith(
                        color: MyColor.darkGrey,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 24.0),
                    DefaultElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RouteNames.rightNow,
                        );
                      },
                      child: const Text('바로 정산받기'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            Container(
              decoration: BoxDecoration(
                color: MyColor.lightGrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '정산 내역',
                      style: MyTextStyle.bodyTitleBold,
                    ),
                    const SizedBox(height: 16.0),
                    _renderRow(
                      title: '2023-09-03',
                      description: '6,000,000 원',
                    ),
                    _renderRow(
                      title: '2023-07-10',
                      description: '3,000,000 원',
                    ),
                    _renderRow(
                      title: '2023-06-08',
                      description: '2,000,000 원',
                    ),
                    _renderRow(
                      title: '2023-05-09',
                      description: '2,400,000 원',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderRow({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: MyTextStyle.bodyMedium.copyWith(
              color: MyColor.darkGrey,
            ),
          ),
          Text(
            description,
            style: MyTextStyle.bodyMedium.copyWith(
              color: MyColor.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
