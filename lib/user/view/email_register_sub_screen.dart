import 'package:card_settlement/common/component/custom_drop_down_button.dart';
import 'package:card_settlement/common/component/custom_text_form_field.dart';
import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_button.dart';
import 'package:card_settlement/common/layout/default_layout.dart';
import 'package:card_settlement/common/model/screen_arguments.dart';
import 'package:flutter/material.dart';

import '../../common/layout/default_appbar.dart';
import '../../common/variable/routes.dart';

const List<String> bankData = [
  "은행 선택",
  "KEB하나은행",
  "SC제일은행",
  "국민은행",
  "신한은행",
  "외환은행",
  "우리은행",
  "한국시티은행",
  "지방은행",
  "경남은행",
  "광주은행",
  "대구은행",
  "부산은행",
  "전북은행",
  "제주은행",
  "특수은행",
  "기업은행",
  "농협",
  "수협",
  "한국산업은행",
  "한국수출입은행",
];

List<String> dateList = [
  "결제 날짜 선택",
  '5일',
  '10일',
  '12일',
  '15일',
  '20일',
  '25일',
];

class EmailRegisterSubScreen extends StatefulWidget {
  const EmailRegisterSubScreen({super.key});

  @override
  State<EmailRegisterSubScreen> createState() => _EmailRegisterSubScreenState();
}

class _EmailRegisterSubScreenState extends State<EmailRegisterSubScreen> {
  String bank = bankData.first;
  String? bankNumber;
  String? bankAccount;
  String calculateDate = dateList.first;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '회원가입'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24.0),
              const Text(
                '정산 받을 계좌 정보를\n입력해 주세요.',
                style: MyTextStyle.headTitle,
              ),
              const SizedBox(height: 48.0),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  "은행",
                  style: MyTextStyle.bodyTitleBold,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomDropDownButton(
                dropdownList: bankData,
                defaultValue: bank,
                onChanged: (String? value) {
                  if (value != null) {
                    bank = value;
                  }
                  setState(() {});
                },
              ),
              const SizedBox(height: 24.0),
              CustomTextFormField(
                title: '계좌번호',
                hintText: "'-' 없이 입력",
                onChanged: (String? value) {
                  setState(() {
                    bankNumber = value;
                  });
                },
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 24.0),
              CustomTextFormField(
                title: '입금주명',
                hintText: '',
                onChanged: (String? value) {
                  setState(() {
                    bankAccount = value;
                  });
                },
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  "결제 날짜",
                  style: MyTextStyle.bodyTitleBold,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomDropDownButton(
                dropdownList: dateList,
                defaultValue: calculateDate,
                onChanged: (String? value) {
                  if (value != null) {
                    calculateDate = value;
                  }
                  setState(() {});
                },
              ),
              const SizedBox(height: 48.0),
              DefaultElevatedButton(
                onPressed: bank == bankData.first ||
                        bankNumber == null ||
                        bankNumber!.isEmpty ||
                        bankAccount == null ||
                        bankAccount!.isEmpty ||
                        calculateDate == dateList.first
                    ? null
                    : () {
                        Navigator.of(context).pushNamed(
                          RouteNames.completion,
                          arguments: ScreenArguments<String>(
                            data: "회원가입이 완료 되었습니다.",
                          ),
                        );
                      },
                child: const Text('회원가입 완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
