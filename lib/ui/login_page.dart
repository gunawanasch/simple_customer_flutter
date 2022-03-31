import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_customer_flutter/bloc/login/login_bloc.dart';
import 'package:simple_customer_flutter/bloc/login/login_event.dart';
import 'package:simple_customer_flutter/bloc/login/login_state.dart';
import 'package:simple_customer_flutter/library/colors.dart';
import 'package:simple_customer_flutter/library/custom_loading.dart';
import 'package:simple_customer_flutter/repository/login_repository.dart';
import 'package:simple_customer_flutter/ui/main_menu_page.dart';
import 'package:simple_customer_flutter/ui/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        controller: _emailController,
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
        controller: _passwordController,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Text("Please complete all field."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          );
        } else {
          BlocProvider.of<LoginBloc>(context).add(Login(
            email: _emailController.text,
            password: _passwordController.text,
          ));
        }
      },
      child: Container(
        height: 55,
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
          "Login",
          style: TextStyle(
              fontSize: 20,
              color: White,
          ),
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
        height: 55,
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
          "Register",
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
          child: BlocProvider(
            create: (context) => LoginBloc(LoginRepository()),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) async {
                if (state is LoginLoading) {
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return CustomLoading();
                      }
                  );
                }
                if (state is LoginSuccess) {
                  Navigator.of(context).pop();
                  if (state.loginModel.status == 1) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${state.loginModel.message}")));
                    SharedPreferences sp = await SharedPreferences.getInstance();
                    await sp.setInt("idUser", state.loginModel.idUser);
                    await sp.setString("name", state.loginModel.name);
                    await sp.setString("email", state.loginModel.email);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => MainMenuPage())
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Username/password is wrong")));
                  }
                } else if (state is LoginError) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${state.message}")));
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Container(
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
                                _loginButton(context),
                                SizedBox(height: 10),
                                Text(
                                  "Or",
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
                  );
                }
              ),
            ),
          ),
        ),
    );
  }

}
