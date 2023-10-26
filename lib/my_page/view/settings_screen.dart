import 'package:card_settlement/common/component/custom_text_form_field.dart';
import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_appbar.dart';
import 'package:card_settlement/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../my_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isFirstEditSelected = false;
  bool isSecondEditSelected = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '개인 정보 관리'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          child: Column(
            children: [
              RenderContainer(
                title: '사업자 정보',
                fixButtonWidget: TextButton(
                  onPressed: () {
                    setState(() {
                      isFirstEditSelected = !isFirstEditSelected;
                    });
                  },
                  child: Text(
                    isFirstEditSelected ? '수정 완료' : '정보 수정',
                    style: MyTextStyle.bodyMedium,
                  ),
                ),
                data: [
                  ['상호명', userData[0]],
                  ['사업자 번호', userData[1]],
                  ['휴대폰 번호', userData[2]],
                  ['사업장 주소', userData[3]],
                ],
                isEditSelected: isFirstEditSelected,
              ),
              const SizedBox(height: 32.0),
              RenderContainer(
                title: '정산 정보',
                fixButtonWidget: TextButton(
                  onPressed: () {
                    setState(() {
                      isSecondEditSelected = !isSecondEditSelected;
                    });
                  },
                  child: Text(
                    isSecondEditSelected ? '수정 완료' : '정보 수정',
                    style: MyTextStyle.bodyMedium,
                  ),
                ),
                data: [
                  ['은행', userData[4]],
                  ['계좌번호', userData[5]],
                  ['입금주명', userData[6]],
                  ['결제 날짜', userData[7]],
                ],
                isEditSelected: isSecondEditSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RenderContainer extends StatelessWidget {
  final String title;
  final Widget fixButtonWidget;
  final List<List<String>> data;
  final bool isEditSelected;

  const RenderContainer({
    super.key,
    required this.title,
    required this.fixButtonWidget,
    required this.data,
    required this.isEditSelected,
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
                  isEditSelected: isEditSelected,
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
    required bool isEditSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120.0,
            child: Text(
              title,
              style: MyTextStyle.bodyBold,
            ),
          ),
          Expanded(
            child: isEditSelected
                ? CustomTextFormField(
                    onChanged: (String? value) {},
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return null;
                    },
                  )
                : Text(
                    description,
                    style: MyTextStyle.bodyRegular,
                  ),
          ),
        ],
      ),
    );
  }
}
