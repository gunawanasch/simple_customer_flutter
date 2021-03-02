import 'package:equatable/equatable.dart';
import 'package:simple_customer_flutter/model/login_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  List<Object> get props => null;
}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;
  const LoginSuccess(this.loginModel);
  @override
  List<Object> get props => [LoginModel];
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
  @override
  List<Object> get props => [message];
}