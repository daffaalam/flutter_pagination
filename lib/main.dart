import 'package:flutter/material.dart';

import 'config/constant.dart';
import 'view/home_page.dart';

void main() {
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Constant.homeRoute: (BuildContext context) {
      return HomePage();
    },
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      initialRoute: Constant.homeRoute,
    );
  }
}
