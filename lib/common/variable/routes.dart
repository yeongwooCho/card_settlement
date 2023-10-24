import 'package:card_settlement/calculate/view/right_now_screen.dart';
import 'package:card_settlement/common/view/custom_completion_screen.dart';
import 'package:card_settlement/common/view/root_tab.dart';
import 'package:card_settlement/my_page/view/settings_screen.dart';
import 'package:card_settlement/my_page/view/withdraw_screen.dart';
import 'package:card_settlement/user/view/email_login_screen.dart';
import 'package:card_settlement/user/view/email_register_screen.dart';
import 'package:flutter/material.dart';

import '../../user/view/email_register_sub_screen.dart';
import '../model/screen_arguments.dart';

class RouteNames {
  // initial
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';

  // global
  static const String completion = '/completion';

  // root tab
  static const String root = '/root';

  // user
  static const String emailSignIn = '/user/sign/in';
  static const String emailSignUp = '/user/sign/up';
  static const String emailSignUpSub = '/user/sign/up/sub';
  static const String findPassword = '/user/find/password';
  static const String findPasswordChange = '/user/find/password/change';

  // my page
  static const String myPage = '/myPage';
  static const String settings = '/myPage/settings';
  static const String withdraw = '/myPage/withdraw';

  // calculate
  static const String rightNow = '/right/now';
}

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // example
  // RouteNames.home: (context) {
  //   final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments<String>;
  //   return FindEmailCompletionScreen(email: args.data);
  // },

  // global
  RouteNames.completion: (context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ScreenArguments<String>;
    return CustomCompletionScreen(
      title: args.data,
    );
  },

  // root tab
  RouteNames.root: (_) => RootTab(),

  // user
  RouteNames.emailSignIn: (_) => EmailLoginScreen(),
  RouteNames.emailSignUp: (_) => EmailRegisterScreen(),
  RouteNames.emailSignUpSub: (_) => EmailRegisterSubScreen(),

  // my page
  RouteNames.withdraw: (_) => WithdrawScreen(),
  RouteNames.settings: (_) => SettingsScreen(),

  // calculate
  RouteNames.rightNow: (_) => RightNowScreen(),
};
