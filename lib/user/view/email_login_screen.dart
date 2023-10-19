import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/component/show/custom_toast.dart';
import '../../common/const/colors.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/util/text_validator.dart';
import '../../common/variable/routes.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  String? emailText;
  String? passwordText;

  bool isAutoLogin = true; // 자동 로그인 선택 여부

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(
        title: '로그인',
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48.0),
                CustomTextFormField(
                  onChanged: (String value) {},
                  onSaved: (String? value) {
                    emailText = value;
                  },
                  validator: TextValidator.emailValidator,
                  focusNode: emailFocus,
                  onEditingComplete: () {
                    if (formKey.currentState!.validate()) {
                      passwordFocus.requestFocus();
                    } else {
                      emailFocus.requestFocus();
                    }
                  },
                  title: '이메일',
                  hintText: '이메일 입력',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24.0),
                CustomTextFormField(
                  onChanged: (String value) {},
                  onSaved: (String? value) {
                    passwordText = value;
                  },
                  validator: TextValidator.passwordValidator,
                  focusNode: passwordFocus,
                  onEditingComplete: () {
                    if (formKey.currentState!.validate()) {
                      passwordFocus.unfocus();
                    }
                  },
                  title: '비밀번호',
                  hintText: '비밀번호 입력',
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      '자동 로그인',
                      style: MyTextStyle.bodyBold,
                    ),
                    const SizedBox(width: 6.0),
                    CupertinoSwitch(
                      activeColor: MyColor.primary,
                      value: isAutoLogin,
                      onChanged: (bool value) {
                        setState(() {
                          isAutoLogin = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                DefaultElevatedButton(
                  onPressed: () => onLoginPressed(context),
                  child: const Text('로그인'),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed(
                          //   RouteNames.terms,
                          // );
                        },
                        child: const Text(
                          '회원가입',
                          style: MyTextStyle.description,
                        ),
                      ),
                    ),
                    Container(
                      color: MyColor.darkGrey,
                      width: 1.0,
                      height: 14.0,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed(RouteNames.findEmail);
                        },
                        child: const Text(
                          '이메일 찾기',
                          style: MyTextStyle.description,
                        ),
                      ),
                    ),
                    Container(
                      color: MyColor.darkGrey,
                      width: 1.0,
                      height: 14.0,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushNamed(RouteNames.findPassword);
                        },
                        child: const Text(
                          '비밀번호 찾기',
                          style: MyTextStyle.description,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed(BuildContext context) async {
    // 해당 키를 가진 TextFormField 의 validate()를 모두 호출
    if (formKey.currentState!.validate()) {
      // 해당 키를 가진 TextFormField 의 onSaved()를 모두 호출
      formKey.currentState!.save();
    }

    if (emailText == null ||
        passwordText == null ||
        emailText!.isEmpty ||
        passwordText!.isEmpty) {
      showCustomToast(context, msg: '올바른 계정 정보를 입력해주세요.');
    } else {
      Navigator.of(context).pushNamed(
        RouteNames.root,
      );
    }
  }
}