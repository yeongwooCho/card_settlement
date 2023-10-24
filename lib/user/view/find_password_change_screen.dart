import 'package:flutter/material.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_button.dart';
import '../../common/layout/default_layout.dart';
import '../../common/util/text_validator.dart';
import '../../common/variable/routes.dart';

class FindPasswordChangeScreen extends StatefulWidget {
  const FindPasswordChangeScreen({super.key});

  @override
  State<FindPasswordChangeScreen> createState() =>
      _FindPasswordChangeScreenState();
}

class _FindPasswordChangeScreenState extends State<FindPasswordChangeScreen> {
  String? password;
  String? passwordCheck;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '비밀번호 찾기'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24.0),
              const Text(
                '새로운 비밀번호를\n입력해 주세요.',
                style: MyTextStyle.headTitle,
              ),
              const SizedBox(height: 48.0),
              CustomTextFormField(
                title: '비밀번호 입력',
                hintText: "영문, 숫자, 특수문자 포함 8~20자 이내",
                onChanged: (String? value) {
                  setState(() {
                    password = value;
                  });
                },
                onSaved: (String? value) {},
                validator: TextValidator.passwordValidator,
              ),
              const SizedBox(height: 24.0),
              CustomTextFormField(
                title: '비밀번호 입력',
                hintText: "비밀번호를 한 번 더 입력해 주세요.",
                onChanged: (String? value) {
                  setState(() {
                    passwordCheck = value;
                  });
                },
                onSaved: (String? value) {},
                validator: TextValidator.passwordValidator,
              ),
              const SizedBox(height: 48.0),
              DefaultElevatedButton(
                onPressed: password == null ||
                        passwordCheck == null ||
                        password!.isEmpty ||
                        passwordCheck!.isEmpty
                    ? null
                    : () {
                        Navigator.of(context).pushNamed(
                          RouteNames.emailSignIn,
                        );
                      },
                child: const Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
