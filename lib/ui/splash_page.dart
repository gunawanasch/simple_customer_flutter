import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_customer_flutter/library/colors.dart';
import 'package:simple_customer_flutter/ui/login_page.dart';
import 'package:simple_customer_flutter/ui/main_menu_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(new Duration(seconds: 2), () {
      _checkLogin();
    });
  }

  Future _checkLogin() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    int idUser = _sp.getInt("idUser") ?? 0;
    if (idUser > 0) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MainMenuPage())
      );
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginPage())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: Center(
        child: Image.asset(
          "assets/images/ic_logo.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

}
