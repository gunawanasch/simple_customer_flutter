import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_customer_flutter/bloc/register/register_bloc.dart';
import 'package:simple_customer_flutter/bloc/register/register_event.dart';
import 'package:simple_customer_flutter/bloc/register/register_state.dart';
import 'package:simple_customer_flutter/library/colors.dart';
import 'package:simple_customer_flutter/repository/register_repository.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _stateLoading = "stop";

  Widget _backImage() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 55,
        width: 55,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/images/ic_back.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameTextField() {
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
          hintText: "Name",
        ),
        controller: _nameController,
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

  Widget _registerButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(_nameController.text.trim().isEmpty || _emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Text("Please complete all field."),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          );
        } else {
          BlocProvider.of<RegisterBloc>(context).add(Register(
            name: _nameController.text,
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
                colors: [Blue1, Blue2])),
        child: setUpLoadingRegister(),
      ),
    );
  }

  Widget setUpLoadingRegister() {
    if (_stateLoading == "stop") {
      return Text(
        "Register",
        style: TextStyle(
          fontSize: 20,
          color: White,
        ),
      );
    } else if (_stateLoading == "loading") {
      return SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        child: BlocProvider(
          create: (context) => RegisterBloc(RegisterRepository()),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                setState(() {
                  _stateLoading = "loading";
                });
              }
              if (state is RegisterSuccess) {
                setState(() {
                  _stateLoading = "success";
                });
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.pop(context);
                });
              } else if (state is RegisterError) {
                setState(() {
                  _stateLoading = "stop";
                });
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("${state.message}"),
                ));
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 40),
                              _backImage(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      'Register',
                                      style: TextStyle(
                                        color: PrimaryColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    _nameTextField(),
                                    SizedBox(height: 20),
                                    _emailTextField(),
                                    SizedBox(height: 20),
                                    _passwordTextField(),
                                    SizedBox(height: 40),
                                    _registerButton(context),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ),
    );
  }

}
