import 'package:flutter/material.dart';
import 'package:simple_customer_flutter/library/colors.dart';
import 'package:simple_customer_flutter/ui/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Data Customer",
      theme: ThemeData(
        primaryColor: PrimaryColor,
        primaryColorLight: PrimaryColor,
        accentColor: AccentColor,
      ),
      home: SplashPage(),
    );
  }
}
