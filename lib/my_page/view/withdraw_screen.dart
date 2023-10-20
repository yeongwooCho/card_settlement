import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_button.dart';
import 'package:flutter/material.dart';

import '../../common/component/show/show_cupertino_alert.dart';
import '../../common/const/colors.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/variable/routes.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  bool isSelected = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '회원탈퇴'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24.0),
                const Text(
                  '회원 탈퇴 시 아래의 주의사항을\n꼭 읽어주세요.',
                  style: MyTextStyle.headTitle,
                ),
                const SizedBox(height: 24.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '◦ 탈퇴 시, 회원님의 사업자 정보와 정산 정보 모두 삭제되며 복구가 불가능 합니다.',
                    style: MyTextStyle.descriptionRegular,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '◦ 선 정산 후 입금이 완료되지 않을 경우 탈퇴는 불가능 합니다.',
                    style: MyTextStyle.descriptionRegular,
                  ),
                ),
                const SizedBox(height: 36.0),
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
              ],
            ),
            DefaultElevatedButton(
              onPressed: isSelected
                  ? () {
                      showAlert(
                        context: context,
                        titleWidget: const Text('회원 탈퇴 하시겠습니까?'),
                        contentWidget:
                            const Text('개인정보는 모두 삭제되며,\n복구는 불가능합니다.'),
                        completeText: '확인',
                        completeFunction: () async {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteNames.emailSignIn,
                            (route) => false,
                          );
                        },
                        cancelText: '취소',
                        cancelFunction: () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  : null,
              child: const Text('회원 탈퇴하기'),
            ),
          ],
        ),
      ),
    );
  }
}
