import 'package:flutter/widgets.dart';

import '../ui/home/home_page.dart';

class AppRoute {
  static const String homeRoute = "/";
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    homeRoute: (BuildContext context) {
      return const HomePage();
    },
  };
}
