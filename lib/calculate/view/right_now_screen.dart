import 'package:card_settlement/common/layout/default_button.dart';
import 'package:card_settlement/common/model/screen_arguments.dart';
import 'package:card_settlement/common/util/datetime.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/variable/routes.dart';

class RightNowScreen extends StatefulWidget {
  const RightNowScreen({super.key});

  @override
  State<RightNowScreen> createState() => _RightNowScreenState();
}

class _RightNowScreenState extends State<RightNowScreen> {
  DateTime now = DateTime.now();
  bool isSelected = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      // loadingWidget: const Center(child: CircularProgressIndicator()),
      appbar: const DefaultAppBar(title: '바로 정산 받기'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            RenderContainer(
              title: '정산 상세 정보',
              data: [
                ['상호명', '쿠팡(주)'],
                ['사업자 번호', '120-88-00767'],
                ['입금 은행', '농협은행'],
                ['계좌 번호', '702022-123-234'],
                ['입금주명', '홍길동'],
                ['오늘 날짜', now.convertDateTimeToDateString()],
                ['결제 시작 일', '2023-11-15'],
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
              child: Text(
                '◦  연체 발생 시, 고객님의 신용점수에 반영됩니다.\n◦ 결제가 필요한 정산이 있을 경우 회원 탈퇴가 불가능 합니다.',
                style: MyTextStyle.descriptionRegular.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                isSelected = !isSelected;
                setState(() {});
              },
              child: Container(
                color: MyColor.empty,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isSelected
                        ? const Icon(
                      Icons.check_circle,
                      color: MyColor.primary,
                      size: 32.0,
                    )
                        : const Icon(
                      Icons.circle_outlined,
                      size: 32.0,
                    ),
                    const SizedBox(width: 16.0),
                    const Text(
                      '위 사실을 모두 확인 하였습니다.',
                      style: MyTextStyle.bodyBold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            DefaultElevatedButton(
              onPressed: isSelected
                  ? () async {
                      isLoading = true;
                      setState(() {});
                      await Future.delayed(const Duration(seconds: 3));
                      isLoading = false;
                      setState(() {});

                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteNames.completion,
                        arguments: ScreenArguments<String>(
                          data: '정산 받기가 완료 되었습니다.',
                        ),
                        (route) => false,
                      );
                    }
                  : null,
              child: const Text('바로 정산받기'),
            ),
          ],
        ),
      ),
    );
  }
}

class RenderContainer extends StatelessWidget {
  final String title;
  final List<List<String>> data;

  const RenderContainer({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: MyTextStyle.headTitle,
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
