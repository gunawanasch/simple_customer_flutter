import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Login extends LoginEvent {
  final String email;
  final String password;

  const Login({
    @required this.email,
    @required this.password
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => "Login { email: $email, password: $password }";
}