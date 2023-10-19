import 'package:card_settlement/common/view/root_tab.dart';
import 'package:flutter/material.dart';

class RouteNames {
  // initial
  static const String splash = '/';

  // root tab
  static const String root = '/root';
}

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // example
  // RouteNames.home: (context) {
  //   final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments<String>;
  //   return FindEmailCompletionScreen(email: args.data);
  // },

  // root tab
  RouteNames.root: (_) => RootTab(),
};
