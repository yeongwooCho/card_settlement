import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_appbar.dart';
import 'package:card_settlement/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '개인 정보 관리'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          children: [
            RenderContainer(
              title: '사업자 정보',
              fixButtonWidget: TextButton(
                onPressed: () {},
                child: const Text(
                  '정보 수정',
                  style: MyTextStyle.bodyMedium,
                ),
              ),
              data: [
                ['상호명', '쿠팡(주)'],
                ['사업자 번호', '120-88-00767'],
                ['휴대폰 번호', '010-1234-1234'],
                ['사업장 주소', '서울시 송파구 송파대로 570번길'],
              ],
            ),
            const SizedBox(height: 32.0),
            RenderContainer(
              title: '정산 정보',
              fixButtonWidget: TextButton(
                onPressed: () {},
                child: const Text(
                  '정보 수정',
                  style: MyTextStyle.bodyMedium,
                ),
              ),
              data: [
                ['은행', '농협은행'],
                ['계좌번호', '702022-123-234'],
                ['입금주명', '홍길동'],
                ['결제 날짜', '15일'],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RenderContainer extends StatelessWidget {
  final String title;
  final Widget fixButtonWidget;
  final List<List<String>> data;

  const RenderContainer({
    super.key,
    required this.title,
    required this.fixButtonWidget,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: MyTextStyle.headTitle,
            ),
            fixButtonWidget,
          ],
        ),
        const SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: MyColor.lightGrey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: List.generate(
                data.length,
                (index) => _renderRow(
                  title: data[index].first,
                  description: data[index].last,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderRow({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.0,
            child: Text(
              title,
              style: MyTextStyle.bodyBold,
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: MyTextStyle.bodyRegular,
            ),
          ),
        ],
      ),
    );
  }
}
