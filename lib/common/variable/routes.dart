import 'package:card_settlement/common/view/root_tab.dart';
import 'package:card_settlement/user/view/email_login_screen.dart';
import 'package:flutter/material.dart';

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
  static const String findEmail = '/user/find/email';
  static const String findPassword = '/user/find/password';
  static const String findPasswordChange = '/user/find/password/change';
  static const String terms = '/user/terms';
  static const String termsDetail = '/user/terms/detail';
}

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // example
  // RouteNames.home: (context) {
  //   final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments<String>;
  //   return FindEmailCompletionScreen(email: args.data);
  // },

  // root tab
  RouteNames.root: (_) => RootTab(),

  // user
  RouteNames.emailSignIn: (_) => EmailLoginScreen(),
};
