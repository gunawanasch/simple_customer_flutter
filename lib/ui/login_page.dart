import 'package:flutter/material.dart';
import 'package:simple_customer_flutter/library/colors.dart';
import 'package:simple_customer_flutter/ui/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _logoImage() {
    return Container(
      height: 60.0,
      child: Image.asset(
        "assets/images/ic_logo.png",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _emailTextField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: Gray2,
          filled: true,
          hintText: "Email",
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: Gray2,
          filled: true,
          hintText: "Password",
        ),
        obscureText: true,
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Gray1,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Yellow, PrimaryColor])),
      child: Text(
        'Login',
        style: TextStyle(
            fontSize: 20,
            color: White,
        ),
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return RegisterPage();
            }
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Gray1,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Blue1, Blue2])),
        child: Text(
          'Register',
          style: TextStyle(
            fontSize: 20,
            color: White,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 120),
                      _logoImage(),
                      SizedBox(height: 60),
                      _emailTextField(),
                      SizedBox(height: 20),
                      _passwordTextField(),
                      SizedBox(height: 40),
                      _loginButton(),
                      SizedBox(height: 10),
                      Text(
                        'Or',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      _registerButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

}
