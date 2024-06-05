import 'package:flutter/material.dart';

import '../resources/routes_manager.dart';
import '../resources/theme_manager.dart';


class MyApp extends StatefulWidget {
  MyApp._internal(); //named constructor


  static final MyApp instance = MyApp._internal(); //single instance or singleton

  factory MyApp() => instance;//factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
