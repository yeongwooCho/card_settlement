import 'package:card_settlement/common/component/custom_list_card.dart';
import 'package:card_settlement/common/component/show/show_cupertino_alert.dart';
import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_appbar.dart';
import 'package:card_settlement/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/variable/routes.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '마이페이지'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
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
                    Text(
                      '쿠팡(주)',
                      style: MyTextStyle.headTitle,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '사업자 번호: 120-88-00767',
                      style: MyTextStyle.bodyRegular,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48.0),
            CustomListCard(
              title: '개인 정보 관리',
              onTap: () {},
              isSuffix: true,
            ),
            CustomListCard(
              title: '로그아웃',
              onTap: () {
                showAlert(
                  context: context,
                  titleWidget: Text('로그아웃 하시겠습니까'),
                  completeText: '확인',
                  completeFunction: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNames.emailSignIn,
                      (route) => false,
                    );
                  },
                  cancelText: '취소',
                  cancelFunction: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              isSuffix: false,
            ),
            CustomListCard(
              title: '회원탈퇴',
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteNames.withdraw,
                );
              },
              isSuffix: true,
            ),
          ],
        ),
      ),
    );
  }
}
